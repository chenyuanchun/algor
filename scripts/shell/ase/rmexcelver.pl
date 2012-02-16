#!/usr/bin/env perl

sub main {
  my $inputfile = shift @ARGV;
  open(INPUTFILE, "<$inputfile") or die("Cannot opent the excel file list");
  @asercfiles = <INPUTFILE>;
  close(INPUTFILE);

  foreach $asercfile (@asercfiles) {
    chomp($asercfile);
    # rename("$asercfile", "${asercfile}.orig") or die("Cannot rename $asercfile");

    open(MYINPUT, "<$asercfile") or die("Cannot open ${asercfile}");
    my @textlines = <MYINPUT>;
    close(MYINPUT);

    @textlines = grep(!/^ExcelFileVersionNumber/, @textlines);
 
    open(MYOUTPUT, ">$asercfile") or die("Cannot open $asercfile");
    print MYOUTPUT @textlines;
    close(MYOUTPUT);
  }

}

main();
