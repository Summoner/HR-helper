package lib::DB::Interviews;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB;
use lib::Diagnostic::Logger;

sub new{	
	my  $class = shift;
	my $self = {};
	bless($self,$class);
	return $self;
}
my $log = lib::Diagnostic::Logger->instance();
my $dbh = lib::DB->instance();

sub add_interview{

	my ($self,$interview) = @_;		
	
	$interview->{hrmanager}->{id} = 1 unless defined $interview->{hrmanager}->{id};
	$interview->{interviewer1}->{id} = 1 unless defined $interview->{interviewer1}->{id};
	$interview->{interviewer2}->{id} = 1 unless defined $interview->{interviewer2}->{id};
	$interview->{interviewer3}->{id} = 1 unless defined $interview->{interviewer3}->{id};
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
				
	)|| die $log->write_to_interview_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);	
	
	$log->write_to_interview_log("Added 1 Interview");
	$sth->finish();

}

sub get_interview_by_id{

	my $self = shift;
	my $id = shift;
	
	my $sth = $dbh->prepare("SELECT 
							Interview.id,Interview.date,
							i1.id,i1.forename,i1.surname,i1.phone_number,i1.email,
							i2.id,i2.forename,i2.surname,i2.phone_number,i2.email,
							i3.id,i3.forename,i3.surname,i3.phone_number,i3.email,
							Interview.Result,Interview.ProcessDescription,					   Candidate.id,Candidate.forename,Candidate.surname,Candidate.age,Candidate.children,Candidate.citizenship,Candidate.education,Candidate.email,
Candidate.expertise_areas,Candidate.foreign_lang,Candidate.marital_status,Candidate.phone_number,Candidate.position_apply,Candidate.prof_exp,
							HRManager.id,HRManager.forename,HRManager.surname,HRManager.phone_number,HRManager.email
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
							join HRManager
							on
							Interview.HRManager = HRManager.id
							WHERE Interview.id=?");
	$sth->execute( $id ) || die $log->write_to_interview_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);	

	if ($sth->rows >1 || $sth->rows == 0){
		
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
			$interview->{candidat}->{prof_exp},
			$interview->{hrmanager}->{id},
			$interview->{hrmanager}->{forename},
			$interview->{hrmanager}->{surname},
			$interview->{hrmanager}->{phone_number},
			$interview->{hrmanager}->{email}
								) = (@row);
	$sth->finish();
	return $interview;
}
sub update_interview_by_id{
	
	my ($self,$id,$interview) = @_;
	
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
					$interview->{hrmanager}->{id},
					$id					
	) || die $log->write_to_interview_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
		
		$log->write_to_interview_log("We have " . $sth->rows . " Interviews updated with id: $id");
		$sth->finish();
}
sub delete_interview_by_id{
	
	my $self = shift;
	my $id = shift;
	
	my $sth = $dbh->prepare("DELETE FROM Interview
                        WHERE id = ?");
	$sth->execute( $id ) || die $log->write_to_interview_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
	
	$log->write_to_interview_log("Deleted: " . $sth->rows . " Interview with id: $id");
	$sth->finish();
}

sub get_interviews_list{
	
	my $interviews = [];	
	my $self = shift;
	 	
	my $sth = $dbh->prepare("SELECT 
							Interview.id,Interview.date,
							i1.id,i1.forename,i1.surname,i1.phone_number,i1.email,
							i2.id,i2.forename,i2.surname,i2.phone_number,i2.email,
							i3.id,i3.forename,i3.surname,i3.phone_number,i3.email,
							Interview.Result,Interview.ProcessDescription,					   Candidate.id,Candidate.forename,Candidate.surname,Candidate.age,Candidate.children,Candidate.citizenship,Candidate.education,Candidate.email,
Candidate.expertise_areas,Candidate.foreign_lang,Candidate.marital_status,Candidate.phone_number,Candidate.position_apply,Candidate.prof_exp,
							HRManager.id,HRManager.forename,HRManager.surname,HRManager.phone_number,HRManager.email
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
							join HRManager
							on
							Interview.HRManager = HRManager.id");
	$sth->execute() || die $log->write_to_interview_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
		
	while (my @row = $sth->fetchrow_array()) {
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
			$interview->{candidat}->{prof_exp},
			$interview->{hrmanager}->{id},
			$interview->{hrmanager}->{forename},
			$interview->{hrmanager}->{surname},
			$interview->{hrmanager}->{phone_number},
			$interview->{hrmanager}->{email}) = (@row);
			push @$interviews,$interview;
   }
	$sth->finish();
	return $interviews;
}
1;
