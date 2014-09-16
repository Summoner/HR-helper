package lib::BLL::Interviews;
use strict;
use warnings;
use Data::Dumper; 
use lib::DAL::Interview;
use lib::Entities::Interview;
use lib::Diagnostic::Logger;
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
	my $interview = lib::Entities::Interview->new(@_);
	if (defined $interview){
		my $interviews = lib::DAL::Interviews->new();
		$interviews->add($interview);
	}
}

sub get_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviews = lib::DAL::Interviews->new();
	my $interview = $interviews->get_by_id($id);
	return $interview;
}

sub update_by_id{

	my $self = shift;
	my $id = shift;	
	
	my $interview = lib::Entities::Interview->new(@_);
	if (defined $interview){
		my $interviews = lib::DAL::Interviews->new();
		$interviews->update_by_id($id,$interview);
	}
}


sub delete_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviews = lib::DAL::Interviews->new();
	$interviews->delete_by_id($id);
}

sub get_list{

	my $self = shift;	
	my $interviews = lib::DAL::Interviews->new();
	my $interviews_list = $interviews->get_list();
	return $interviews_list;
}
1;
