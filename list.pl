use strict;
use warnings;
use Data::Dumper;
use Cwd;
#use File::Copy;

opendir( DIR, "shanmukha" ) or die "Error in opening directory.";
  while( readdir(DIR)){
    #next if( $_ =~ /\./);
    #next if( $_ =~ /\.\./);
    print "$_\n";
    if( -f $_ ){
      print "$_ is file\n";
    }elsif( -d $_ ){
      print "$_ is directory\n";
    }
  }
closedir(DIR);