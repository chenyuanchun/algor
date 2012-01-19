#!/bin/tcsh

set tests = ( aa bb cc )

foreach test ( * )
  if ( $test =~ "rw.*" ) then
    echo $test
  endif
end

