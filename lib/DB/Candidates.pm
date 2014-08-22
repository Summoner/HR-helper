package lib::DB::Candidates;
use strict;
use warnings;
use Data::Dumper; 
use DBI;

#Class - repozitory for storing Candidates

use lib::Entities::Candidat;

my $driver = "mysql"; 
my $database = "HR";
my $dsn = "DBI:$driver:database=$database";
my $userid = "HR";
my $password = "1";

#Constructor
sub new{	
	my  $class = shift;
	my $self = {@_};
	bless($self,$class);
	return $self;
}


sub add_candidat{

	my ($self,$candidat) = @_;	
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("INSERT INTO Candidate
                       (forename, 
						surname,
						age,
						citizenship,
						marital_status,
						children,
						phone_number,
						email,
						position_apply,
						expertise_areas,
						prof_exp,
						foreign_lang,
						education )
                        values
                       (?,?,?,?,?,?,?,?,?,?,?,?,?)");
	$sth->execute($candidat->{forename},
					$candidat->{surname},
					$candidat->{age},
					$candidat->{citizenship},
					$candidat->{marital_status},
					$candidat->{children},
					$candidat->{phone_number},
					$candidat->{email},
					$candidat->{position_apply},
					$candidat->{expertise_areas},
					$candidat->{prof_exp},
					$candidat->{foreign_lang},
					$candidat->{education}
	) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_candidate_log("Added 1 candidat");
	$sth->finish();

}

sub get_candidat_by_id{

	my $self = shift;
	my $id = shift;
	#print $forename,"\n";
 	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("SELECT 
							forename,
							surname,
							age,
							citizenship,
							marital_status,
							children,
							phone_number,
							email,
							position_apply,
							expertise_areas,
							prof_exp,
							foreign_lang,
							education FROM Candidate WHERE id=?");
	$sth->execute( $id ) or die $DBI::errstr;

	if ($sth->rows >1 || $sth->rows == 0){

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_candidate_log("We have " . $sth->rows . " candidates with id: $id");
		return;
	}
	
	my @row = $sth->fetchrow_array();
	my $candidat = lib::Entities::Candidat->new();   	
   		   ($candidat->{forename},
			$candidat->{surname},
			$candidat->{age},
			$candidat->{citizenship},
			$candidat->{marital_status},
			$candidat->{children},
			$candidat->{phone_number},
			$candidat->{email},
			$candidat->{position_apply},
			$candidat->{expertise_areas},
			$candidat->{prof_exp},
			$candidat->{foreign_lang},
			$candidat->{education}) = (@row);
	$sth->finish();
	return $candidat;
}
sub update_candidat_by_id{
	
	my ($self,$id,$candidat) = @_;
	
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("UPDATE Candidate
                        	SET forename = ?,
							surname = ?,
							age = ?,
							citizenship = ?,
							marital_status = ?,
							children = ?,
							phone_number = ?,
							email = ?,
							position_apply = ?,
							expertise_areas = ?,
							prof_exp = ?,
							foreign_lang = ?,
							education = ?
							WHERE id= ?");

$sth->execute($candidat->{forename},
			$candidat->{surname},
			$candidat->{age},
			$candidat->{citizenship},
			$candidat->{marital_status},
			$candidat->{children},
			$candidat->{phone_number},
			$candidat->{email},
			$candidat->{position_apply},
			$candidat->{expertise_areas},
			$candidat->{prof_exp},
			$candidat->{foreign_lang},
			$candidat->{education},
			$id ) or die $DBI::errstr;

		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_candidate_log("We have " . $sth->rows . " candidates updated with id: $id");
		$sth->finish();
}
sub delete_candidat_by_id{
	
	my $self = shift;
	my $id = shift;
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("DELETE FROM Candidate
                        WHERE id = ?");
	$sth->execute( $id ) or die $DBI::errstr;
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_candidate_log("Deleted: " . $sth->rows . " candidates with id: $id");
	$sth->finish();
}

sub get_candidates_list{
	
	my $candidates = [];	
	my $self = shift;
	
 	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
	my $sth = $dbh->prepare("SELECT
							id,
							forename,
							surname,
							age,
							citizenship,
							marital_status,
							children,
							phone_number,
							email,
							position_apply,
							expertise_areas,
							prof_exp,
							foreign_lang,
							education FROM Candidate");
	$sth->execute() or die $DBI::errstr;
		
	while (my @row = $sth->fetchrow_array()) {
			my $candidat = lib::Entities::Candidat->new();   	
   		   ($candidat->{id},
			$candidat->{forename},
			$candidat->{surname},
			$candidat->{age},
			$candidat->{citizenship},
			$candidat->{marital_status},
			$candidat->{children},
			$candidat->{phone_number},
			$candidat->{email},
			$candidat->{position_apply},
			$candidat->{expertise_areas},
			$candidat->{prof_exp},
			$candidat->{foreign_lang},
			$candidat->{education}) = (@row);
			push @$candidates,$candidat;
}
	$sth->finish();
	return $candidates;
}
1;
