#!/usr/bin/perl -w

open(GRADES, "grades") or die "Can't open grades: $!\n";

while ($line = <GRADES> ) {
  ($student, $grade) = split(" ", $line);
  $grades{$student} .= $grade . " ";
}

foreach $student (sort keys %grades) {
  $scores = 0;
  $total = 0;
  @grades = split(" ", $grades{$student});
  foreach $grade (@grades) {
    $total += $grade;
    $scores++;
  }

  $average = $total / $scores;
  print "$student: $grades{$student}\tAverage: $average\n";
}
