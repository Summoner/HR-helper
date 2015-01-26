package lib::BLL::HRManagers;
use strict;
use warnings;
use Data::Dumper;
use lib::DAL::HRManager;
use base 'lib::BLL';
use base 'Class::Singleton';

my $hrmanagers = lib::DAL::HRManager->instance();

sub _new_instance{
    my $class = shift;
    my $self = bless {},$class;
}

sub add{

	my $self = shift;
	my $hrmanager = lib::Entities::HRManager->new(@_);
	if (defined $hrmanager){

		$hrmanagers->add($hrmanager);
	}
}

sub get_by_id{

	my ( $self,$id ) = @_;

	my $hrmanager = $hrmanagers->get_by_id($id);
	return $hrmanager
}

sub update_by_id{

	my $self = shift;
	my $id = shift;
	my $hrmanager = lib::Entities::HRManager->new(@_);
	if (defined $hrmanager){

		$hrmanagers->update_by_id($id,$hrmanager);
	}
}

sub delete_by_id{

	my ( $self,$id ) = @_;

	$hrmanagers->delete_by_id($id);
}

sub get_list{

	my $self = shift;

	my $hrmanagers_list = $hrmanagers->get_list();
	return $hrmanagers_list;
}
1;
