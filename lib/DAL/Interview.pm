package lib::DAL::Interviews;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB;
use base 'lib::DAL';
use Log::Log4perl;


my $dbh = lib::DB->instance();
my $log = Log::Log4perl->get_logger(__PACKAGE__);

sub add{

    my ($self,$interview) = @_;		
	
    $interview->hrmanager->id( 1 ) unless defined $interview->{hrmanager}->{id};
    $interview->interviewer1->id( 1 ) unless defined $interview->{interviewer1}->{id};
    $interview->interviewer2->id( 1 ) unless defined $interview->{interviewer2}->{id};
    $interview->interviewer3->id( 1 ) unless defined $interview->{interviewer3}->{id};

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

        $sth->execute(  $interview->{date},
                        $interview->interviewer1->id,
                        $interview->interviewer2->id,
                        $interview->interviewer3->id,
                        $interview->result,
                        $interview->process_description,
                        $interview->candidat->id,
                        $interview->hrmanager->id ) || die $log->error("$DBI::errstr");	

        $log->info("Added 1 Interview");
        $sth->finish();
}

sub get_by_id{

    my ($self,$id) = @_;

    my $sth = $dbh->prepare("SELECT 
                            Interview.id,
                            Interview.date,
                            i1.id,i1.forename,i1.surname,i1.phone_number,i1.email,
                            i2.id,i2.forename,i2.surname,i2.phone_number,i2.email,
                            i3.id,i3.forename,i3.surname,i3.phone_number,i3.email,
                            Interview.Result,
                            Interview.ProcessDescription,
                            Candidat.id,
                            Candidat.forename,
                            Candidat.surname,
                            Candidat.age,
                            Candidat.children,
                            Candidat.citizenship,
                            Candidat.education,
                            Candidat.email,
                            Candidat.expertise_areas,
                            Candidat.foreign_lang,
                            Candidat.marital_status,
                            Candidat.phone_number,
                            Candidat.position_apply,
                            Candidat.prof_exp,
                            HRManager.id,
                            HRManager.forename,
                            HRManager.surname,
                            HRManager.phone_number,
                            HRManager.email
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
                            join Candidat
                            on
                            Interview.Candidat = Candidat.id
                            join HRManager
                            on
                            Interview.HRManager = HRManager.id
                            WHERE Interview.id=?" );

        $sth->execute( $id ) || die $log->error("$DBI::errstr");	

        if ($sth->rows >1 || $sth->rows == 0){
    
            $log->info("We have " . $sth->rows . " Interviews with id: $id");
        }

        my @row = $sth->fetchrow_array();

        my $interview = lib::Entities::Interview->new();

      ( $interview->{id},
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
        $interview->{candidat}->{educaion},
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
        $interview->{hrmanager}->{email} ) = (@row);

        $sth->finish();
        return $interview;
}

sub update_by_id{

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

    $sth->execute(  $interview->date,
                    $interview->interviewer1->id,
                    $interview->interviewer2->id,
                    $interview->interviewer3->id,
                    $interview->result,
                    $interview->process_description,
                    $interview->candidat->id,
                    $interview->hrmanager->id,
                    $id ) || die $log->error("$DBI::errstr");
    
    $log->info("We have " . $sth->rows . " Interviews updated with id: $id");
    $sth->finish();
}

sub delete_by_id{

    my $self = shift;
    my $id = shift;

    my $sth = $dbh->prepare("DELETE FROM Interview WHERE id = ?");
       $sth->execute( $id ) || die $log->error("$DBI::errstr");

    $log->info("Deleted: " . $sth->rows . " Interview with id: $id");
    $sth->finish();
}

sub get_list{

    my $interviews = [];	
    my $self = shift;
    
    my $sth = $dbh->prepare("SELECT 
                            Interview.id,Interview.date,
                            i1.id,i1.forename,i1.surname,i1.phone_number,i1.email,
                            i2.id,i2.forename,i2.surname,i2.phone_number,i2.email,
                            i3.id,i3.forename,i3.surname,i3.phone_number,i3.email,
                            Interview.Result,
                            Interview.ProcessDescription,
                            Candidat.id,
                            Candidat.forename,
                            Candidat.surname,
                            Candidat.age,
                            Candidat.children,
                            Candidat.citizenship,
                            Candidat.education,
                            Candidat.email,
                            Candidat.expertise_areas,
                            Candidat.foreign_lang,
                            Candidat.marital_status,
                            Candidat.phone_number,
                            Candidat.position_apply,
                            Candidat.prof_exp,
                            HRManager.id,
                            HRManager.forename,
                            HRManager.surname,
                            HRManager.phone_number,
                            HRManager.email
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
                            join Candidat
                            on
                            Interview.Candidat = Candidat.id
                            join HRManager
                            on
                            Interview.HRManager = HRManager.id" );
    $sth->execute() || die $log->error("$DBI::errstr");
    
    while ( my @row = $sth->fetchrow_array() ) {

        my $interview = lib::Entities::Interview->new();   	
        
      ( $interview->{id},
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
        $interview->{candidat}->{educaion},
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
        $interview->{hrmanager}->{email} ) = (@row);

        push @$interviews,$interview;
    }
    $sth->finish();
    return $interviews;
}
1;
