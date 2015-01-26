package lib::BLL::Interviews;
use strict;
use warnings;
use Data::Dumper;
use lib::DAL::Interview;
use lib::Entities::Interview;
use base 'lib::BLL';
use base 'Class::Singleton';

my $interviews = lib::DAL::Interview->instance();

sub _new_instance{
    my $class = shift;
    my $self = bless {},$class;
}

sub add{

	my $self = shift;
	my $interview = lib::Entities::Interview->new(@_);
	if (defined $interview){

		$interviews->add($interview);
	}
}

sub get_by_id{

    my ( $self,$id ) = @_;

	my $interview = $interviews->get_by_id($id);
	return $interview;
}

sub update_by_id{

	my $self = shift;
    my $id  = shift;

	my $interview = lib::Entities::Interview->new(@_);
	if (defined $interview){

		$interviews->update_by_id($id,$interview);
	}
}

sub delete_by_id{

	my ( $self,$id ) = @_;

	$interviews->delete_by_id($id);
}

sub get_list{

	my $self = shift;

    my $interviews_list = $interviews->get_list();
	return $interviews_list;
}
1;
