package lib::BLL::Candidates;
use strict;
use warnings;
use Data::Dumper;
use lib::DAL::Candidat;
use Log::Log4perl;
use base 'lib::BLL';
use base 'Class::Singleton';

my $log = Log::Log4perl->get_logger(__PACKAGE__);
my $candidates = lib::DAL::Candidat->instance();


#Candidates can have status:
# 0 - Just applayed;
# 1 - Rejected by HR
# 2 - Approved by HR
# 3 - Rejected by developer
# 4 - Approved by developer
# 5 - Arranged first interview
# 6 - Rejected after first interview
# 7 - Approved after first interview
# 8 - Arranged second interview
# 9 - Rejected after second interview
# 10 - Arranged third interview
# 11 - Rejected after third interview
# 12 - Approved after third interview
# 13 - Sent job offer
# 14 - Offer accepted
# 15 - Offer rejected

sub _new_instance{
    my $class = shift;
    my $self = bless {},$class;
}

sub add{

	my $self = shift;
	my $candidat = lib::Entities::Candidat->new(@_);
	if (defined $candidat){
		$candidates->add($candidat);
	}
}

sub get_by_id{

    my ($self,$id) = @_;

	my $candidat = $candidates->get_by_id($id);
	return $candidat
}

sub update_by_id{

    my $self = shift;
    my $id = shift;

	my $candidat = lib::Entities::Candidat->new(@_);
		if (defined $candidat){

			$candidates->update_by_id($id,$candidat);
		}
}


sub delete_by_id{

	my ($self,$id) = @_;

	$candidates->delete_by_id($id);
}

sub get_list{

	my $self = shift;

	my $candidates_list = $candidates->get_list();
	return $candidates_list;
}

sub get_list_candidates_by_status {
    my	($self, $status )	= @_;

	my $candidates_list = $candidates->get_list_candidates_by_status($status);
    return $candidates_list;

} ## --- end sub get_list_candidates_by_status

sub get_list_candidates_by_registration_date {
    my	($self, $date_from,$date_to )	= @_;

	my $candidates_list = $candidates->get_list_candidates_by_registration_date( $date_from,$date_to );
	return $candidates_list;

} ## --- end sub get_list_candidates_by_registration_date

sub send_letter_to_candidat {
    my	($self,$from,$subject,$candidat,$message )	= @_;

    my $to = $candidat->email;

    open( MAIL,"|/usr/sbin/sendmail -t" );

    print MAIL "To: $to\n";
    print MAIL "From: $from\n";
    print MAIL "Subject: $subject\n\n";
    print MAIL $message;
    close( MAIL );
    $log->info("Message sent successfully");

} ## --- end sub send_letter_to_candidat
1;
