#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

#Class - repozitory for storing Candidates
package lib::DB::Candidates;
use lib::Portal::Candidat;
#Constructor
sub new{	
	my  $class = shift;
	my $self = {@_};
	bless($self,$class);
	return $self;
}
my $candidates = {};

sub add_candidat{

	my $self = shift;
	my $id = shift;
	#print "11111",Dumper \@_;
	my $candidat = lib::Portal::Candidat->new(@_);
	$candidates->{$id} = $candidat;
#	return $candidates;
}

sub get_candidat_by_id{

	my $self = shift;
	my $id = shift;
 
	if (exists $candidates->{$id}){

		return $candidates->{$id};

	}else{
	
		print "We haven't candidate with id: $id\n";
	}
}

sub delete_candidat_by_id{
	
	my $self = shift;
	my $id = shift;
	if(exists $candidates->{$id}){

		delete $candidates->{$id};
	}
}

sub get_candidates_list{

	my $self = shift;
	return $candidates;
}
1;
