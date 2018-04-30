use strict;
use warnings;
use Data::Dumper;

my $a = "khajana";
my $b = "malabar";
($a, $b) = ( $b, $a );

print "$a : $b\n";

__END__
chomp($a);
print "chomp :$a:aa\n";
chop($a);
print "chop :$a:aa\n";

__END__
if($a =~m /^(\w+)a(\w+)/){
  print "$1\n";
}

__END__
my @lines = ();

open( IN, "book.xml" ) or die "Error in file opening\n";
  while( <IN> ){
    if( $_ =~ s/bk\d+/bk100/gi){
      push(@lines, $_);
    }else{
      push(@lines, $_);
    }
  }
close( IN );

open(OUT, ">book.xml") or die "Error in file creating\n";
  print OUT @lines;
close( OUT );