use strict;
use warnings;
use Data::Dumper;
use POSIX;

my @list = ( 1 .. 10, 15 .. 55, 100 .. 289, 500 .. 5000, 6000 .. 9000, 10000 .. 15000 );

print "Enter the number : ";
my $number = <>;
chomp($number);

my $size = @list;

sub array_size{
  $size = shift;
  return ceil($size/2);
}
#&array_size( $size );
my $local;

print "$size\n";

while (){
  $local = &array_size( $size );
  if( $number == $list[$local]){
    print "exists\n";
  }elsif( $number > $size ){
    $size += $local;
    print "$size : $local\n";
  }elsif( $number < $size ){
    $local = &array_size( $local );
    print "$size : $local\n";
  }
  exit;
}
__END__
my $index = index(@list, $number);
if ( grep{ $number == $_ } @list){
  print "$number was Exists in the list at $index position\n";
}else{
  print "$number was not Exists in the list\n";
}


__END__
my $size = @list;

sub array_size{
  $size = shift;
  return ceil($size/2);
}
$size = &array_size( $size );
