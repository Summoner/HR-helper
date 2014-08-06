#!/usr/bin/perl -w
use lib 'D:/Perl/Summoner/HR-helper';
use strict;
use warnings;
use Candidat;
use Data::Dumper; 

#Single interface for access all necessary objects
package Portal;

#Constructor
sub new{	
	my  $class = shift;
	my $self = {@_};
	bless($self,$class);
	return $self;
}

sub Create_candidat{
	
	my $self =  shift;
	my @attr = @_;
	
	my $candidat = Candidat->new(@attr);
	return $candidat;	
}

1;