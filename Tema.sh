#!/bin/sh

function jsonValue() {

    KEY=$1

    num=$2

    awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p

}


if [ $# -eq 0 ]; then
	

echo -e "" $red
echo "         =========================================== "
echo "	       		                                   "
echo "                  _/_/_/_/    _/_/_/  _/_/_/_/_/     "
echo "                 _/        _/            _/          "
echo "                _/_/_/    _/            _/           "
echo "               _/        _/            _/            "   
echo "              _/_/_/_/    _/_/_/      _/             "
echo "                                                     "
echo "         Termux Theme by:ECT // Jgn Sembarang Remake "
echo "         =========================================== "
    echo -e "" $green
    echo Cara Gunain:Baca Di OA Goblok
    echo             Hehe Canda :b
    echo
    echo 1.Buka Termuxnya
    echo 2.ketik: . Tema.sh spasi nama tema
    echo 3.Contoh: . Tema.sh neon
    echo
    echo

    echo -e $blue "Berikut Daftar Temanya:" 
    echo ""

    curl -k -s "https://api.github.com/repos/termux/termux-styling/contents/app/src/main/assets/colors"|jsonValue name|sed 's/.properties//g'|sed 's/ //g'

else

    cd ~

    mkdir -p .termux

    curl -k -s "https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/$1.properties" > ~/.termux/colors.properties

    termux-reload-settings

fi

