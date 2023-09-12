# ditto.rb
Echo server that mocks endpoints

## Approaches
- Load all the routes from the Database on Application initialization
- Separate Rack Application that would redirect all the requests

## Database
Use `db/migrate` to migrate the DB to the latest version.
`db/migrate` also defines the name of the DB, adapter and path to migration files
