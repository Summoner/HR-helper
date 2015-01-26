package lib::BLL::Interviewers;
use strict;
use warnings;
use Data::Dumper;
use lib::DAL::Interviewer;
use lib::Entities::Interviewer;
use base 'lib::BLL';
use base 'Class::Singleton';

my $interviewers = lib::DAL::Interviewer->instance();

sub _new_instance{
    my $class = shift;
    my $self = bless {},$class;
}
  sub add{

	my $self = shift;
	my $interviewer = lib::Entities::Interviewer->new(@_);
	if (defined $interviewer){

		$interviewers->add($interviewer);
	}
}

sub get_by_id{

	my ($self,$id) = @_;

	my $interviewer = $interviewers->get_by_id($id);
	return $interviewer
}

sub update_by_id{

	my $self = shift;
	my $id = shift;
	my $interviewer = lib::Entities::Interviewer->new(@_);
	if (defined $interviewer){

		$interviewers->update_by_id($id,$interviewer);
	}
}

sub delete_by_id{

	my ($self,$id) = @_;

	$interviewers->delete_by_id($id);
}

sub get_list{

	my $self = shift;

	my $interviewers_list = $interviewers->get_list();
	return $interviewers_list;
}
1;
