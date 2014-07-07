Kyosu
===================

A simple, open, realtime notification service

Install
----------------

Install dependencies:

    $ bundle install --path .bundle --without development test

Database preference:

    $ export MONGODB_URI=mongodb://<user id>:<password>@<host>:<port>/<db name>

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

    $ bundle exec rails server
Testing
---------------

launch mongodb:

    $ mkdir kyosu_test
    $ mongod --dbpath kyosu_test

Run tests:

    $ bundle exec rake
