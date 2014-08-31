package lib::Tests::InterviewersTests::GetInterviewerByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewersPortal;




my $p = lib::Portal::InterviewersPortal->new();

my $interviewer = $p->get_interviewer_by_id(2);
print $interviewer->{surname};


