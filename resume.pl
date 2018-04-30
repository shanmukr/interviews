use strict;
use warnings;
use Data::Dumper;


my ( %resume, $project_name, $project_desc, $project_tech, $project_resp, $project_platform, $key, $value );

open( IN, "shanmukhareddy_resume.json" ) or die "Error in file opening\n";
  while( <IN> ){
    if( $_ =~ m/\"Project\s+Name\".*\"(.*)\"/gi ){
      $project_name = $1;
    }elsif( $_ =~ m/\"Description\"\s+.*\"(.*)\"/gi ){
      $project_desc = $1;
    }elsif( $_ =~ m/\"Respon\w+\"\s+.*\"(.*)\"/gi){
      $project_resp = $1;
    }elsif( $_ =~ m/\"Plat\w+\"\s+.*\"(.*)\"/gi){
      $project_platform = $1;
    }elsif( $_ =~m/\"Technology\"\s+.*\"(.*)\"/gi){
      $project_tech = $1;
    }elsif( $_ =~ m/\"(.*)\"\s+.*\"(.*)\"/gi ){
      $key = $1;
      $value = $2;
    }
    $resume{$key} = $value;
    $resume{$project_name}{"Description"} = $project_desc;
    $resume{$project_name}{"Responsibilities"} = [split(',', $project_resp)];
    $resume{$project_name}{"Platform"} = $project_platform;
    $resume{$project_name}{"technologies"} = [split(',', $project_tech)];
  }
close(IN);

print Dumper (\%resume);


__END__
my $a = <stdin>;
chomp($a);
print "$a\n";