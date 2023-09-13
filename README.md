# ditto.rb
Echo server that mocks endpoints.
It is implemented using JSON:API

## How to run
`bundle install`  
`rake db:migrate`  
`thin -R config.ru start`  

## Project structure
- `apps` - three rack apps (router, main, admin). Router is responsible for routing requests between main and admin.
- `db` - migrations, db files and configurations (I'm using sqlite)
- `interactors` - ruby objects to isolate logic
- `models` - sequel models
- `serializers` - JSON:API serializers
- `spec` - rspec
- `ditto.rb` - the main entry point with all the dependencies
- `Rakefile` - has all the rake tasks defined

## TODO
- add proper errors and serialization
- model validations
- proper documentation
- fix serializing issue (Response)
- docker image
- JWT authentication and rake task to generate tokens
