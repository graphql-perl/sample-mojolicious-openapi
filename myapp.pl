#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

plugin GraphQL => {
  convert => [ 'OpenAPI', 'cpantesters-v3.json' ],
  graphiql => 1,
};

app->start;
__DATA__

@@ index.html.ep
% title 'Perl-GraphQL demo app';
<!DOCTYPE html>
<html lang="en">
<head>
  <title><%= title %></title>
</head>
<body>
<div id="page">
  <div id="content">
    <h1>Perl GraphQL Mojolicious Demo App</h1>
    <p>This demonstrates use of GraphQL in a Mojolicious::Lite app.</p>
    <p>The schema is a conversion of the CPAN Testers REST API to GraphQL.</p>
    <p>The frontend uses the GraphiQL tool to query the Perl GraphQL backend.</p>
    <p>To use the demo, type:</p>
    <p><pre>{
  v3_report_get(id: "a35ce723-6bf8-1014-858b-1fdf904013f2") {
    id
    created
    reporter {
      name
    }
  }
}</pre></p>
    <p>in the left hand pane in GraphiQL, then run your query using the button at the top.</p>
    <p>Results are displayed in the pane to the right.</p>
    <h2>Click to <%= link_to 'enter GraphiQL' => '/graphql' %>.</h2>
  </div>
<div>
</body>
</html>
