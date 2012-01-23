#!/usr/bin/env perl

require 5.6.0;

use strict;

my $directory = `pwd`;
print "Current dir is $directory\n";

my $name="Tommy";
print "okay\n" if defined $name;
undef $name;

$_="Duck\n";
print;

# array

my $a="A";
my $b="B";
my @items = ($a,$b);
print "All items: @items\n";

my @list = (2..11);
my $size = @list;
print "List with size of $size: @list\n";
print "Index of last item of list: $#list\n";
$#list = 6;
print "after trancating list: @list\n";
@list =();
print "completely trancated: @list\n";

my @alphabeta = ('A'..'Z', 'a'..'z');
print "Alphabeta: @alphabeta\n";
print "upper case: @alphabeta[0,25]\n";
print "last 2 char: @alphabeta[-1,-2]\n";
my @ABC = @alphabeta[0,1,2];
my $abclist = join(",", @ABC);
print "abclist is $abclist\n";

# chr function
my $S = chr(0x53);
print "0x53 char is $S\n";

# hash 
my %ahash = ( 1 => 1, 2 => 2 );
print "ahash[1] $ahash{1};\n";
while ((my $key, my $value) = each(%ahash))
{
  print "$key = $value\n";
}

# reference of hash
my $hash_ref1 = { 1 => 1, 2 => 2 };
my $hash_ref2 = $hash_ref1;

print "hash_ref1 $hash_ref1\n";
print "hash_ref2 $hash_ref2\n";
print "hash_ref1[2]: $hash_ref1->{2}\n";

#get input from stdin
print "What is your name?\n";
chomp(my $name = <>);
#chomp($name);
print "$name is a high class name\n";

# DATA block
while (<DATA>) {
  my @line=split(":");
  print "$line[0]\n";
}

__DATA__
Betty Boop:245-836-8357:635 Cutesy Lane, Hollywood, CA 91464:6/23/23:14500
Igor Chevsky:385-375-8395:3567 Populus Place, Caldwell, NJ 23875:6/18/68:23400
Norma Corder:397-857-2735:74 Pine Street, Dearborn, MI 23874:3/28/45:245700
Jennifer Cowan:548-834-2348:583 Laurel Ave., Kingsville, TX 83745:10/1/35:58900
Fred Fardbarkle:674-843-1385:20 Park Lane, Duluth, MN 23850:4/12/23:78900
