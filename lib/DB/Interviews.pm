package lib::DB::Interviews;
use strict;
use warnings;
use Data::Dumper; 
use DBI;


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


sub add_interview{

	my ($self,$interview) = @_;	
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("INSERT INTO Interview
                       (date, 
						Interviewer1,
						Interviewer2,
						Interviewer3,
						Result,
						ProcessDescription,
						Candidat,
						HRManager )
                        values
                       (?,?,?,?,?,?,?,?)");
	$sth->execute($interview->{date},
					$interview->{interviewer1}->{id},
					$interview->{interviewer2}->{id},
					$interview->{interviewer3}->{id},
					$interview->{result},
					$interview->{process_description},
					$interview->{candidat}->{id},
					$interview->{hrmanager}->{id}					
	) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_interview_log("Added 1 Interview");
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
sub update_interview_by_id{
	
	my ($self,$id,$interview) = @_;
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("UPDATE Interview
                        	SET date = ?,
							Interviewer1 = ?,
							Interviewer2 = ?,
							Interviewer3 = ?,
							Result = ?,
							ProcessDescription = ?,
							Candidat = ?,
							HRManager = ?
							WHERE id= ?");

$sth->execute($interview->{date},
					$interview->{interviewer1}->{id},
					$interview->{interviewer2}->{id},
					$interview->{interviewer3}->{id},
					$interview->{result},
					$interview->{process_description},
					$interview->{candidat}->{id},
					$interview->{hrmanager}->{id}					
	) or die $DBI::errstr;

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_interview_log("We have " . $sth->rows . " Interviews updated with id: $id\n");
		$sth->finish();
}
sub delete_interview_by_id{
	
	my $self = shift;
	my $id = shift;
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("DELETE FROM Interview
                        WHERE id = ?");
	$sth->execute( $id ) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_interview_log("Deleted: " . $sth->rows . " Interview with id: $id\n");
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
