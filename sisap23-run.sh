#! /bin/bash
if [ x$1 == x300K ]; then
	conda run -n lmi python3 search/search.py --size=300K -bp 6 --dataset clip768v2 --emb emb
else
	conda run -n lmi python3 search/search.py --size=$1 --dataset clip768v2 --emb emb
fi
