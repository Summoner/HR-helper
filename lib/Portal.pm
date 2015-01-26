package lib::Portal;
use strict;
use warnings;
use Data::Dumper;
use lib::BLL::Candidates;
use lib::BLL::HRManagers;
use lib::BLL::Interviewers;
use lib::BLL::Interviews;
use Log::Log4perl;

Log::Log4perl->init("/home/fanatic/Summoner/HR-helper/lib/Diagnostic/log.conf");
my $candidat = lib::BLL::Candidates->instance();
my $hrmanager = lib::BLL::HRManagers->instance();
my $interview = lib::BLL::Interviews->instance();
my $interviewer = lib::BLL::Interviewers->instance();

#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);
    return $self;
}

sub add_candidat {
    my	( $self )	= shift;

    $candidat->add(@_);
} ## --- end sub add_candidat

sub add_hrmanager {
    my	( $self )	= shift;

    $hrmanager->add(@_);
} ## --- end sub add_hrmanager

sub add_interviewer{
    my	( $self )	= shift;

    $interviewer->add(@_);
} ## --- end sub add_interviewer

sub add_interview{
    my	( $self )	= shift;

    $interview->add(@_);
} ## --- end sub add_interview

sub update_candidat {
    my	( $self )	= shift;

    $candidat->update_by_id(@_);
} ## --- end sub update_candidat

sub update_hrmanager {
    my	( $self )	= shift;

    $hrmanager->update_by_id(@_);
}## --- end sub update_hrmanager

sub update_interviewer {
    my	( $self )	= shift;

    $interviewer->update_by_id(@_);
}## --- end sub update_interviewer

sub update_interview {
    my	( $self )	= shift;

    $interview->update_by_id(@_);
}## --- end sub update_interview

sub delete_candidat {
    my	( $self )	= shift;

    $candidat->delete_by_id(@_);

} ## --- end sub delete_candidat

sub delete_hrmanager {
    my	( $self )	= shift;

    $hrmanager->delete_by_id(@_);
} ## --- end sub delete_hrmanager

sub delete_interviewer {
    my	( $self )	= shift;

    $interviewer->delete_by_id(@_);
} ## --- end sub delete_interviewer

sub delete_interview {
    my	( $self )	= shift;

    $interview->delete_by_id(@_);
} ## --- end sub delete_interview

sub get_candidat {
    my	( $self )	= shift;

    my $c = $candidat->get_by_id(@_);
    return $c;
} ## --- end sub get_candidat

sub get_hrmanager {
    my	( $self )	= shift;
    my $h = $hrmanager->get_by_id(@_);
    return $h;
} ## --- end sub get_hrmanager

sub get_interviewer {
    my	( $self )	= shift;

    my $i = $interviewer->get_by_id(@_);
    return $i;
} ## --- end sub get_interviewer

sub get_interview {
    my	( $self )	= shift;

    my $i = $interview->get_by_id(@_);
    return $i;
} ## --- end sub get_interview

sub get_candidates_list {
    my	( $self )	= shift;

    my $candidates = $candidat->get_list();
    return $candidates ;
} ## --- end sub get_candidates_list

sub get_hrmanagers_list {
    my	( $self )	= shift;

    my $hrmanagers = $hrmanager->get_list();
    return $hrmanagers;
} ## --- end sub get_hrmanagers_list

sub get_interviewers_list {
    my	( $self )	= shift;

    my $interviewers = $interviewer->get_list();
    return $interviewers;
} ## --- end sub get_interviewers_list

sub get_interviews_list {
    my	( $self )	= shift;

    my $interviews = $interview->get_list();
    return $interviews;
} ## --- end sub get_interviews_list

sub get_list_candidates_by_registration_date{
    my	( $self,$date_from,$date_to )	= @_;

    my $candidates = $candidat->get_list_candidates_by_registration_date($date_from,$date_to);
    return $candidates;
} ## --- end sub get_candidates_list_by_registration_date

sub get_list_candidates_by_status{
    my	( $self,$status )	= @_;

    my $candidates = $candidat->get_list_candidates_by_status($status);
    return $candidates;
} ## --- end sub get_candidates_list_by_status

sub send_letter_to_candidat{
    my	( $self,$from, $subject,$candidat_data,$message )	= @_;

    $candidat->send_letter_to_candidat( $from,$subject,$candidat_data,$message );

} ## --- end sub get_candidates_list_by_status
1;
