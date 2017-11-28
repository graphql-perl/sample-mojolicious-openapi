use strict;
use warnings;
BEGIN {
  $ENV{MOJO_MODE}    = 'testing';
  $ENV{MOJO_REACTOR} = 'Mojo::Reactor::Poll';
}
use Test::More;
use FindBin;
require "$FindBin::Bin/../myapp.pl";
use Test::Mojo;
my $t = Test::Mojo->new;

subtest 'GraphiQL' => sub {
  my $res = $t->get_ok('/graphql', {
    Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
  })->content_like(qr/React.createElement\(GraphiQL/, 'Content as expected');
};

subtest 'GraphQL with POST' => sub {
  $t->post_ok('/graphql', { Content_Type => 'application/json' },
    <<'EOF',
{"query":"{ v3_report_get(id: \"a35ce723-6bf8-1014-858b-1fdf904013f2\") { id } }"}
EOF
  )->json_is(
    {
      data => {
        v3_report_get => {
          id => 'a35ce723-6bf8-1014-858b-1fdf904013f2',
        },
      }
    }
  );
};

done_testing;
