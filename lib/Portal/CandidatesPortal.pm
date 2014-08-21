package lib::Portal::CandidatesPortal;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB::Candidates;
use lib::Diagnostic::Logger;
use base 'lib::Portal';

#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  sub add_candidat{

	my $self = shift;	
	my $candidat = lib::Entities::Candidat->new(@_);
	if (defined $candidat){
		my $candidates = lib::DB::Candidates->new();
		$candidates->add_candidat($candidat);
	}
}

sub get_candidat_by_id{

	my $self = shift;	
	my $id = shift;
	my $candidates = lib::DB::Candidates->new();
	my $candidat = $candidates->get_candidat_by_id($id);
	return $candidat
}

sub update_candidat_by_id{

	my $self = shift;
	my $id = shift;	
	my $candidates = lib::DB::Candidates->new();
	my $candidat = lib::Entities::Candidat->new(@_);
	$candidates->update_candidat_by_id($id,$candidat);
}


sub delete_candidat_by_id{

	my $self = shift;	
	my $id = shift;
	my $candidates = lib::DB::Candidates->new();
	$candidates->delete_candidat_by_id($id);
}

sub get_candidates_list{

	my $self = shift;	
	my $candidates = lib::DB::Candidates->new();
	my $candidates_list = $candidates->get_candidates_list();
	return $candidates_list;
}
1;
