#!/usr/bin/perl -w
#Class for storing data about HRManager
package lib::Entities::HRManager;

use strict;
use warnings;
use Data::Dumper; 

#Constructor
sub new {
    my ($class, %params) = @_;

    my $self = {};

    no strict 'refs';
    for my $key (keys %params) {
        # __PACKAGE__ равен текущему модулю, это встроенная
        # волшебная строка
        # следующая строка превращается в, например:
        # Person::get_name = sub {...};
        *{__PACKAGE__ . '::' . "$key"} = sub {
            my $self = shift;
            return $self->{$key};
        };
        $self->{$key} = $params{$key};
    }

    bless $self, $class;
    return $self;
}

1;
