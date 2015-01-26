package lib::Tests::InterviewsTests::InsertInterviewsTest;
use strict;
use warnings;
use Data::Dumper;

use lib::Portal;

my $p = lib::Portal->new();

my %interview =(

    date => "2014-07-21 17:00:50",
    result => "Job offer",
    process_description => "All was good"
);
my $candidat = $p->get_candidat( 7 );
my $interviewer1 = $p->get_interviewer( 2 );
my $interviewer2 = $p->get_interviewer( 3 );
my $interviewer3 = $p->get_interviewer( 4 );
my $hrmanager = $p->get_hrmanager( 3 );

$interview{candidat} = $candidat;
$interview{interviewer1} = $interviewer1;
$interview{interviewer2} = $interviewer2;
$interview{interviewer3} = $interviewer3;
$interview{hrmanager} = $hrmanager;

$p->add_interview( %interview );

