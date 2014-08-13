#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

#Class - repozitory for storing Interviewers
package lib::DB::Interviewers;
use lib::Entities::Interviewer;
#Constructor
sub new{	
	my  $class = shift;
	my $self = {@_};
	bless($self,$class);
	return $self;
}
my $interviewers = {};

sub add_interviewer{
	my $self = shift;
	my $id = shift;
	#print "11111",Dumper \@_;
	my $interviewer = lib::Entities::Interviewer->new(@_);
	$interviewers->{$id} = $interviewer;
}

sub get_interviewer_by_id{

	my $self = shift;
	my $id = shift;
 
	if (exists $interviewers->{$id}){

		return $interviewers->{$id};

	}else{
		my $log = lib::Diagnostic::Logger->new();
		$log->write_to_log("We haven't interviewer with id: $id");
		
	}
}

sub delete_interviewer_by_id{
	
	my $self = shift;
	my $id = shift;
	if(exists $interviewers->{$id}){

		delete $interviewers->{$id};
	}
}

sub get_interviewers_list{

	my $self = shift;
	return $interviewers;
}
1;
