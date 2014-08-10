#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

#Class - portal for access objects
package lib::Portal;
use lib::DB::Candidates;
use lib::Diagnostic::Logger;
#Constructor
sub new {
    my $class = shift;
    my $self = {};
	bless ($self,$class);    
    return $self;
}

  1;
