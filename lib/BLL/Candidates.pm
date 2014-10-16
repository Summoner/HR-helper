package lib::BLL::Candidates;
use strict;
use warnings;
use Data::Dumper; 
use lib::DAL::Candidat;

use base 'lib::BLL';



  sub add{

	my $self = shift;	
	my $candidat = lib::Entities::Candidat->new(@_);
	if (defined $candidat){
		my $candidates = lib::DAL::Candidat->new();
		$candidates->add($candidat);
	}
}

sub get_by_id{

    my ($self,$id) = @_;	

	my $candidates = lib::DAL::Candidat->new();
	my $candidat = $candidates->get_by_id($id);
	return $candidat
}

sub update_by_id{

    my $self = shift;
    my$id = shift;	
		
	my $candidat = lib::Entities::Candidat->new(@_);
		if (defined $candidat){
			my $candidates = lib::DAL::Candidat->new();
			$candidates->update_by_id($id,$candidat);
		}
}


sub delete_by_id{

	my ($self,$id) = @_;	
	
	my $candidat = lib::DAL::Candidat->new();
	$candidat->delete_by_id($id);
}

sub get_list{

	my $self = shift;	
	my $candidat = lib::DAL::Candidat->new();
	my $candidates_list = $candidat->get_list();
	return $candidates_list;
}

sub get_list_candidates_by_status {
    my	($self, $status )	= @_;
    my $candidat = lib::DAL::Candidat->new();
	my $candidates_list = $candidat->get_list_candidates_by_status($status);
	return $candidates_list;
    
} ## --- end sub get_list_candidates_by_status





1;
