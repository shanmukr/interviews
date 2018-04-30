use strict;
use warnings;
use Data::Dumper;

my $count = 1;

print "Chose the below options : \n\t\t\t1 --> Add\n\t\t\t2 --> Substract\n\t\t\t3 --> Multiply\n\t\t\t4 --> Divsion\n\t\t\t5 --> Exit\n";
my $op = <stdin>;
chomp( $op );

print "Enter the range of the arguments : ";
my $range = <STDIN>;
chomp( $range );
my @array;

while( $count <= $range ){
  print "Enter the argument number $count : ";
  my $ip = <stdin>;
  chomp($ip);
  push( @array, $ip );
  $count++;
}

my $result = $op == 3 ? 1 : 0;

if ( $op == 5 ){
  exit;
}else{
  foreach ( @array ){
    if ( $op ==  1 ){ 
      $result += $_ ;
    }elsif( $op ==  2 ){
      $result -= $_; 
    }elsif( $op ==  3 ){
      $result *= $_;
    }elsif( $op ==  4 ){
    }
  }
}
print "$result\n";