package Perl::Test;

use strict;
use warnings;
use utf8;

our $VERSION = '0.000001';
$VERSION = eval $VERSION;

use Exporter qw(import);
use IO::Handle ();

sub do_something {
	return "yay";
}

1;
__END__

=head1 NAME

Perl::Test - Test Azure Pipelines with a Perl Module

=head1 SYNOPSIS

  use Perl::Test ();

=head1 DESCRIPTION

This module does nothing other than to test the CI process of Azure Pipelines.

=head1 FUNCTIONS

L<Perl::Test> implements the following functions.

=head2 do_something

	use Perl::Test qw(do_something);
	my $val = do_something(); # yay

The C<do_something> function simply returns the string C<yay>.

=head1 AUTHOR

Chase Whitener, <F<capoeirab@cpan.org>>

=head1 COPYRIGHT & LICENSE

Copyright (c) 2019 Chase Whitener. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
