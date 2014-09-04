package lib::DB::HRManagers;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB;
use lib::Diagnostic::Logger;
use lib::Entities::HRManager;

my $log = lib::Diagnostic::Logger->instance();
my $dbh = lib::DB->instance();

sub new{	
	my  $class = shift;
	my $self = {};
	bless($self,$class);
	return $self;
}


sub add_hrmanager{

	my ($self,$hrmanager) = @_;		
	
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
	) || die $log->write_to_hrmanager_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
	
	$log->write_to_hrmanager_log("Added 1 HRmanager");
	$sth->finish();

}

sub get_hrmanager_by_id{

	my $self = shift;
	my $id = shift;
	
	my $sth = $dbh->prepare("SELECT 
							forename,
							surname,
							phone_number,
							email FROM HRManager WHERE id=?");
	$sth->execute( $id )|| die $log->write_to_hrmanager_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);

	if ($sth->rows >1 || $sth->rows == 0){
		
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
			$id ) || die $log->write_to_hrmanager_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
		
		$log->write_to_hrmanager_log("We have " . $sth->rows . " HRManagers updated with id: $id");
		$sth->finish();
}
sub delete_hrmanager_by_id{
	
	my $self = shift;
	my $id = shift;
	
	my $sth = $dbh->prepare("DELETE FROM HRManager
                        WHERE id = ?");
	$sth->execute( $id ) || die $log->write_to_hrmanager_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
	
	$log->write_to_hrmanager_log("Deleted: " . $sth->rows . " HRManagers with id: $id");
	$sth->finish();
}

sub get_hrmanagers_list{
	
	my $hrmanagers = [];	
	my $self = shift;	
 	
	my $sth = $dbh->prepare("SELECT
							id,
							forename,
							surname,
							phone_number,
							email FROM HRManager");
	$sth->execute() || die $log->write_to_hrmanager_log("$DBI::errstr "."at ". __PACKAGE__ ." line ". __LINE__);
		
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
