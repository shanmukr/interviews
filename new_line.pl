use strict;
use warnings;
use Data::Dumper;

my( %book, $book_id, $option, $value, $desc, $description );

open( IN, "book_backup.xml" ) or die "Error in file opening\n";
  while( <IN> ){
    if( $_ =~ m/<book.*\"(.*)\"/gi){
      $book_id = $1;
    }elsif( $_ =~ m/<(desc\w+)>(.*\n)/gi){
      #print "$1 : $2\n";
    }elsif( $_ =~ m/<(\w+)>(.*)<\/\1>/gi){
      $option = $1;
      $value = $2; 
    }
    $book{$book_id}{$option} = $value;
  }
close( IN );

print Dumper(\%book);

__END__
   # <book id="bk104">
      # <author>Corets, Eva</author>
      # <title>Oberon's Legacy</title>
      # <genre>Fantasy</genre>
      # <price>5.95</price>
      # <publish_date>2001-03-10</publish_date>
      # <description>In post-apocalypse England,
      # the mysterious agent known only as Oberon helps to create a new life for the inhabitants of London.
      # Sequel to Maeve Ascendant.</description>
   # </book>