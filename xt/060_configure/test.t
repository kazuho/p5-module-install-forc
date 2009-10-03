use strict;
use warnings;
use Test::More;
use File::Basename;
use Config;

chdir(dirname(__FILE__));

unshift @INC, '../../lib';
require inc::Module::Install;
inc::Module::Install->import();

my $env = env_for_c();

ok $env->try_cc('int main () { }');
ok $env->have_header('stdio.h');
ok !$env->have_header('unknown-header.h');

ok $env->have_library('m');
ok !$env->have_library('unknown-library');

done_testing;
