My Way
======

My Way is a little snippet of sanity that takes care of many of the pains of Sinatra.

My Way exists to make large sinatra applications as easy as small ones.


So what is My Way?
------------------

* A set of *compatible* gems including many helpers from the farest reaches of Ruby (see Gems bellow)
* A simple folder structure for Sinatra applications small and large.
* A minimal amount of Ctrl+C, Ctrl+V in your applications. My Way works hard to keep the templating to a minimum.




Installation
============

*gem install my_way*
Note: you need to install my_way before running your application. It will not automatically be installed by bundler.




Gems
====

These gems are easily installed with *gem install my_way* and automatically included in each My Way application.

Infastructure
--------------
* gem "rack"
* gem "sinatra"


Assets
------

* gem "sinatra-assetpack"
* gem "json"
* gem "less"
* gem "haml"
* gem "erubis"
* gem "therubyracer" # required for coffee-script
* gem "coffee-script"


Helpers
-------

* gem "padrino-helpers"
* gem "i18n"


Development Only
----------------

* sinatra-contrib/reloader




Folder Structure
================

* */*
  * */config/* - configuration files (yml files usually) go here.
  * */APP_NAME/routes/* - routes can be placed in .rb files here for large apps or in /APP_NAME/app.rb for simpler apps.
  * */APP_NAME/views/* - views go here, this is standard Sinatra.
  * */APP_NAME/images/* - images go here, this is Sinatra Asset-Pack territory.
  * */APP_NAME/js/* - js goes here, this is Sinatra Asset-Pack territory.
  * */APP_NAME/css/* - css goes here, this is Sinatra Asset-Pack territory.
  * */APP_NAME/public/* - non-js/css/image static content can be placed here.




Addendum
========

How is My Way different from Padrino?
-------------------------------------

Padrino is a framework to simplify large sinatra applications. My Way is a library to simplify large sinatra applications. Both are good, both are modular. With Padrino you use Padrino-ized tools and with My Way you use the standard Ruby and Sinatra toolchain your used to: Bundler, Rack::Builder, Rackup, etc. My Way just inserts all my favourite Sinatra helpers and libraries (and hopefully yours too) into your app.

Some of the gems My Way includes come from the nice people at Padrino.. That's probably just confusing this whole situation though.

Padrino vs. My Way is a personal preference. My Way is not for everyone. In fact My Way was really only ever written to fufil my needs.

So if My Way seems a little too understated for your needs check out Padrino. They take care of all sorts of stuff for your app and they have a very cool admin panel too. Seriously. Check them out. http://www.padrinorb.com/

