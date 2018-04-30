#!/usr/bin/perl -w
use strict;

my @a = (1 .. 10 );
my $c = 0;
my $d = 2;

while( $c <= scalar(@a)){
  print "$a[$d]\n";
  $c++;
  print "c is : $c\n";
  $c = $c + $d;
  $d++;
  print "c is : $c\n";
}


__END__
my $a = "khajana";
if( my @a = $a =~m/(\w)a/gi ){
  print "@a\n";
}
