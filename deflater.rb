#!/usr/bin/env ruby

require 'optparse'
require 'zlib'

decompress = nil
compress = nil

opt = OptionParser.new
opt.banner = "Usage: cat input.dat | deflater.rb [options] > output.dat"
opt.on('-d', "--decompress") do decompress = true end
opt.on('-c', "--compress") do  compress = true end
opt.parse!(ARGV)

if (decompress.nil? && compress.nil?) || decompress && compress
  opt.help.display; exit
end

src = STDIN.read

if (src.length == 0 )
  raise "Input is empty!!"
  exit 1
end

if (decompress)
  inflater = Zlib::Inflate.new
  print inflater.inflate(src)
else
  deflater = Zlib::Deflate.new
  print deflater.deflate(src, Zlib::FINISH)
end

exit 0
