package lib::DB;
use strict;
use warnings;
use Data::Dumper; 
use DBI;
use base 'Class::Singleton';
use lib::Diagnostic::Logger;


sub _new_instance{
my $class = shift;
my $self = bless {},$class;
my $driver = shift || "mysql"; 
my $database = shift || "HR";
my $dsn = "DBI:$driver:database=$database";
my $userid = shift || "HR";
my $password = shift || "1";
$self = DBI->connect($dsn, $userid, $password ) || die "Cannot connect to database: $DBI::errstr";
return $self;	
}

1;
