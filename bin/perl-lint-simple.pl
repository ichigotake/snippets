#!/usr/bin/env perl

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

