#!/usr/bin/perl -w
#Class for storing data about HRManager
package lib::Entities::HRManager;

use strict;
use warnings;
use Data::Dumper; 

#Constructor
sub new{	
	my  $class = shift;
    #print "2222",Dumper \@_;
	my $self = {@_};
	bless($self,$class);
	return $self;
}

#Object accessor methods
sub forename{$_[0]->{forename} = $_[1] if defined $_[1]; $_[0]->{forename} }
sub surname{$_[0]->{surname} = $_[1] if defined $_[1]; $_[0]->{surname} }
sub phone_number{$_[0]->{phone_number} = $_[1] if defined $_[1]; $_[0]->{phone_number} }
sub email{$_[0]->{email} = $_[1] if defined $_[1]; $_[0]->{email} }


1;
