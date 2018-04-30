#!/usr/bin/perl 

open(FILES, ">data.csv");
  print FILES "Code,Path,File Name,Archive Days, Power Stream Version\n";
  open(IN, "paths1.txt");
    foreach $path (<IN>){
      if($path =~ s/(.*\/(.*)\/)\n/$1/gi){}
      $code = $2;
      if (-e $path ){
        $path = $path."parm/";
        chdir($path);
        opendir(DIR, $path) or die "$!\n";
          while($file = readdir(DIR)){
            if( $file =~m/.*xml/){
              open(FH, $file);
                foreach(<FH>){
                  if( $_ =~m/(.*arcdays.*\"(\d+))/){
                    $arc = $2;
                  }
                  if( $_ =~/\s+ver\=\"(\w+|\d+)\"/gi){
                    $pv = $1;
                  }
                  if ($arc && $pv) {
                    print FILES "$code,$path,$file,$arc,$pv\n";
                    undef $arc;
                    undef $pv;
                  }
                }
              close(FH);
            }
          }
        closedir(DIR);
      }else{
        print "$path is not exists\n";
      }
    }
  close(IN);
close(FILES);
