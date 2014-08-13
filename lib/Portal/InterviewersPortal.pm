#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

#Class - portal for access objects
package lib::Portal::InterviewersPortal;
use lib::DB::Interviewers;
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
	my $interviewers = lib::DB::Interviewers->new();
	$interviewers->add_interviewer(@_);
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_log("Added interviewer");
	
}

sub get_interviewer_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviewers = lib::DB::Interviewers->new();
	my $interviewer = $interviewers->get_interviewer_by_id($id);
	return $interviewer
}

sub delete_interviewer_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviewers = lib::DB::Interviewers->new();
	$interviewers->delete_interviewer_by_id($id);
}

sub get_interviewers_list{

	my $self = shift;	
	my $interviewer = lib::DB::Interviewers->new();
	my $interviewers = $interviewer->get_interviewers_list();
	return $interviewers;
}
1;
