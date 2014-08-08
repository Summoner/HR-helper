#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

#Class - portal for access objects
package lib::Portal;
use lib::DB::Candidates;
use lib::Diagnostic::Logger;
#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  sub add_candidat{

	my $self = shift;	
	my $candidates = lib::DB::Candidates->new();
	$candidates->add_candidat(@_);
	my $log = lib::Diagnostic::Logger->new();
	$log->write_to_log("Added candidat");
	
}

sub get_candidat_by_id{

	my $self = shift;	
	my $id = shift;
	my $candidates = lib::DB::Candidates->new();
	my $candidat = $candidates->get_candidat_by_id($id);
	return $candidat
}

sub delete_candidat_by_id{

	my $self = shift;	
	my $id = shift;
	my $candidates = Candidates->new();
	$candidates->delete_candidat_by_id($id);
}

sub get_candidates_list{

	my $self = shift;	
	my $candidates = Candidates->new();
	my $candidates_list = $candidates->get_candidates_list();
}
1;
