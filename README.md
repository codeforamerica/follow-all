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

## Demo
You can see a running version of the application at
[http://follow-all.herokuapp.com][demo].

[demo]: http://follow-all.herokuapp.com

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

## Contributing
In the spirit of [free software][free-sw], **everyone** is encouraged to help
improve this project.

[free-sw]: http://www.fsf.org/licensing/essays/free-sw.html

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up
  inconsistent whitespace)
* by refactoring code
* by closing [issues][]
* by reviewing patches
* [financially][]

[issues]: https://github.com/codeforamerica/follow-all/issues
[financially]: https://secure.codeforamerica.org/page/contribute

## Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. When submitting a bug report, please include a [Gist][]
that includes a stack trace and any details that may be necessary to reproduce
the bug, including your gem version, Ruby version, and operating system.
Ideally, a bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## Submitting a Pull Request
1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add specs for your unimplemented feature or bug fix.
4. Run `bundle exec rake test`. If your specs pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rake test`. If your specs fail, return to step 5.
7. Run `open coverage/index.html`. If your changes are not completely covered
   by your tests, return to step 3.
8. Add, commit, and push your changes.
9. [Submit a pull request.][pr]

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/

## Supported Ruby Version
This library aims to support and is [tested against][travis] Ruby version 1.9.3.

If something doesn't work on this version, it should be considered a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the version above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

## Copyright
Copyright (c) 2011 Code for America. See [LICENSE][] for details.

[license]: https://github.com/codeforamerica/follow-all/blob/master/LICENSE.md

[![Code for America Tracker](http://stats.codeforamerica.org/codeforamerica/follow-all.png)][tracker]

[tracker]: http://stats.codeforamerica.org/projects/follow-all
