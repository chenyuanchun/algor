#!/usr/bin/env perl

require 5.6.0;

use strict;

#use warnings; # no warnings; to disable
#print STDOUT Ellie, what\'s up?;

# format output
printf ("%-15s%-20s\n", "Jack", "Sprat"); # left aligned
printf ("Formatted number |%10d|\n", 100); #right aligned
printf ("Leading zeros: |%010d|\n", 5);
printf ("Formatted floating point: |%8.2f|\n", 14.356);

#here document
my $price = 100;
print << "EOFF";
The customer commented, "the price of $price is right.
aaa "
EOFF

print qq/Today is /, qx/date/;

print <DATA>;

__DATA__
This line is data line.
And so will be this one.
