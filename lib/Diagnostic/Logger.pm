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
	my $dt3 = DateTime->now(time_zone=>'local');
	#print $dt3;
	my $messageForWrite = $dt3 ." " . $message  . "\n";
	open my $logfile,">> /home/fanatic/Summoner/HR-helper/lib/Diagnostic/log.txt" || die "Can not open file $!\n";
	print $logfile $messageForWrite;
	close $logfile;
}

1;

