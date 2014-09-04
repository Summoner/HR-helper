package lib::Entities::Interview;

use strict;
use warnings;
use Data::Dumper;  
use lib::Entities::Validation;
use lib::Diagnostic::Logger;
use lib::Entities::Interviewer;
use lib::Entities::Candidat;
use lib::Entities::HRManager;



my $log = lib::Diagnostic::Logger->instance();
sub new{	
	my  $class = shift;
    my $self = {};
	my %params = @_;
	bless($self,$class);

	return $self if (scalar keys %params == 0);
	# initialize all attributes by passing arguments to accessor methods.
    		foreach my $attrib ( keys %params ) { 
       
            			unless ($self->can( $attrib )){			
			   
		       					$log->write_to_interview_log("Invalid parameter '$attrib' passed to '$class' constructor");
								$self = undef;
								last;
						}else{

	        				$self->$attrib( $params{$attrib} );
						}

			}   
	
return $self;

}


#Object accessor methods
sub id{$_[0]->{id} = $_[1] if defined $_[1]; $_[0]->{id} }
sub date{$_[0]->{date} = $_[1] if defined $_[1]; $_[0]->{date} }
sub hrmanager{$_[0]->{hrmanager} = $_[1] if defined $_[1]; $_[0]->{hrmanager} }
sub interviewer1{$_[0]->{interviewer1} = $_[1] if defined $_[1]; $_[0]->{interviewer1} }
sub interviewer2{$_[0]->{interviewer2} = $_[1] if defined $_[1]; $_[0]->{interviewer2} }
sub interviewer3{$_[0]->{interviewer3} = $_[1] if defined $_[1]; $_[0]->{interviewer3} }
sub candidat{$_[0]->{candidat} = $_[1] if defined $_[1]; $_[0]->{candidat} }
sub result{$_[0]->{result} = $_[1] if defined $_[1]; $_[0]->{result} }
sub process_description{$_[0]->{process_description} = $_[1] if defined $_[1]; $_[0]->{process_description} }


1;


