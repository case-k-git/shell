echo "説明：ファイル一括移動ツール"
echo "移動先ディレクトリのファイルパスを入力してください"
echo "カレントディレクトリ:"
pwd
read path
echo "該当する操作を入力して下さい(1 or 2)"
echo "1.ファイル名内に入力した文字を含むファイルを移動"
echo "2.ファイル内の文章に入力した文字を含むファイルを移動"
read ChoseNumber
echo "文字を入力してください"
read move_word

if [ $ChoseNumber -eq 1 ]; then
    echo "移動対象ファイルを表示"
    find ./ -name "*${move_word}*"
    echo "表示したファイルを移動させてよろしいですか？(y/n)"
    read yesno 
    if [ ${yesno} = "y" ]; then
        find ./ -name "*${move_word}*" | xargs -I% mv % $path
        echo "${path}への移動が完了しました"
    elif [ ${yesno} = "n" ]; then
        echo "移動させませんでした"
        :
    fi
elif [ $ChoseNumber -eq 2 ]; then
    echo "移動対象ファイルを表示(時間がかかります)"
    grep $move_word  -rl ./
        echo "表示したファイルを移動させてよろしいですか？(y/n)"
    read yesno
    if [ ${yesno} = "y" ]; then
        grep $move_word  -rl ./ | xargs -I% mv % $path
        echo "${path}への移動が完了しました"
    elif [ ${yesno} = "n" ]; then
        echo "移動させませんでした"
        :
    fi
    :
fi

