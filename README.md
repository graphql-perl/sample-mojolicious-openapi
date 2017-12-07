## Mojolicious sample app with OpenAPI plugin

This is a demonstration of using Mojolicious to serve GraphQL with the
OpenAPI "convert" plugin, to talk to the CPAN testers API.

### To use:

```shell
cpanm --installdeps .
./myapp.pl daemon -l http://*:5000
```

Point your browser at http://localhost:5000

After clicking through to the GraphiQL tool, try entering this query in
the upper left-hand pane:

```graphql
{
  v3_report_get(id: "a35ce723-6bf8-1014-858b-1fdf904013f2") {
    id
    created
    reporter {
      name
    }
  }
}
```

### Docker container

The supplied script `build-container` and `Dockerfile` together allow
you to build a Docker image with this app inside. It is based on
`graphqlperl/mojoliciousplugin`.

The `build-container` takes an optional argument, `prereq`. If given, it
will build and push not the app but the prerequisites for the app. This
allows faster iteration when developing the app.

To run the app's container, exposing its internal port 80 as your port 5000:

```shell
docker run -p 5000:80 graphqlperl/sample-openapi
```
