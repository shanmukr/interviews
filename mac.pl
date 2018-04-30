use strict;
use warnings;
use Data::Dumper;

print "Enter the Input : ";
my $a = <stdin>;
chomp( $a );
#my @aa = split( "", $a );
my @new;
my $c = 0;

foreach ( split("", $a) ){
  if( $_  =~ m/\d/gi ){
    if($c == 3 ){
      push(@new, '-' );
      push(@new, $_ );
      $c = 0;
    }else{
      push(@new, $_ );
    }
    $c++;
  }
}
$a = join('', @new );

print "$a\n";