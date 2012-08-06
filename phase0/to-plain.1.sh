# Tagger is working only with plain format for now, so we have to
# convert all xml files to plain files. You need corpus-get tool
# from corpus project:
# http://nlp.pwr.wroc.pl/redmine/projects/corpus2/wiki

nkjp=/usr/kuba/NKJP-10

for i in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"
do
    echo $i
    cp $nkjp/xml/folds/test$i.txt $nkjp/no-maca-guesser/folds/test$i.txt
    corpus-get -o plain -t nkjp $nkjp/xml/folds/test$i.xml > $nkjp/no-maca-guesser/folds/test$i.plain
done
