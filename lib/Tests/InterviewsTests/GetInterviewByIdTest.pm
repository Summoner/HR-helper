package lib::Tests::InterviewsTests::GetInterviewByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewsPortal;




my $p = lib::Portal::InterviewsPortal->new();

my $interview = $p->get_interview_by_id(2);
print $interview->{candidat}->{surname};


