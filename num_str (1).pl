#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my %hash = ( 1 => "one", 2 => "two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine" );
my %hash1 = ( 1 => "ten", 2 => "twenty", 3 => "Thirty", 4 => "Fourty", 5 => "Fivefy", 6 => "Sixty", 7 => "Seventy", 8 => "Eighty", 9 => "Ninety" );

my $input  = <stdin>;
chomp( $input );
my @num = split("", $input);
my $size = @num;

if( $size == 1 ){
  print "$hash{$input}\n";
}elsif( $size == 2 ){
  print $hash1{$num[0]}." ".$hash{$num[1]},"\n";
}elsif( $size == 3 ){
  print $hash{$num[0]}." "."Hundred and ".$hash1{$num[1]}." ".$hash{$num[2]},"\n";
}

