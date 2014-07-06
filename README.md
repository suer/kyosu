Kyosu
===================

A simple, open, realtime notification service

Install
----------------

Install dependencies:

    $ bundle install --path .bundle --without development test

Database preference:

    $ export MONGODB_HOST=localhost
    $ export MONGODB_PORT=27017
    $ export MONGODB_DATABASE=kyosu_production
    $ export MONGODB_USERNAME=admin
    $ export MONGODB_PASSWORD=xxxxx

Omniauth preference:

    $ export OMNIAUTH_PROVIDER=github
    $ export OMNIAUTH_ARGS="['Client ID','Client Secret']"

Run:

    $ bundle exec rails s -e production

and access to http://localhost:3000/

For developers
---------------

launch mongodb:

    $ mkdir kyosu_development
    $ mongod --dbpath kyosu_development

launch application:

    $ bundle exec rake db:migrate RAILS_ENV=test

Testing
---------------

launch mongodb:

    $ mkdir kyosu_test
    $ mongod --dbpath kyosu_test

    $ bundle exec rake db:migrate RAILS_ENV=test

Run tests:

    $ bundle exec rake
