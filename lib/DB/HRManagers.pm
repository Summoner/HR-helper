package lib::DB::HRManagers;
use strict;
use warnings;
use Data::Dumper; 
use DBI;

#Class - repozitory for storing HRManagers

use lib::Entities::HRManager;

my $driver = "mysql"; 
my $database = "HR";
my $dsn = "DBI:$driver:database=$database";
my $userid = "HR";
my $password = "1";


#Constructor
sub new{	
	my  $class = shift;
	my $self = {};
	bless($self,$class);
	return $self;
}


sub add_hrmanager{

	my ($self,$hrmanager) = @_;	
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("INSERT INTO HRManager
                       (forename, 
						surname,
						phone_number,
						email )
                        values
                       (?,?,?,?)");
	$sth->execute($hrmanager->{forename},
					$hrmanager->{surname},
					$hrmanager->{phone_number},
					$hrmanager->{email}
	) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_hrmanager_log("Added 1 HRmanager");
	$sth->finish();

}

sub get_hrmanager_by_id{

	my $self = shift;
	my $id = shift;
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("SELECT 
							forename,
							surname,
							phone_number,
							email FROM HRManager WHERE id=?");
	$sth->execute( $id ) or die $DBI::errstr;

	if ($sth->rows >1 || $sth->rows == 0){

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_hrmanager_log("We have " . $sth->rows . " HRManagers with id: $id");
		return;
	}
	
	my @row = $sth->fetchrow_array();
	my $hrmanager = lib::Entities::HRManager->new();   	
   		   ($hrmanager->{forename},
			$hrmanager->{surname},
			$hrmanager->{phone_number},
			$hrmanager->{email}) = (@row);
	$sth->finish();
	return $hrmanager;
}
sub update_hrmanager_by_id{
	
	my ($self,$id,$hrmanager) = @_;
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("UPDATE HRManager
                        	SET forename = ?,
							surname = ?,
							phone_number = ?,
							email = ?
							WHERE id= ?");

$sth->execute($hrmanager->{forename},
			$hrmanager->{surname},
			$hrmanager->{phone_number},
			$hrmanager->{email},
			$id ) or die $DBI::errstr;

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_hrmanager_log("We have " . $sth->rows . " HRManagers updated with id: $id\n");
		$sth->finish();
}
sub delete_hrmanager_by_id{
	
	my $self = shift;
	my $id = shift;
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("DELETE FROM HRManager
                        WHERE id = ?");
	$sth->execute( $id ) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_hrmanager_log("Deleted: " . $sth->rows . " HRManagers with id: $id\n");
	$sth->finish();
}

sub get_hrmanagers_list{
	
	my $hrmanagers = [];	
	my $self = shift;
	
 	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("SELECT
							id,
							forename,
							surname,
							phone_number,
							email FROM HRManager");
	$sth->execute() or die $DBI::errstr;
		
	while (my @row = $sth->fetchrow_array()) {
			my $hrmanager = lib::Entities::HRManager->new();   	
   		   ($hrmanager->{id},
			$hrmanager->{forename},
			$hrmanager->{surname},
			$hrmanager->{phone_number},
			$hrmanager->{email}) = (@row);
			push @$hrmanagers,$hrmanager;
}
	$sth->finish();
	return $hrmanagers;
}
1;
