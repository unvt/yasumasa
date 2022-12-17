require './constants.rb'
require 'open3'

def tile_urls(t, z)
  cmd = <<-EOS
curl https://maps.gsi.go.jp/xyz/#{t}/mokuroku.csv.gz | gzcat | grep ^#{z}/
  EOS
  Open3.popen3(cmd) {|i, o, e, s|
    o.each {|l|
      r = l.strip.split(',')
      yield "https://maps.gsi.go.jp/xyz/#{t}/#{r[0]}"
    }
  }
end

def main(t, z)
  cmd = <<-EOS
| parallel --line-buffer 'curl --silent {} | tippecanoe-json-tool'
  EOS
  open(cmd, 'w') {|w|
    tile_urls(t, z) {|tile_url|
      w.print "#{tile_url}\n"
    }
  }
end

if __FILE__ == $0
  $t = ARGV[0] || $t
  $z = (ARGV[1] || $z).to_i
  main($t, $z)
end
