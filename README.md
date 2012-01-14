What?
=====

A simple pluggable system to create a single point of entry
into systems like Google and other utility services found over
the web

It lets you create search keywords like:

     book neil stephenson
     map E14
     guk guardian

These searches might search the Amazon book section, use Google
maps and search the UK edition of Google specifically.  Essentially
this creates a CLI for the web.

You can use (or create) plugins to extend the behavior, plugins
exist to integrate with Google Custom Search Engines and also
my Passmakr gem for password generation.

There of course existing systems like this and you can even find
comparable features in many browsers. I've found that I do not always
agree with the keywords used in some of the public services and could
not override them.  These services also rely on a service matching your
needs existing somewhere else.  With Oldskool you can host services inside
the Oldshool process using a simple plugin interface, like ones supporting
specific Google Custom Search Engines or generating passwords using a gem.

It's completely static and should deploy easily to Heroku on their
free tier.

We'll soon create a Mycroft plugin so that you can easily install it
as a search engine into Chrome, Firefox or IE.

Deploying?
----------

This is a Sinatra application and can be deployed just like any other Sinatra
application, it's designed to be used with Bundler to install the various Gems.

It should also just deploy to Heroku using the files and config below but just
pushed to Heroku instead of your own servers.

Basically you need to create an Apache vhost with Passenger and copy the following
files from the oldskool gem, you can find these files in this GitHub repository or
in the Gem.

Copy the _Gemfile_, _GemFile.lock_ and _config.ru_ files into your vhost, you should
also create a _config_ directory and create a file _oldskool.yaml_ in it, see an
example below:

    ---
    :google_api_key: YOUR_API_KEY
    :username: you
    :password: secret
    :keywords:
    - :type: :gcse
      :cx: YOUR_SEARCH_ENGINE
      :keywords:
      - g
      - :default
    - :type: :url
      :url: http://amazon.co.uk/exec/obidos/search-handle-url/index=books-uk&field-keywords=%Q%
      :keywords:
      - book
      - books
    - :type: :url
      :url: http://maps.google.co.uk/maps?q=%Q%
      :keywords:
      - map
      - gmuk
      - gmap
    - :type: :password
      :keywords: pass

The above sets up 7 keywords:

 * A Google Custom Search Engine with the keyword _g_, this is the default keyword when none is specified
 * A book specific search at Amazon UK with the keywords _book_ and _books_
 * A Google Map search with the keywords _map_, _gmuk_ and _gmap_
 * A Password generator with the password _pass_

This setup use 2 plugins - the GCSE and Password plugins.

If you include the _:username_ and _:password_ lines Basic HTTP Auth will be enabled for
your site

To activate these just put the following in your _Gemfile_

    source 'http://rubygems.org'

    gem 'sinatra'
    gem 'oldskool'
    gem 'oldskool-password'
    gem 'oldskool-gcse'

and run:

    $ bundle install --deployment

This will fetch all the needed gems and install it locally to your vhost, you should be able
to just run it under Passenger now else you can easily test it using _rackup_

    $ bundle exec rackup -o 0 -p 4567

This will start up a webserver on port _4567_ on your machine that you can browse to

Installing Plugins?
-------------------

There are some plugins already - see the oldskool-gcse and oldskool-password ones in my GitHub account -
to install those simply add them to the _Gemfile_ of your site as in the example above and update the bundle.

To tie the new plugins to keywords you should edit the config file of your site, what to add to it depends
on the specific plugin - see the individual plugin documentation for details.

Contact?
--------

R.I.Pienaar / rip@devco.net / @ripienaar / http://devco.net/
