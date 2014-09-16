package lib::DAL::Interviewer;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB;
use lib::Diagnostic::Logger;
use lib::Entities::Interviewer;
use base 'lib::DAL';

my $log = lib::Diagnostic::Logger->instance();
my $dbh = lib::DB->instance();

sub new{	
	my  $class = shift;
	my $self = {};
	bless($self,$class);
	return $self;
}


sub add{

	my ($self,$interviewer) = @_;		

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
	) || die $log->write_to_interviewer_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
	
	$log->write_to_interviewer_log("Added 1 Interviewer");
	$sth->finish();

}

sub get_by_id{

	my $self = shift;
	my $id = shift;
	
	my $sth = $dbh->prepare("SELECT 
							forename,
							surname,
							phone_number,
							email FROM Interviewer WHERE id=?");
	$sth->execute( $id ) || die $log->write_to_interviewer_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);

	if ($sth->rows >1 || $sth->rows == 0){

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
sub update_by_id{
	
	my ($self,$id,$interviewer) = @_;
		
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
			$id ) || die $log->write_to_interviewer_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);

		$log->write_to_interviewer_log("We have " . $sth->rows . " Interviewers updated with id: $id");
		$sth->finish();
}
sub delete_by_id{
	
	my $self = shift;
	my $id = shift;
	
	my $sth = $dbh->prepare("DELETE FROM Interviewer
                        WHERE id = ?");
	$sth->execute( $id ) || die $log->write_to_interviewer_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
	$log->write_to_interviewer_log("Deleted: " . $sth->rows . " Interviewer with id: $id");
	$sth->finish();
}

sub get_list{
	
	my $interviewers = [];	
	my $self = shift;
	
 	my $sth = $dbh->prepare("SELECT
							id,
							forename,
							surname,
							phone_number,
							email FROM Interviewer");
	$sth->execute() || die $log->write_to_interviewer_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);

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
