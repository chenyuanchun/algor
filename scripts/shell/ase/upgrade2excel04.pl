#!/usr/bin/env perl

use strict;

sub main {
  my $inputfile = shift @ARGV;
  open(INPUTFILE, "<$inputfile") or die("Cannot opent the excel file list");
  my @xlsfiles = <INPUTFILE>;
  close(INPUTFILE);

  foreach my $xlsfile (@xlsfiles) {
    chomp($xlsfile);
    rename("$xlsfile", "${xlsfile}.orig") or die("Cannot rename $xlsfile");

    open(MYINPUT, "<${xlsfile}.orig") or die("Cannot open ${xlsfile}.orig");
    open(MYOUTPUT, ">$xlsfile") or die("Cannot open $xlsfile");

    my $num_rfs = 0;
    my $needupgrade = 0;
    my $upgradedone = 0;
    while(<MYINPUT>) {
      my $textline = $_;

      if(!$upgradedone) {
        if($textline =~ /VERSION=03/) {
          $textline = "VERSION=04\n";
          $needupgrade = 1;
        } elsif($textline =~ /RFNAMES=(.*)$/) {
          my @riskfactors = split(',', $1);
          $num_rfs = @riskfactors;
        } elsif($textline =~ /DELTATYPE=(.*)$/) {
          if($needupgrade) {
            my $repeated_type = ",$1";
            $repeated_type = $repeated_type x ($num_rfs-1);
            chomp($textline);
            $textline .= $repeated_type;
            $textline .= "\n";
            $upgradedone = 1;
          }
        }
      }
      print MYOUTPUT $textline;
    }
    close(MYOUTPUT);
    close(MYINPUT);
    unlink "${xlsfile}.orig";
  }

}

main();
