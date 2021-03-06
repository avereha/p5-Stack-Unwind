use warnings;
use strict;

use Test::More;
use Stack::Unwind 'unwind';

mark TOPLEVEL: {
    eval {
        unwind TOPLEVEL:;
        fail "Execution after die";
        1;
    } or do {
        fail "Execution in do block";
    };
    fail "Execution after eval but inside mark block";
};
pass "Execution resumes after mark block";
done_testing;
