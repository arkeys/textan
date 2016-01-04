require 'pp'

$wkv = Hash.new

f='/path/to/file'

$last = ''
File.open(f).readlines.each do |line|
	arr = line.downcase.encode('UTF-8', :invalid => :replace).split(/\W+/)
	arr.each do |w|
		p = $last+" "+w 
		if $wkv.key?p then
			$wkv[p] = $wkv[p] + 1
		else
			$wkv[p] = 1
		end
		$last = w 
	end
end

sh = Hash[$wkv.sort_by{|k, v| v}.reverse]

pp sh
