## Mojolicious sample app with OpenAPI plugin

This is a demonstration of using Mojolicious to serve GraphQL with the
OpenAPI "convert" plugin, to talk to the CPAN testers API.

### To use:

```
cpanm --installdeps .
./myapp.pl daemon -l http://*:5000
```

Point your browser at http://localhost:5000

After clicking through to the GraphiQL tool, try entering this query in
the upper left-hand pane:

```
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
