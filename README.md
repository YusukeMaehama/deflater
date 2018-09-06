# deflater
deflate/inflate cui

cat input.dat | ruby deflater.rb -c > deflated.dat
cat deflated.dat | ruby deflater -d
