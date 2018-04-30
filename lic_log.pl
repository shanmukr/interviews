#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my ( %data, $user, $tool );

open( IN, "lic_log" ) or die "Error in file opening\n";
  foreach ( <IN> ){
    if( $_ =~m/Users\s+of\s+(\w+):\s+\(Total\s+of\s+(\d+).*;\s+Total\s+of\s+(\d+).*\)/gi){
      $tool = $1;
      $data{$tool}{'Number of issued Licences'} = $2;
      $data{$tool}{'Number of used Licences'} = $3;
    }elsif( $_ =~m/^\s+(\w+)\s+.*,\s+start\s+\w+\s+\d+\/\d+\s+\d+:\d+/gi){
      push(@{$data{$tool}{"users are"}}, $1);
    }
  }
close( IN );

print "Choose the below options : \n\t\t\t1 -> Tool\n\t\t\t2 -> User\n";
my $input = <stdin>;
chomp( $input );
print $input == 1 ? "Enter the Tool Name : " : "Enter the User Name : ";
my $option = <stdin>;
chomp( $option );

$input == 1 ? &tool_details($option) : &user_details($option);

sub tool_details{
  $option = shift;
  if( exists $data{$option}){
    foreach (keys($data{$option})){
      print "$_ : ", ref($data{$option}{$_}) eq 'ARRAY' ? @{$data{$option}{$_}} : $data{$option}{$_}," \n";
    }
  }else{
    print "The given $option was not exists\n";
  }
}

sub user_details{
  $option = shift;

  print "$option\n";
}
