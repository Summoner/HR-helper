#Class for storing data about HRManager
package lib::Entities::HRManager;
use strict;
use warnings;
use Data::Dumper; 
use lib::Entities::Validation;
use lib::Diagnostic::Logger;
#Constructor
my $log = lib::Diagnostic::Logger->new();
sub new{	
	my  $class = shift;
    my $self = {};
	my %params = @_;
	bless($self,$class);

	return $self if (scalar keys %params == 0);

	#Validate input parametres
	my $input = lib::Entities::Validation->new(\%params);

    unless ($input->validate('forename','surname','email','phone_number')){
		
		$log->write_to_hrmanager_log($input->errors_to_string);

		$self = undef;

	}else{
			# initialize all attributes by passing arguments to accessor methods.
    		foreach my $attrib ( keys %params ) { 
       
            			unless ($self->can( $attrib )){			
			   
		       					$log->write_to_hrmanager_log("Invalid parameter '$attrib' passed to '$class' constructor");
								$self = undef;
								last;
						}else{

	        				$self->$attrib( $params{$attrib} );
						}

			}   
	} 
return $self;

}


#Object accessor methods
sub id{$_[0]->{id} = $_[1] if defined $_[1]; $_[0]->{id} }
sub forename{$_[0]->{forename} = $_[1] if defined $_[1]; $_[0]->{forename} }
sub surname{$_[0]->{surname} = $_[1] if defined $_[1]; $_[0]->{surname} }
sub phone_number{$_[0]->{phone_number} = $_[1] if defined $_[1]; $_[0]->{phone_number} }
sub email{$_[0]->{email} = $_[1] if defined $_[1]; $_[0]->{email} }


1;
