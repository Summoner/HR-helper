package lib::DB::Interviewers;
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


sub add_interviewer{

	my ($self,$interviewer) = @_;	
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("INSERT INTO Interviewer
                       (forename, 
						surname,
						phone_number,
						email )
                        values
                       (?,?,?,?)");
	$sth->execute($interviewer->{forename},
					$interviewer->{surname},
					$interviewer->{phone_number},
					$interviewer->{email}
	) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_interviewer_log("Added 1 Interviewer");
	$sth->finish();

}

sub get_interviewer_by_id{

	my $self = shift;
	my $id = shift;
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("SELECT 
							forename,
							surname,
							phone_number,
							email FROM Interviewer WHERE id=?");
	$sth->execute( $id ) or die $DBI::errstr;

	if ($sth->rows >1 || $sth->rows == 0){

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_interviewer_log("We have " . $sth->rows . " Interviewers with id: $id");
		return;
	}
	
	my @row = $sth->fetchrow_array();
	my $interviewer = lib::Entities::Interviewer->new();   	
   		   ($interviewer->{forename},
			$interviewer->{surname},
			$interviewer->{phone_number},
			$interviewer->{email}) = (@row);
	$sth->finish();
	return $interviewer;
}
sub update_interviewer_by_id{
	
	my ($self,$id,$interviewer) = @_;
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("UPDATE Interviewer
                        	SET forename = ?,
							surname = ?,
							phone_number = ?,
							email = ?
							WHERE id= ?");

$sth->execute($interviewer->{forename},
			$interviewer->{surname},
			$interviewer->{phone_number},
			$interviewer->{email},
			$id ) or die $DBI::errstr;

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_interviewer_log("We have " . $sth->rows . " Interviewers updated with id: $id\n");
		$sth->finish();
}
sub delete_interviewer_by_id{
	
	my $self = shift;
	my $id = shift;
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("DELETE FROM Interviewer
                        WHERE id = ?");
	$sth->execute( $id ) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_interviewer_log("Deleted: " . $sth->rows . " Interviewer with id: $id\n");
	$sth->finish();
}

sub get_interviewers_list{
	
	my $interviewers = [];	
	my $self = shift;
	
 	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("SELECT
							id,
							forename,
							surname,
							phone_number,
							email FROM Interviewer");
	$sth->execute() or die $DBI::errstr;
		
	while (my @row = $sth->fetchrow_array()) {
			my $interviewer = lib::Entities::Interviewer->new();   	
   		   ($interviewer->{id},
			$interviewer->{forename},
			$interviewer->{surname},
			$interviewer->{phone_number},
			$interviewer->{email}) = (@row);
			push @$interviewers,$interviewer;
}
	$sth->finish();
	return $interviewers;
}
1;
