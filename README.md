Smart Filters Demo
==================

This is the application smart_filters will be extracted from.

Setup
-----

Bundle up the gems:
bundle install

Check database.yml to change configuration, then initialize the database with test data:
rake db:create db:migrate db:seed

Install the plugin to test the bleeding edge features:
script/plugin install git://github.com/Monaqasat/smart_filters.git

Start the server:
script/server