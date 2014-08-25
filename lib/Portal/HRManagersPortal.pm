package lib::Portal::HRManagersPortal;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB::HRManagers;
use lib::Diagnostic::Logger;
use base 'lib::Portal';

#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  sub add_hrmanager{

	my $self = shift;	
	my $hrmanager = lib::Entities::HRManager->new(@_);
	if (defined $hrmanager){
		my $hrmanagers = lib::DB::HRManagers->new();
		$hrmanagers->add_hrmanager($hrmanager);
	}
}

sub get_hrmanager_by_id{

	my $self = shift;	
	my $id = shift;
	my $hrmanagers = lib::DB::HRManagers->new();
	my $hrmanager = $hrmanagers->get_hrmanager_by_id($id);
	return $hrmanager
}

sub update_hrmanager_by_id{

	my $self = shift;
	my $id = shift;	
	my $hrmanager = lib::Entities::HRManager->new(@_);
	if (defined $hrmanager){
		my $hrmanagers = lib::DB::HRManagers->new();
		$hrmanagers->update_hrmanager_by_id($id,$hrmanager);
	}
}


sub delete_hrmanager_by_id{

	my $self = shift;	
	my $id = shift;
	my $hrmanagers = lib::DB::HRManagers->new();
	$hrmanagers->delete_hrmanager_by_id($id);
}

sub get_hrmanagers_list{

	my $self = shift;	
	my $hrmanagers = lib::DB::HRManagers->new();
	my $hrmanagers_list = $hrmanagers->get_hrmanagers_list();
	return $hrmanagers_list;
}
1;
