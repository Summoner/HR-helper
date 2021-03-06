package lib::DAL::HRManager;
use strict;
use warnings;
use Data::Dumper;
use base 'lib::DAL';
use base 'Class::Singleton';
use lib::Entities::HRManager;
use lib::DB;
use Log::Log4perl;

my $log = Log::Log4perl->get_logger(__PACKAGE__);
my $dbh = lib::DB->instance();

sub _new_instance{
    my $class = shift;
    my $self = bless {},$class;
}

sub add{
    my ($self,$hrmanager) = @_;

    my $sth = $dbh->prepare( "INSERT INTO HRManager
                                (forename,
                                surname,
                                phone_number,
                                email)
                                values
                                (?,?,?,?)" );

        $sth->execute(  $hrmanager->forename,
                        $hrmanager->surname,
                        $hrmanager->phone_number,
                        $hrmanager->email ) || die $log->error("$DBI::errstr");

        $log->info("Added 1 HRmanager");
        $sth->finish();

}

sub get_by_id{

    my ($self,$id) = @_;

    my $sth = $dbh->prepare( "SELECT
                                id,
                                forename,
                                surname,
                                phone_number,
                                email FROM HRManager WHERE id=?" );

        $sth->execute( $id )|| die $log->error("$DBI::errstr");

        if ($sth->rows >1 || $sth->rows == 0){

            $log->info("We have " . $sth->rows . " HRManagers with id: $id");
        }

        my @row = $sth->fetchrow_array();
        my $hrmanager = lib::Entities::HRManager->new();

          ( $hrmanager->{id},
            $hrmanager->{forename},
            $hrmanager->{surname},
            $hrmanager->{phone_number},
            $hrmanager->{email} ) = (@row);

            $sth->finish();
    return $hrmanager;
}

sub update_by_id{

    my ($self,$id,$hrmanager) = @_;

    my $sth = $dbh->prepare( "UPDATE HRManager
                                SET forename = ?,
                                surname = ?,
                                phone_number = ?,
                                email = ?
                                WHERE id= ?" );

        $sth->execute(  $hrmanager->forename,
                        $hrmanager->surname,
                        $hrmanager->phone_number,
                        $hrmanager->email,
                        $id ) || die $log->error("$DBI::errstr");

        $log->info("We have " . $sth->rows . " HRManagers updated with id: $id");
        $sth->finish();
}

sub delete_by_id{

    my ($self,$id) = @_;

    my $sth = $dbh->prepare("DELETE FROM HRManager WHERE id = ?");
       $sth->execute( $id ) || die $log->error("$DBI::errstr");

        $log->info("Deleted: " . $sth->rows . " HRManagers with id: $id");
        $sth->finish();
}

sub get_list{

    my $self = shift;
    my $hrmanagers = [];

    my $sth = $dbh->prepare( "SELECT
                                id,
                                forename,
                                surname,
                                phone_number,
                                email FROM HRManager" );

    $sth->execute() || die $log->error("$DBI::errstr");

    while (my @row = $sth->fetchrow_array()) {

        my $hrmanager = lib::Entities::HRManager->new();

        ( $hrmanager->{id},
          $hrmanager->{forename},
          $hrmanager->{surname},
          $hrmanager->{phone_number},
          $hrmanager->{email} ) = (@row);
          push @$hrmanagers,$hrmanager;
    }

    $sth->finish();
    return $hrmanagers;
}
1;
