# Tagger is working only with plain format for now, so we have to
# convert all xml files to plain files. You need corpus-get tool
# from corpus project:
# http://nlp.pwr.wroc.pl/redmine/projects/corpus2/wiki

data=/usr/kuba/NKJP-10
in=$data/xml/folds
out=$data/no-maca-guesser/folds

for i in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"
do
    echo $i
    corpus-get -o plain -t $in/test$i.xml > $out/test$i.plain
done
