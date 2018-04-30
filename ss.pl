use strict;
use warnings;

my $c = 0;
my $d = 0;
open(IN, "a.txt");
  foreach ( <IN> ){
    $d++;
    if( $_ =~ /EMP2017/gi){
	  $c = -1;
	}
	if( $_=~ /RRD2017/gi){
	  $c++;
	}
	if( $c == 1 ){
	  print "$d : $c\n";
	}
  }
close(IN);