#!/usr/bin/perl
use strict;
use warnings;
use Excel::Writer::XLSX;
use Spreadsheet::Read qw(ReadData);
use Data::Dumper;


my $book = ReadData ('book.xlsx');
print $book->[1]{B1},"\n";

#print Dumper($book);


__END__ 
my $workbook  = Excel::Writer::XLSX->new( 'new.xlsx' );

print "$workbook : test\n";


my $worksheet = $workbook->add_worksheet();
 
my @data_for_row = (1, 2, 3);
my @table = (
    [4, 5],
	[6, 7],
);
my @data_for_column = (10, 11, 12);
 
 
$worksheet->write( "A1", "Hi Excel!" );
$worksheet->write( "A2", "second row" );
 
$worksheet->write( "A3", \@data_for_row );
$worksheet->write( 4, 0, \@table );
$worksheet->write( 0, 4, [ \@data_for_column ] );
 
$workbook->close;