requires 'Mojolicious::Lite';
requires 'GraphQL' => '0.20'; # convert plugin
requires 'Mojolicious::Plugin::GraphQL' => '0.06'; # convert plugin
requires 'GraphQL::Plugin::Convert::OpenAPI' => '0.02'; # makes queries

on test => sub {
  requires 'Test::Mojo';
};