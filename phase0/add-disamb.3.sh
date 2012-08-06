sync=/home/kuba/praca/kawu/morphosyntax/examples/Sync
data=/usr/kuba/NKJP-10/no-maca-guesser

for i in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"
do
    echo $i
    $sync ../nkjp-tagset.cfg $data/folds/test$i.plain $data/reana/test$i.plain $data/reana-disamb/test$i.plain
done
