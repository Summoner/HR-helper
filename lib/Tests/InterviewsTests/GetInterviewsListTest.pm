package lib::Tests::InterviewsTests::GetInterviewsListTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewsPortal;



my $p = lib::Portal::InterviewsPortal->new();

my $interviews = $p->get_interviews_list();
print Dumper \$interviews;


