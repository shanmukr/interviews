use strict;
use warnings;
use Data::Dumper;

my @array1 = ( [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ] );
my @array2 = ( [ 9, 10, 11, 12 ], [ 13, 14, 15, 16 ] );
my @array3;

if ( scalar( @array1 ) == scalar(@array2)){
  foreach ( 0 .. scalar( @array1 ) - 1 ){
    #push( @array3, $array1[$_] + $array2[$_] );
    my $d = $array1[@$_[0]];
    print  "$d : $array2[$_]\n";
  }
  #print Dumper (\@array3);
}else{
  print "array size should be same\n"; 
}

__END__
my @a = ( 1 .. 10 );
my @b = ( 11 .. 20);
my @c;
if ( scalar( @a ) == scalar(@b)){
  foreach ( 0 .. scalar( @a ) - 1 ){
    push( @c, $a[$_] + $b[$_] );
  }
  print "@c\n";
}else{
  print "array size should be same\n"; 
}

__END__
my @array = ( [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ], [ 13, 14, 15, 16 ] );
my @aa = ();

foreach ( @array ){
  foreach ( @$_ ){
    push( @aa, $_ ); 
    #print "$_\n";
  }
}
print "@aa\n";


__END__
# my $size = @array;
# print "$size\n";


__END__
open( IN, "matrix.txt") or die "Error in file opening\n";
  while( <IN> ){
    my @ref = split( " ", $_ );
    push(@array, @ref);    
  }
close( IN );
