#!/usr/bin/env perl

sub main {
  my $inputfile = shift @ARGV;
  open(INPUTFILE, "<$inputfile") or die("Cannot opent the excel file list");
  @asercfiles = <INPUTFILE>;
  close(INPUTFILE);

  foreach my $asercfile (@asercfiles) {
    chomp($asercfile);

    if ( ! -e $asercfile ) {
      print "${asercfile} does not exist\n";
      next;
    }
    open(MYOUTPUT, ">>$asercfile");
    print MYOUTPUT "\nOutputPrecision = 8\n";
    close(MYOUTPUT);
  }

}

main();
