# This project is no longer under active development

# Follow All

[![Build Status](http://img.shields.io/travis/codeforamerica/follow-all.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/codeforamerica/follow-all.svg)][gemnasium]
[![Coverage Status](http://img.shields.io/coveralls/codeforamerica/follow-all.svg)][coveralls]

[travis]: http://travis-ci.org/codeforamerica/follow-all
[gemnasium]: https://gemnasium.com/codeforamerica/follow-all
[coveralls]: https://coveralls.io/r/codeforamerica/follow-all

Follow All allows you to select a Twitter list and follow all of its members.

## Screenshot
![Follow All](https://github.com/codeforamerica/follow-all/raw/master/screenshot.png "Follow All")

## Installation
    git clone git://github.com/codeforamerica/follow-all.git
    cd follow-all
    bundle install

## Usage
Running your own instance of Follow All requires you to [register an app with
Twitter][apps] to obtain OAuth credentials. After you register your app, go to
the "Settings" tab, set a Callback URL in the "Application Type" section, and
click "Update this Twitter application's settings." It doesn't matter what the
URL is, as long as one is set.

![Twitter app callback URL](https://github.com/codeforamerica/follow-all/raw/master/twitter-screenshot.png)

Once you obtain credentials, substitute your consumer key and secret into the
command below. You can find your consumer key and secret in your Twitter app's
"Keys and Access Tokens" section.

[apps]: http://dev.twitter.com/apps

    CONSUMER_KEY=abc CONSUMER_SECRET=123 rails server

## Supported Ruby Version
This library aims to support and is [tested against][travis] Ruby version 1.9.3.

## Copyright
Copyright (c) 2011 Code for America. See [LICENSE][] for details.

[license]: https://github.com/codeforamerica/follow-all/blob/master/LICENSE.md

