package Tests::DeleteCandidatTest;
use strict;
use warnings;
use Data::Dumper; 
#Test here
use lib::Portal::CandidatesPortal;


my $p = lib::Portal::CandidatesPortal->new();
$p->delete_candidat_by_id(5);



