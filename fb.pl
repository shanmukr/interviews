use strict;
use warnings;

open(IN, "fb.pl") or die "Error in file opening\n";
  foreach ( <IN> ){
    #print;
  }
  my @cc = seek( IN, 2, 5);
  print "@cc\n";
close(IN);

__END__

while ("True"){
  print "terst\n";
}

__END__
my @a = ( 1 .. 10);
my @c = ( 'r', 'e', 'd' );
my @b = splice(@a, 1, 3, 99);
print "@b : @a\n";


__END__
my $a = "shanmukha";

#my $b = reverse(lcfirst(ucfirst(lc(uc($a))))); #index($a, "a");
#my $b = substr($a, 1,3, "ms");


__END__
my @a = ( 1, 2, 3 );
my @b = ( 4, 5, 6, 4 );

@a, @b = @b, @a;
#push(@a, @b);

print "a is : @a\nb is : @b\n";

__END__
my $a = 1;
my $b = "2gjf";

my $c = $a . $b;

print "$c\n";