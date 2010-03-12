#!/usr/bin/perl 

use strict;
use warnings;

my $n = $ARGV[0];
my $offset = $n % 2;

$n -= $offset;

print (((1+$n) * $n/2) + $offset);
print "\n";
