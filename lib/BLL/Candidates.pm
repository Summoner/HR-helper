package lib::BLL::Candidates;
use strict;
use warnings;
use Data::Dumper; 
use lib::DAL::Candidat;

use base 'lib::BLL';

#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  sub add{

	my $self = shift;	
	my $candidat = lib::Entities::Candidat->new(@_);
	if (defined $candidat){
		my $candidates = lib::DAL::Candidat->new();
		$candidates->add($candidat);
	}
}

sub get_by_id{

	my $self = shift;	
	my $id = shift;
	my $candidates = lib::DAL::Candidat->new();
	my $candidat = $candidates->get_by_id($id);
	return $candidat
}

sub update_by_id{

	my $self = shift;
	my $id = shift;	
	my $candidat = lib::Entities::Candidat->new(@_);
		if (defined $candidat){
			my $candidates = lib::DAL::Candidat->new();
			$candidates->update_by_id($id,$candidat);
		}
}


sub delete_by_id{

	my $self = shift;	
	my $id = shift;
	my $candidates = lib::DAL::Candidat->new();
	$candidates->delete_by_id($id);
}

sub get_list{

	my $self = shift;	
	my $candidates = lib::DAL::Candidat->new();
	my $candidates_list = $candidates->get_list();
	return $candidates_list;
}
1;
