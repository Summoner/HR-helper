package lib::BLL::HRManagers;
use strict;
use warnings;
use Data::Dumper; 
use lib::DAL::HRManager;

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
	my $hrmanager = lib::Entities::HRManager->new(@_);
	if (defined $hrmanager){
		my $hrmanagers = lib::DAL::HRManager->new();
		$hrmanagers->add($hrmanager);
	}
}

sub get_by_id{

	my $self = shift;	
	my $id = shift;
	my $hrmanagers = lib::DAL::HRManager->new();
	my $hrmanager = $hrmanagers->get_by_id($id);
	return $hrmanager
}

sub update_by_id{

	my $self = shift;
	my $id = shift;	
	my $hrmanager = lib::Entities::HRManager->new(@_);
	if (defined $hrmanager){
		my $hrmanagers = lib::DAL::HRManager->new();
		$hrmanagers->update_by_id($id,$hrmanager);
	}
}


sub delete_by_id{

	my $self = shift;	
	my $id = shift;
	my $hrmanagers = lib::DAL::HRManager->new();
	$hrmanagers->delete_by_id($id);
}

sub get_list{

	my $self = shift;	
	my $hrmanagers = lib::DAL::HRManager->new();
	my $hrmanagers_list = $hrmanagers->get_list();
	return $hrmanagers_list;
}
1;
