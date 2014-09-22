package lib::DAL::Candidat;
use strict;
use warnings;
use Data::Dumper; 
use base 'lib::DAL';
use lib::Entities::Candidat;
use lib::DB;
use Log::Log4perl;

my $log = Log::Log4perl->get_logger(__PACKAGE__);
my $dbh = lib::DB->instance();

sub new{	
	my  $class = shift;
	my $self = {@_};
	bless($self,$class);
	return $self;
}

sub add{

	my ($self,$candidat) = @_;	
	
	my $sth = $dbh->prepare("INSERT INTO Candidat
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
                       (?,?,?,?,?,?,?,?,?,?,?,?,)");
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
	) || die $log->error("$DBI::errstr");
	
	$log->info("Added 1 candidat");
	$sth->finish();

}

sub get_by_id{

	my $self = shift;
	my $id = shift;
	
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
							education FROM Candidat WHERE id=?");
	$sth->execute( $id ) || die $log->error("$DBI::errstr");


	if ($sth->rows >1 || $sth->rows == 0){
		
		$log->info("We have " . $sth->rows . " candidates with id: $id");
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
sub update_by_id{
	
	my ($self,$id,$candidat) = @_;	

	my $sth = $dbh->prepare("UPDATE Candidat
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
			$id )|| die $log->error("$DBI::errstr");
;

		$log->info("We have " . $sth->rows . " candidates updated with id: $id");
		$sth->finish();
}
sub delete_by_id{
	
	my $self = shift;
	my $id = shift;
	
	my $sth = $dbh->prepare("DELETE FROM Candidat WHERE id = ?");
	$sth->execute( $id ) || die $log->error("$DBI::errstr");
	
	$log->info("Deleted: " . $sth->rows . " candidates with id: $id");
	$sth->finish();
}

sub get_list{
	
	my $candidates = [];	
	my $self = shift;	
 	
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
							education FROM Candidat");
	$sth->execute()|| die $log->error("$DBI::errstr");
		
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
