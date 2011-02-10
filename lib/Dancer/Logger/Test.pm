package Dancer::Logger::Test;
use strict;
use warnings;

use base 'Dancer::Logger::Abstract';

use Carp 'carp', 'croak';
use Test::More;

sub _log {
    my ($self, $level, $message) = @_;

    my $formated_message = $self->format_message($level => $message);
    Test::More::diag($formated_message);
}

1;
__END__
=pod 

=head1 NAME

Dancer::Logger::Test - logger for test environments

=head1 SYNOPSIS

    set logger => 'Test';

    debug "something";

=head1 DESCRIPTION

This logger engine is designed for the C<testing> environement. Its purpose is
to pass all log message to C<< Test::More->builder->diag >>.

This solves a lot of file issues that can happen in the jungle of possible
platforms.

=head1 AUTHORS

This class has been written by Alexis Sukrieh C<< <sukria@sukria.net> >>.

=cut
