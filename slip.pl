use strict;
use warnings;
use Data::Dumper;

my (@array, $count, $size, @temp );
$count = 1;

@array = ( 0 .. 10 );
$size = @array;
my $aaa = shift( @array );
push(@temp, splice(@array, 0, 1 ));
#push(@temp, splice(@array, 0, 2 ));

print "$aaa : @temp : @array\n";


#while( $count <= 5 ){
#  $count++;
#}
#print Dumper ( \@temp );


__END__
while(){
  
  $c++;
}

#print Dumper(\@b);