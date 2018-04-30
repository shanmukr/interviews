use warnings;
use strict;

print "Enter the Valid Input : ";
my $input = <>;
chomp($input);
my ( @array, $length );

if(){
  print "Matched\n";
}else{
  print "Not matched\n";
}

__END__
if( $input =~m/(^[1-9]\d+\.^[1-9]\d+\..*\.[1-9]\d+$)/){
  @array = split(".", $1);
  foreach( @array ){
    if( $_ =~ m/0\d+/gi){
      if( $length > length($_)){
        if ( $_ < 1.5*length($_)){
          print "Matched\n";
        }else{
          print "Not Matched\n";
        } 
      }else{
        print "Not Matched\n";
      }    
    }else{
      print "Not Matched\n";
    }
  }
}else{
  print "Not Matched\n";
}