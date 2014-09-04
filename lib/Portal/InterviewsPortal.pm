package lib::Portal::InterviewsPortal;
use strict;
use warnings;
use Data::Dumper; 
use lib::DB::Interviews;
use lib::Entities::Interview;
use lib::Diagnostic::Logger;
use base 'lib::Portal';

#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  sub add_interview{

	my $self = shift;	
	my $interview = lib::Entities::Interview->new(@_);
	if (defined $interview){
		my $interviews = lib::DB::Interviews->new();
		$interviews->add_interview($interview);
	}
}

sub get_interview_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviews = lib::DB::Interviews->new();
	my $interview = $interviews->get_interview_by_id($id);
	return $interview;
}

sub update_interview_by_id{

	my $self = shift;
	my $id = shift;	
	
	my $interview = lib::Entities::Interview->new(@_);
	if (defined $interview){
		my $interviews = lib::DB::Interviews->new();
		$interviews->update_interview_by_id($id,$interview);
	}
}


sub delete_interview_by_id{

	my $self = shift;	
	my $id = shift;
	my $interviews = lib::DB::Interviews->new();
	$interviews->delete_interview_by_id($id);
}

sub get_interviews_list{

	my $self = shift;	
	my $interviews = lib::DB::Interviews->new();
	my $interviews_list = $interviews->get_interviews_list();
	return $interviews_list;
}
1;
