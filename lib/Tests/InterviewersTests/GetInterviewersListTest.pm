package lib::Tests::InterviewersTests::GetInterviewersListTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewersPortal;



my $p = lib::Portal::InterviewersPortal->new();

my $interviewers = $p->get_interviewers_list();
print Dumper \$interviewers;


