#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

#Class for storing data about Candidate
package Candidat;

#Constructor
sub new{	
	my  $class = shift;
	my $self = {@_};
	bless($self,$class);
	return $self;
}

#Object accessor methods
sub forename{$_[0]->{forename} = $_[1] if defined $_[1]; $_[0]->{forename} }
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
