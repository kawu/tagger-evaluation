root=/mnt/storage/kuba/tagger_data
data=$root/no-maca-guesser
train_guesser=/home/kuba/praca/kawu/crf-guesser/examples/Train
guess=/home/kuba/praca/kawu/crf-guesser/examples/Guess
tagger=/home/kuba/praca/kawu/tagger/tagger
weak_lb=/home/kuba/praca/kawu/morphosyntax/examples/WeakLB

for i in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"
do
    echo $i

    # Construct training material.
    echo -n "" > $data/train/train$i.plain
    for j in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"
    do
	if [ $i != $j ]; then
	    echo "> "$j
	    cat $data/reana-disamb/test$j.plain >> $data/train/train$j.plain
	fi
    done

    # Train guesser and "guess" files.
    $train_guesser ../nkjp-tagset.cfg $data/train/train$i.plain "" $data/guessers/guesser$i.bin +RTS -N4
    $guess $data/guessers/guesser$i.bin ../nkjp-tagset.cfg $data/train/train$i.plain > $data/train-guess/train$i.plain
    $guess $data/guessers/guesser$i.bin ../nkjp-tagset.cfg $data/reana/test$i.plain > $data/reana-guess/test$i.plain

    # Train tagger and tag eval file.
    $tagger train ../nkjp-tagset.cfg $data/train-guess/train$i.plain -i 20 -b 50 -o $data/taggers/tagger$i.bin -w 4 +RTS -N4
    $tagger tag $data/taggers/tagger$i.bin < $data/reana-guess/test$i.plain > $data/reana-tagged/test$i.plain

    echo "\nSTATS\n"
    $weak_lb ../nkjp-tagset.cfg $data/folds/test$i.plain $data/reana-tagged/test$i.plain
    echo "\nEND STATS\n"

    # Delete the training material, we will not need it again.
    rm $data/train/train$i.plain
    rm $data/train-guess/train$i.plain
done
