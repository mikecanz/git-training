#!/usr/bin/perl

use warnings;
use strict;

use Data::Dumper;

my %groups = ( 
                'regular'   => 'includes Portal Ux',
                'chimp'     => 'unittests ape',
                'ape'       => 'badger monkey ekkeko',
                'monkey'    => 'regular extra',
                'extra'     => 'regular rippers'
             );

my @repos = qw/regular monkey chimp extra ape ape Sa/;

print Dumper repo_group_expansion(\@repos, \%groups);

sub repo_group_expansion
{
    my $repos = shift;
    my $groups = shift;

    my %repos_struct;
    @repos_struct{@{$repos}} = undef;

    foreach my $group (keys %{$groups}) {
        if (exists $repos_struct{$group}){
            delete($repos_struct{$group});
            my @group_repos = split(/\s/, $groups->{$group});
            push(@group_repos, @{repo_group_expansion(\@group_repos, $groups)});
            @repos_struct{@group_repos} = undef;
            @{$repos} = keys(%repos_struct);
        }
    }

    return $repos;
}

