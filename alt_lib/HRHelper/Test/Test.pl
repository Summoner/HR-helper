#!/usr/bin/perl -w

use strict;
use warnings;

# get PortalFacade instance, skip authenticate for now
my $cand_input = { name => 'Name1', surname => 'Surname1', cv => 'File1' );
my $facade = HRHelper::PortalFacade->new();

# so first execute create_candidate

$facade->create_candidate($cand_input);
