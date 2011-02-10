use strict;
use warnings;
use Test::More import => ['!pass'];

plan tests => 4;

use Dancer;
use Dancer::Test;

is setting('environment'), 'testing', 'environement is set to testing';
is setting('logger'), 'Test', 'logger is Test';
is setting('log'), 'debug', 'log level is debug';

{
    get '/' => sub {
        debug "a debug message";
    };
}

ok(dancer_response(GET => '/'), "route ran successfully");

