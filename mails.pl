use strict;
use warnings;
use Data::Dumper;

my (@list, $mails );

open(IN, "mails.txt") or die "Error in file opening\n";
  $mails = <IN>;
  @list = split( ";", $mails );
close(IN);
#print Dumper(\@list);

unless( -e "sorted_mails.txt" ){
  open(OUT, ">sorted_mails.txt");
    foreach ( @list ){
      print OUT "$_\n";
    }
  close(OUT);
}