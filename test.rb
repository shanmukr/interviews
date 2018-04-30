array = [ 0, 1 ]

c = 0
while( c <= ARGV[0].to_i )
  array << array[-1] + array[-2]
  c += 1
end

print "#{array}\n"

__END__
print "#{__FILE__}"
