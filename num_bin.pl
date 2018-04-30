use strict;
use warnings;
use POSIX;

print "Enter the Number : ";
my $a = <stdin>;
chomp($a);
my $c = 0;

while( $c <= ceil($a/2)){
  my $b = floor($a/2);
  print "$b\n";
  if( $b != 1 ){
    $a = $b;
  }elsif( $b == 0 ){
    exit;
  }
  $c++;
}