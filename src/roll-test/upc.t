#!/usr/bin/perl -w
# upc roll installation test.  Usage:
# upc.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/upc';
my $output;

my $TESTFILE = 'tmpupc';

open(OUT, ">$TESTFILE.upc");
print OUT <<END;
#include <upc.h>
#include <stdio.h>

int main (int argc, char **argv) {
  int i;
  printf("Thread %d\n", MYTHREAD + 1);
  return 0;
}
END
close(OUT);

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
#!/bin/bash
module load upc
upcc -o $TESTFILE.exe $TESTFILE.upc
upcrun -np 5 $TESTFILE.exe
END
close(OUT);

# upc-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'upc installed');
} else {
  ok(! $isInstalled, 'upc not installed');
}
SKIP: {

  skip 'upc not installed', 4 if ! $isInstalled;
  $output = `/bin/bash $TESTFILE.sh 2>&1`;
  like($output, qr/Thread 4/, 'upc test run');

  `/bin/ls /opt/modulefiles/compilers/upc/[0-9]* 2>&1`;
  ok($? == 0, 'upc module installed');
  `/bin/ls /opt/modulefiles/compilers/upc/.version.[0-9]* 2>&1`;
  ok($? == 0, 'upc version module installed');
  ok(-l '/opt/modulefiles/compilers/upc/.version',
     'upc version module link created');

}

`rm -fr $TESTFILE*`;
