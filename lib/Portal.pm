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


#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}



sub add_candidat {
    my	( $self )	= shift;
    my $candidat = lib::BLL::Candidates->new();
    $candidat->add(@_);
} ## --- end sub add_candidat

sub add_hrmanager {
    my	( $self )	= shift;
    my $hrmanager = lib::BLL::HRManagers->new();
    $hrmanager->add(@_);
} ## --- end sub add_hrmanager

sub add_interviewer{
    my	( $self )	= shift;
    my $interviewer = lib::BLL::Interviewers->new();
    $interviewer->add(@_);
} ## --- end sub add_interviewer

sub add_interview{
    my	( $self )	= shift;
    my $interview = lib::BLL::Interviews->new();
    $interview->add(@_);
} ## --- end sub add_interview





sub update_candidat {
    my	( $self )	= shift;
    my $candidat = lib::BLL::Candidates->new();
    $candidat->update_by_id(@_);
} ## --- end sub update_candidat


sub update_hrmanager {
    my	( $self )	= shift;
    my $hrmanager = lib::BLL::HRManagers->new();
    $hrmanager->update_by_id(@_);
}## --- end sub update_hrmanager


sub update_interviewer {
    my	( $self )	= shift;
    my $interviewer = lib::BLL::Interviewers->new();
    $interviewer->update_by_id(@_);
}## --- end sub update_interviewer

sub update_interview {
    my	( $self )	= shift;
    my $interview = lib::BLL::Interviews->new();
    $interview->update_by_id(@_);
}## --- end sub update_interview




sub delete_candidat {
    my	( $self )	= shift;
    my $candidat = lib::BLL::Candidates->new();
    $candidat->delete_by_id(@_);

} ## --- end sub delete_candidat

sub delete_hrmanager {
    my	( $self )	= shift;
    my $hrmanager = lib::BLL::HRManagers->new();
    $hrmanager->delete_by_id(@_);
} ## --- end sub delete_hrmanager

sub delete_interviewer {
    my	( $self )	= shift;
    my $interviewer = lib::BLL::Interviewers->new();
    $interviewer->delete_by_id(@_);
} ## --- end sub delete_interviewer

sub delete_interview {
    my	( $self )	= shift;
    my $interview = lib::BLL::Interviews->new();
    $interview->delete_by_id(@_);
} ## --- end sub delete_interview





sub get_candidat {
    my	( $self )	= shift;
    my $BLLcandidat = lib::BLL::Candidates->new();
    my $candidat = $BLLcandidat->get_by_id(@_);
    return $candidat;
} ## --- end sub get_candidat

sub get_hrmanager {
    my	( $self )	= shift;
    my $BLL_hrmanager = lib::BLL::HRManagers->new();
    my $hrmanager = $BLL_hrmanager->get_by_id(@_);
    return $hrmanager;
} ## --- end sub get_hrmanager

sub get_interviewer {
    my	( $self )	= shift;
    my $BLL_interviewer = lib::BLL::Interviewers->new();
    my $interviewer = $BLL_interviewer->get_by_id(@_);
    return $interviewer;
} ## --- end sub get_interviewer

sub get_interview {
    my	( $self )	= shift;
    my $BLL_interview = lib::BLL::Interviews->new();
    my $interview = $BLL_interview->get_by_id(@_);
    return $interview;
} ## --- end sub get_interview





sub get_candidates_list {
    my	( $self )	= shift;
    my $candidat = lib::BLL::Candidates->new();
    my $candidates = $candidat->get_list();
    return $candidates ;
} ## --- end sub get_candidates_list

sub get_hrmanagers_list {
    my	( $self )	= shift;
    my $hrmanager = lib::BLL::HRManagers->new();
    my $hrmanagers = $hrmanager->get_list();
    return $hrmanagers;
} ## --- end sub get_hrmanagers_list

sub get_interviewers_list {
    my	( $self )	= shift;
    my $interviewer = lib::BLL::Interviewers->new();
    my $interviewers = $interviewer->get_list();
    return $interviewers;
} ## --- end sub get_interviewers_list

sub get_interviews_list {
    my	( $self )	= shift;
    my $interview = lib::BLL::Interviews->new();
    my $interviews = $interview->get_list();
    return $interviews;
} ## --- end sub get_interviews_list



  1;
