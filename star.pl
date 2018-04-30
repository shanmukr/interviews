use warnings;
use strict;

my $a = "khajana";
if ($a=~s/([ha])/$1/gi){
  print "$a\n";
}
__END__
my $c = 1;
open(IN, "a.txt");
  foreach (<IN>){
    #if($_ =~m/([\w*\d*][\*\+\.\\\/].*?@\w+?\.\w+|\w+@\w+\.\w+)/gi){
	if( $_ =~m/([a-zA-Z0-9\._\*\+\\\/\$\%\^\&\-\!\@\#\?]+@\w+\.\w+)/gi){
	  print "$c : $1\n";
	  $c++;
	}else{
	  print "$_\n";
	}
  }
close(IN);

__END__
my %hash = ();
open(IN, "emails.txt");
  foreach (<IN>){
    $hash{$_}++
  }
close(IN);

my $c = 1;
foreach (keys(%hash)){
  if($hash{$_} > 1){
    print "$c : $_\n";
	$c++;
  }
}

=from

=end

__END__
  open(OUT, ">>emails.txt");
  foreach (<IN>){
    #if($_ =~m/([\w*\d*][\*\+\.\\\/].*?@\w+?\.\w+|\w+@\w+\.\w+)/gi){
	if( $_ =~m/([a-zA-Z0-9\._\*\+\\\/\$\%\^\&\-\!\@\#\?]+@\w+\.\w+)/gi){
	  print OUT "$1\n";
	}
  }
  close(OUT);
close(IN);

#H.A.B.T.M in mysql
#select a.patient_name, a.id, b.name, b.id from patients a , doctors b,  appointments c where c.patient_id=a.id and c.doct_id=b.id and b.id=1;
__END__
my $a = "|| g*********\@test.com || i am";

my $b = substr($a, 3, 4);
print "$b\n";

__END__
if ( $a =~m/(\w+\*.*?@\w+\.\w+)\s+/gi){
  print "$1\n";
}
