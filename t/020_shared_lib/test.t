use strict;
use warnings;
use Test::More;
use t::Utils;

setup();
cleanup('main');

run_makefile_pl();
ok -e 'Makefile';
run_make();
is `LD_LIBRARY_PATH=. ./main`, "hi\n";
run_make('clean');

done_testing;
