use strict;
use warnings;
use POSIX;
use Data::Dumper;
use Cwd;


#Rhombus

my $input = <stdin>;
chomp($input);
my @a = ( 1 .. $input );
my @temp = ();

my $c = 1;
my $d = 1;
while( $c <= ceil($input/2)){
  foreach ( 1 .. ceil($input/4)){
    while($d <= $_ ){
      @temp = shift(@a);
      $d++
    }
    print "@temp\n";
  }
  $c++;
}

__END__
my $path = "C:\\Users\\shanreddy\\Desktop\\shanmukr\\";

op_dir( $path );

sub op_dir{
  $path = shift;
  opendir( DIR, $path) or die "Error in dir opening\n";
    foreach ( readdir(DIR) ){
      print "$path\n";<>;
      next if ($_ =~m/\./ | $_ =~m/\.\./ ); 
      unless( -f $_ ){
        print "$_ : $path\n";
        op_dir($_);
      }else{
        print "$_ is a file: $path\n";
      }
    }
  closedir(DIR);
}

__END__
print Dumper(\%INC);

__END__
my @a=(1..100);
my $c=0;
my $n=1;
while($c<=$#a+1){
  print"$a[$c]\n";
  $c++;
  $c=$c+$n;
  $n++;
 }


=head
my @array = ( 1 .. 50 );
my @a = ();
my $count = 1;
while( $count <= $#array+1 ){
  push(@a, shift(@array));
  foreach( 1 .. $count ){
    shift(@array);
  }
  $count++;
}

print "@a\n";
=cut
__END__
# Rhombus

print "Enter the Number : "
my $range = <input>;
chomp( $range );




__END__
# #prime
# my $input = <stdin>;
# chomp($input);

# my $c = 2;
# my $flag = 0;
# while( $c <= ceil($input/2) ){
  # if ( $input % $c == 0 ){
    # print "$c\n";
    # $flag = 1;
    # last;
  # }
  # $c++;
# }

# print $flag == 0 ? "$input is not a prime number\n" : "$input is not a prime number\n";

__END__
#ipv4
print "Enter the ipv4 : ";
my $input = <stdin>;
chomp($input);

if( $input =~ m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/gi ){
  if ( $1 <= 255 && $2 <= 255 && $3 <= 255 && $4 <= 255 ){
    print "$input is valid ip\n";
  }else{
    print "$input is not valid\n";
  }
}else{
  print "$input is not valid\n";
}

__END__
#pan validation
print "Enter the pan number : ";
my $input = <stdin>; 
chomp($input);

if( $input =~m/\w{5}\d{4}\w/gi){
  print "$input is valid\n";
}else{
  print "$input is invalid\n";
}
__END__

#FB Series
my @a = ( 0, 1 );
print "Enter the range : ";
my $range = <stdin>;
chomp($range);
my $c = 0;

while( $c <= $range ){
  push(@a, $a[$#a]+$a[$#a-1]);
  $c++;
}

print "@a\n";