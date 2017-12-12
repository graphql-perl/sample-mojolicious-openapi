requires 'Mojolicious::Lite';
requires 'GraphQL' => '0.24'; # handle list of enum
requires 'Mojolicious::Plugin::GraphQL' => '0.06'; # convert plugin
requires 'GraphQL::Plugin::Convert::OpenAPI' => '0.05'; # hash pairs
requires 'IO::Socket::SSL' => '1.94'; # TLS support

on test => sub {
  requires 'Test::Mojo';
};
