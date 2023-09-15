use strict;
use warnings;
use Plack::App::Directory;
use Plack::Runner;
my $dir;
$dir=shift @ARGV if($#ARGV>=1);
if(!defined($dir) || ! -d $dir) {
        CORE::say("Dir is not set or doesn't exist!");
        exit -1;
}
my $app = Plack::App::Directory->new({ root => $dir})->to_app;
my $runner = Plack::Runner->new;
$runner->parse_options(@ARGV);
$runner->run($app);
