#Class for storing data about Candidate
package lib::Entities::Candidat;
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

    unless ($input->validate('forename','surname','age','email','citizenship','marital_status','children','phone_number')){
		
		$log->write_to_candidate_log($input->errors_to_string);

		$self = undef;

	}else{
			# initialize all attributes by passing arguments to accessor methods.
    		foreach my $attrib ( keys %params ) { 
       
            			unless ($self->can( $attrib )){			
			   
		       					$log->write_to_candidate_log("Invalid parameter '$attrib' passed to '$class' constructor");
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
sub forename{$_[0]->{forename} = $_[1] if defined $_[1]; $_[0]->{forename} }

sub id{$_[0]->{id} = $_[1] if defined $_[1]; $_[0]->{id} }

sub surname{$_[0]->{surname} = $_[1] if defined $_[1]; $_[0]->{surname} }
sub age{$_[0]->{age} = $_[1] if defined $_[1]; $_[0]->{age} }
sub citizenship{$_[0]->{citizenship} = $_[1] if defined $_[1]; $_[0]->{citizenship} }
sub marital_status{$_[0]->{marital_status} = $_[1] if defined $_[1]; $_[0]->{marital_status} }
sub children{$_[0]->{children} = $_[1] if defined $_[1]; $_[0]->{children} }
sub phone_number{$_[0]->{phone_number} = $_[1] if defined $_[1]; $_[0]->{phone_number} }
sub email{$_[0]->{email} = $_[1] if defined $_[1]; $_[0]->{email} }

sub position_apply{$_[0]->{position_apply} = $_[1] if defined $_[1]; $_[0]->{position_apply} }
sub expertise_areas{$_[0]->{expertise_areas} = $_[1] if defined $_[1]; $_[0]->{expertise_areas} }
sub prof_exp{$_[0]->{prof_exp} = $_[1] if defined $_[1]; $_[0]->{prof_exp} }
sub foreign_lang{$_[0]->{foreign_lang} = $_[1] if defined $_[1]; $_[0]->{foreign_lang} }
sub education{$_[0]->{education} = $_[1] if defined $_[1]; $_[0]->{education} }

1;
