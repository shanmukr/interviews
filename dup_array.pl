use strict;
use warnings;
use Data::Dumper;

my $a = "khajana";

if ( my @d = $a =~ m/(.)a/gi){
  print "@d\n";
}



__END__
sub test{
  my $a = shift;
  my $b = shift;
  return $a+$b;
}

my $r = &test( 5, 6, 8, 9 );
print "$r\n";

__END__
my @aa = qw( apple APPLE Apple APPle ball Ball BALL Cat CAT CaT Dog );
my %hash;

#%hash = map+( lc($_) => 1 ), @aa;

map( $hash{lc($_)}++, @aa);
foreach (keys %hash){
  my $b = $hash{$_} > 1 ? "$_ having Dumplicates" : "$_ not having Duplicates";
  print "$b\n";
}

#print Dumper(\%hash);

__END__
#my @tmp = map( lc($_), @aa );
foreach ( @aa ){
  $hash{lc($_)}++;
}

print Dumper(\%hash);