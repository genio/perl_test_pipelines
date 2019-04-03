use strict;
use warnings;
use ExtUtils::MakeMaker;
use 5.008;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my %BuildReqs = (
    "ExtUtils::MakeMaker" => 0,
);
my %ConfigReqs = (
    "ExtUtils::MakeMaker" => 0,
);
my %DevReqs = (
    "Test::Pod" => 0,
    "Test::Pod::Coverage" => 0,
    "Test::Spelling" => 0,
    "Test::Version" => 0,
);
my %TestReqs = (
    "strict" => 0,
    "warnings" => 0,
    "Carp" => 0,
    "File::Basename" => 0,
    "File::Spec" => '3.01',
    "File::Temp" => 0,
    "Test::More" => 0,
);
my %prereqs = (
    'Exporter' => '5.57',
    "IO::Handle" => 0,
    "strict" => 0,
    "warnings" => 0,
    "utf8" => 0,
);

my %WriteMakefileArgs = (
    'NAME' => 'Perl::Test',
    "DISTNAME" => "Perl-Test",
    'LICENSE' => 'perl_5',
    'AUTHOR' => 'Chase Whitener <capoeirab@cpan.org>',
    'VERSION_FROM' => 'lib/Perl/Test.pm',
    'ABSTRACT_FROM' => 'lib/Perl/Test.pm',
    'META_MERGE' => {
        'dynamic_config' => 0,
        'meta-spec' => {version => 2},
        'no_index' => {directory => ['xt']},
        'resources' => {
            repository => {
                type => 'git',
                url  => 'https://github.com/genio/perl_test_pipelines.git',
                web  => 'https://github.com/genio/perl_test_pipelines',
            },
        },
        'x_contributors' => [
        ],
    },
    "BUILD_REQUIRES" => \%BuildReqs,
    "CONFIGURE_REQUIRES" => \%ConfigReqs,
    "TEST_REQUIRES" => \%TestReqs,
    "PREREQ_PM" => \%prereqs,
    "test" => {
        "TESTS" => "t/*.t",
    },
);

unless ( eval { ExtUtils::MakeMaker->VERSION('6.63_03') } ) {
    my %fallback = (%prereqs, %TestReqs, %BuildReqs);
    delete $WriteMakefileArgs{TEST_REQUIRES};
    delete $WriteMakefileArgs{BUILD_REQUIRES};
    $WriteMakefileArgs{PREREQ_PM} = \%fallback;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION('6.52') };

delete $WriteMakefileArgs{META_MERGE}
  unless eval { ExtUtils::MakeMaker->VERSION('6.46') };

delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION('6.31') };

WriteMakefile(%WriteMakefileArgs);
