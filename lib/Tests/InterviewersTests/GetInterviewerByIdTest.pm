package lib::Tests::InterviewersTests::GetInterviewerByIdTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;




my $p = lib::Portal->new();

my $interviewer = $p->get_interviewer(2);
print $interviewer->{surname};


