#!/usr/bin/perl
use Getopt::Std;
getopts("f:rg");

sub debug_print {
  return unless $opt_g;

  my($msg) = @_;
  print STDERR "$msg\n";
}

if(-d $opt_f)
{
   die "Argument '-f' is a directory ($opt_f).";
}

if (-r $opt_f) {
  debug_print("opening $opt_f") if $opt_g;
  open STDIN, "<$opt_f" || die "cannot read $opt_f";
} else {
  die "Argument for '-f' (current value: $opt_f) has not been specified.";
}

my($line) = $_;
use constant KEYINDEX => 5;

LINE_PROCESS:
while ($line=<STDIN>) {
    chop $line;

    debug_print("\nread line==>" . $line ) if $opt_g;

    if (length($line) == 0) {
      print "\n";
      next;
    } 

    my $converted = 0;

    if ((substr($line,0,5) ne ",,,,,") && $line =~ /,[^,]/ ){
        my @fields = split(',',$line);
        my $size = @fields;
        
        if( $size >= KEYINDEX && length($fields[0]) == 0  && length($fields[2]) > 0  ){
            if( length($fields[KEYINDEX]) > 0){
                debug_print ( "scenario line found==>" . $line ) if $opt_g;
                for( $count=1; $count<KEYINDEX; $count++ ){
                    print "," . @fields[$count]
                    }
                print ",\n,,,,";
                for( $count=KEYINDEX; $count<$size; $count++ ){
                    print "," . @fields[$count];
                }
                print "\n";
                $converted = 1;
            } else {
                # TBD
                my $last_ch=substr($line,length($line)-1,1);
                if( $last_ch eq "," ){
                    while( $last_ch eq "," ){
                        $last_ch=chop $line;
                    }
                    $line=$line . $last_ch;
                }
            }
        }
    }
    if( $converted == 0 ){
        print $line . "\n";
    }
}

