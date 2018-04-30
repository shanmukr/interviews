use strict;
use warnings;
use Data::Dumper;
use File::Copy;
use Cwd;

&dir("shanmukha");
# my $path = cwd;
# print "$path\n";

#mkdir "ff";
#rmdir "ff";

sub dir{
  my $dir = shift;
    opendir( DIR, $dir ) or die "Error in directory opening\n";
    foreach (readdir(DIR)){
      next if ( $_ =~ /\./);
      next if ( $_ =~ /\.\./);
      if( -d $_ ){
        chdir($_);
        my $path = getcwd;
        &dir($dir);
        print "$_ : directory\n";
      }else{
        print "$_ : file\n";
      }
    }
  closedir(DIR);
}