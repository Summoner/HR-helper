package lib::BLL::Interviewers;
use strict;
use warnings;
use Data::Dumper; 
use lib::DAL::Interviewer;
use lib::Entities::Interviewer;

use base 'lib::BLL';

  sub add{

	my $self = shift;	
	my $interviewer = lib::Entities::Interviewer->new(@_);
	if (defined $interviewer){
		my $interviewers = lib::DAL::Interviewer->new();
		$interviewers->add($interviewer);
	}
}

sub get_by_id{

	my ($self,$id) = @_;	
	
	my $interviewers = lib::DAL::Interviewer->new();
	my $interviewer = $interviewers->get_by_id($id);
	return $interviewer
}

sub update_by_id{

	my $self = shift;
	my $id = shift;		
	my $interviewer = lib::Entities::Interviewer->new(@_);
	if (defined $interviewer){
		my $interviewers = lib::DAL::Interviewer->new();
		$interviewers->update_by_id($id,$interviewer);
	}
}


sub delete_by_id{

	my ($self,$id) = @_;	

	my $interviewer = lib::DAL::Interviewer->new();
	$interviewer->delete_by_id($id);
}

sub get_list{

	my $self = shift;	
	my $interviewers = lib::DAL::Interviewer->new();
	my $interviewers_list = $interviewers->get_list();
	return $interviewers_list;
}
1;
