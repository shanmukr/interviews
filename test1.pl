use strict;
use warnings;
use Data::Dumper;

my $a = "apple APPLE Apple APPle ball Ball BALL Cat CAT CaT Dog HAt key Elephant fan fun mouse";
my @list = grep( {/^\w{4}$/} qw(apple APPLE Apple APPle ball Ball BALL Cat CAT CaT Dog HAt key Elephant fan fun mouse));

print "@list\n";

__END__
my @array = split(" ", $a);

foreach ( @array ){
  if( $_ =~ m/^\w{4}$/){
    print "$_\n";
  }
}