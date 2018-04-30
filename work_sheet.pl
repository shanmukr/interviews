use strict;
use warnings;
use Data::Dumper;
use Excel::Writer::XLSX;

open( IN, "sample.xlsx" ) or die "Error in file opening\n";
  while( <IN> ){
    print "$_\n";
  }
close( IN )


__END__
print "Enter the range : ";
my $range = <stdin>;
chomp($range);
my @list = ( 0 .. $range );
my $size = @list;
$size -= 1;
 
my $workbook = Excel::Writer::XLSX->new('sample.xlsx');
my $worksheet = $workbook->add_worksheet();
#$worksheet->write("A1", "Matrix");
foreach my $v ( @list ){
  foreach ( 0 .. $size ){
    $worksheet->write($v, $_, ( $v.' , '.$_ ) );
  }
}
$workbook->close;