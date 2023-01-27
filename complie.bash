for i in $(ls fennel); do
    fennel -c fennel/$i > lua/$(echo $i|sed 's/.fnl$/.lua/')
done
