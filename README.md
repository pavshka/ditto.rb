# ditto.rb
Echo server that mocks endpoints.
It is implemented using JSON:API

## How to run
`bundle install`  
`tasks/db/migrate`  
`thin -R config.ru start`  

## Project structure
- `apps` - three rack apps (router, main, admin). Router is responsible for routing requests between main and admin.
- `db` - migrations, db files and configurations (I'm using sqlite)
- `interactors` - ruby objects to isolate logic
- `models` - sequel models
- `serializers` - JSON:API serializers
- `spec` - rspec
- `tasks` - scripts to perform tasks
- `ditto.rb` - the main entry point with all the dependencies

## TODO
- update and delete interactors
- model validations
- docker image
- proper documentation
- fix serializing issue (Response)
- add proper errors and serialization
- start using rake for tasks
- implement schema dump task
- JWT authentication and rake task to generate tokens
