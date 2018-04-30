#!/usr/bin/perl

##############################################################################################################################################################
##############################################################################################################################################################
############# Description     :   The Processes for Retaining/Archiving/Tape Backing up/Calling back Tape files for Market Zone Operations    ################ 
############# Technology      :   PERL    ####################################################################################################################   
############# INPUTS          :   NO      #################################################################################################################### 
############# OUTPUTS         :   NO      ####################################################################################################################
##############################################################################################################################################################
##############################################################################################################################################################
 
use warnings;
use strict;
use File::Copy qw( move );
use Archive::Zip;
use Cwd qw( abs_path );
use Getopt::Long;

my ( $b, $c, @a, @path, $dir, $in, $des, $match, $cur_path, $month, $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst, $tar );
( $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst ) = localtime( time );
@a = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);

GetOptions ( "source=s" => \$b,
	         "destination=s" => \$c,
	        ) or die "\nError in Command line options\n\n\t\t\t       --> HELP <--\n\n\t\t\tUse -d for destination path\n\n\t\t\tUse -s for source path\n\n";

if ( defined $b ) {	
	if ( -d $b ){ $in = $b } 
	else {
		print "\nThe given source path '$b' is not exists\n"; 
		exit;
	}	
} else { 
	print "\n\tPass the valid arguments\n\n\t\t\t       --> HELP <--\n\n\t\t\tUse -d for destination path\n\n\t\t\tUse -s for source path\n\n";
	exit;	
}

if ( defined $c ) {
	if ( -d $c ){ $des = $c } 
	else {
		print "\nThe given Destination path '$c' is not exists\n";
		exit;
	}	
} else { 
	print "\n\tPass the valid arguments\n\n\t\t\t       --> HELP <--\n\n\t\t\tUse -d for destination path\n\n\t\t\tUse -s for source path\n\n";
	exit;
}
			
$month = $a[ $mon ];
$year +=1900;
$match = $month."_".$year;
$cur_path = abs_path();

opendir ( DIR, $in ) or die "Error in Dir opening\n";
	chdir $in;
	while ( ( $dir = readdir( DIR ) ) ) {
		next if ( $dir =~m/\./gi || $dir =~m/\.\./gi || $dir eq $match );
		if ( $dir =~m/\w+\_\d+/gi ){
			$tar = Archive::Zip->new();
			$tar->addTree( "$dir" );
			$tar->writeToFileNamed( "$dir.zip" );
			move "$dir.zip", $des or die "error in moving\n";
			print "\n$dir.zip is placed at '$des'\n";
		} elsif ( $dir =~m/\w+/gi ) {
			print "\nwrongly placed the directory $dir.\n\n\n\t\t\t   --> CAUTION <--\n\n\t\tRemove the Directory '$dir' here\n";
		} else {
			print "not exists\n";
		}
	}
close ( DIR );
chdir $cur_path;	
