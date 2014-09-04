package lib::Portal;
use strict;
use warnings;
use Data::Dumper; 

#Class - portal for access objects

#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  1;
