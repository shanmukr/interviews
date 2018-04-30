use strict;
use warnings;

sub test{
  print  "test\n";
  sub test1{
    print  "test1\n";
  }
}

&test();