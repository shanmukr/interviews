use strict;
use warnings;
use DBI;

my $driver = "mysql"; 
my $database = "tek";
my $dsn = "DBI:mysql:database=tek";
my $userid = "root";
my $password = "123456";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
my $sth = $dbh->prepare("create table test( id int(255), name varchar(255))");
$sth->execute();

#my $sth = $dbh->prepare("INSERT INTO TEST_TABLE (FIRST_NAME, LAST_NAME, SEX, AGE, INCOME ) values('john', 'poul', 'M', 30, 13000)");


