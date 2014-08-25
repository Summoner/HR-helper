package lib::Portal::InterviewersPortal;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB::Interviewers;
use lib::Entities::Interviewer;
use lib::Diagnostic::Logger;
use base 'lib::Portal';

#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  sub add_interviewer{

	my $self = shift;	
	my $interviewer = lib::Entities::Interviewer->new(@_);
	if (defined $interviewer){
		my $interviewers = lib::DB::Interviewers->new();
		$interviewers->add_interviewer($interviewer);
	}
}

sub get_interviewer_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviewers = lib::DB::Interviewers->new();
	my $interviewer = $interviewers->get_interviewer_by_id($id);
	return $interviewer
}

sub update_interviewer_by_id{

	my $self = shift;
	my $id = shift;	
	
	my $interviewer = lib::Entities::Interviewer->new(@_);
	if (defined $interviewer){
		my $interviewers = lib::DB::Interviewers->new();
		$interviewers->update_interviewer_by_id($id,$interviewer);
	}
}


sub delete_interviewer_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviewers = lib::DB::Interviewers->new();
	$interviewers->delete_interviewer_by_id($id);
}

sub get_interviewers_list{

	my $self = shift;	
	my $interviewers = lib::DB::Interviewers->new();
	my $interviewers_list = $interviewers->get_interviewers_list();
	return $interviewers_list;
}
1;
