# We use maca tool to perform re-analisys on the entire data set:
# http://nlp.pwr.wroc.pl/redmine/projects/libpltagger/wiki
# You need also the morfeusz tool:
# http://sgjp.pl/morfeusz/

data=/usr/kuba/NKJP-10/no-maca-guesser

# Set appropriate path to your binary morfeusz installation:
export LD_LIBRARY_PATH=/opt/morfeusz

for i in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"
do
    echo $i
    # We do not use TaKIPI guesser!
    maca-analyse -q morfeusz-nkjp-official -o plain < $data/folds/test$i.txt > $data/reana/test$i.plain
done
