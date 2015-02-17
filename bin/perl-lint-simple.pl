#!/usr/bin/env perl

=head1 NAME

perl-lint-simple.pl - A simple Perl::Lint runner

=head1 GETTING START

    $ curl -l http://tinyurl.com/ichigotake-perl-lint-simple.pl > bin/perl-lint-simple.pl
    $ chmod +x bin/perl-lint-simple.pl
    $ bin/perl-lint-simple.pl target_dir1 target_dir2 ... # or default "lib"

Lint results to stdout with Data::Dumper.

=head1 LICENSE

Copyright (C) ichigotake.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

ichigotake <ichigotake.san@gmail.com>

=cut

use strict;
use warnings;
use utf8;
use feature qw(say);
use Perl::Lint;

my @target_files = ();
my @target_dirs = scalar(@ARGV) ? @ARGV : ('lib');

for my $dir (@target_dirs) {
    &retrieve($dir);
}

my $linter = Perl::Lint->new;
my $violations = $linter->lint(\@target_files);
say Dumper($violations);

say "\n----";
say "Target files";
say "----";
say "@target_files";

sub retrieve {
    my ($dir) = @_;
    my @files = glob("$dir/*");
    for my $file (@files) {
        if (-d $file) {
            &retrieve($file);
            return;
        }
        if ($file =~ m/\.(pm)|(pl)|(t)$/) {
            push(@target_files, $file);
        }
    }
}

