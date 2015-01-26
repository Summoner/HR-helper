package lib::Tests::InterviewsTests::GetInterviewByIdTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;

my $p = lib::Portal->new();

my $interview = $p->get_interview(7);
print $interview->{candidat}->{surname};


