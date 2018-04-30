use strict;
use warnings;

my ( $a, $b, $c );

print "Enter the number : ";
$a = <stdin>;
chomp($a);

foreach ( 0 .. $a ){
  print "$_\n";<>;
}


__END__
$c = ($a * ($a + 1))/2;

foreach ( 1 .. $a ){
  $b += $_;
}
print "$b : $c \n";

__END__
my @a = qw( shanmukha shanmukhareddy shanmukhareddym shanmukham );

foreach ( @a ){
  if( $_ =~ m/shanmukha$/gi){
    print "$_\n";
  }
}

__END__
print "Enter the number : ";
my $a = <>;
chomp( $a );

my @a = ( 0 .. $a );
push( @a, reverse(@a) );

print "@a\n";

__END__
my $a = 10;
my $b = '20.4530';
my $c = $a + $b;

print "$c\n";