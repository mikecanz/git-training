#!/usr/bin/perl

use strict;
use warnings;

for (my $x = 0; $x < 101; $x++) {
    my $string = '';
    if ( $x % 3 == 0 ) { $string .= "Fizz"; }
    if ( $x =~ m/(?:0|5)$/ ) { $string .= "Buzz"; }

    if ($string) { print $x . ' ' . $string . "\n"; }
    
}
