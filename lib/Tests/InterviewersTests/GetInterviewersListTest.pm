package lib::Tests::InterviewersTests::GetInterviewersListTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;



my $p = lib::Portal->new();

my $interviewers = $p->get_interviewers_list();
print Dumper \$interviewers;


