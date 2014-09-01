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

sub get_interview_by_id{

	my $self = shift;
	my $id = shift;
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("SELECT 
							Interview.id,Interview.date,
							i1.id,i1.forename,i1.surname,i1.phone_number,i1.email,
							i2.id,i2.forename,i2.surname,i2.phone_number,i2.email,
							i3.id,i3.forename,i3.surname,i3.phone_number,i3.email,
							Interview.Result,Interview.ProcessDescription,					   Candidate.id,Candidate.forename,Candidate.surname,Candidate.age,Candidate.children,Candidate.citizenship,Candidate.education,Candidate.email,
Candidate.expertise_areas,Candidate.foreign_lang,Candidate.marital_status,Candidate.phone_number,Candidate.position_apply,Candidate.prof_exp
							from 
							Interview join Interviewer i1 
							on
							Interview.Interviewer1 = i1.id
							join Interviewer i2
							on
							Interview.Interviewer2 = i2.id
							join Interviewer i3
							on
							Interview.Interviewer3 = i3.id
							join Candidate
							on
							Interview.Candidat = Candidate.id
							WHERE Interview.id=?");
	$sth->execute( $id ) or die $DBI::errstr;

	if ($sth->rows >1 || $sth->rows == 0){

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_interviewer_log("We have " . $sth->rows . " Interviews with id: $id");
		return;
	}
	
	my @row = $sth->fetchrow_array();
	my $interview = lib::Entities::Interview->new();   	
   		   ($interview->{id},
			$interview->{date},
			$interview->{interviewer1}->{id},
			$interview->{interviewer1}->{forename},
			$interview->{interviewer1}->{surname},
			$interview->{interviewer1}->{phone_number},
			$interview->{interviewer1}->{email},
			$interview->{interviewer2}->{id},
			$interview->{interviewer2}->{forename},
			$interview->{interviewer2}->{surname},
			$interview->{interviewer2}->{phone_number},
			$interview->{interviewer2}->{email},
			$interview->{interviewer3}->{id},
			$interview->{interviewer3}->{forename},
			$interview->{interviewer3}->{surname},
			$interview->{interviewer3}->{phone_number},
			$interview->{interviewer3}->{email},
			$interview->{result},
			$interview->{process_description},
			$interview->{candidat}->{id},
			$interview->{candidat}->{forename},
			$interview->{candidat}->{surname},
			$interview->{candidat}->{age},
			$interview->{candidat}->{children},
			$interview->{candidat}->{citizenship},
			$interview->{candidat}->{education},
			$interview->{candidat}->{email},
			$interview->{candidat}->{expertise_areas},
			$interview->{candidat}->{foreign_lang},
			$interview->{candidat}->{marital_status},
			$interview->{candidat}->{phone_number},
			$interview->{candidat}->{position_apply},
			$interview->{candidat}->{prof_exp}
								) = (@row);
	$sth->finish();
	return $interview;
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
