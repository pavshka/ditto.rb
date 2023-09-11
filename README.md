# ditto.rb
Echo server that mocks endpoints

## Approaches
- Load all the routes from the Database on Application initialization
- Separate Rack Application that would redirect all the requests
