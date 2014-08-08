#!/usr/bin/perl -w
#Class for logging processes
package lib::Diagnostic::Logger;

use strict;
use warnings;
use Data::Dumper; 
use DateTime;

#Constructor
sub new{	
	my  $class = shift;
    #print "2222",Dumper \@_;
	my $self = {@_};
	bless($self,$class);
	return $self;
}

sub write_to_log{

	my($self,$message) = @_;
	my $dt3 = DateTime->today(time_zone=>'local');
	open my $logfile,"> /home/fanatic/Summoner/HR-helper/Diagnostic/log.txt" || die "Can not open file $!\n";
	
	my $messageForWrite = $message . $dt3 . "\n";

	print $logfile $message;
}

1;

