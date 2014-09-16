package lib::Tests::InterviewsTests::GetInterviewsListTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal;

my $p = lib::Portal->new();

my $interviews = $p->get_interviews_list();
print Dumper \$interviews;


