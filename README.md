# Follow All [![Build Status](https://secure.travis-ci.org/codeforamerica/follow-all.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/codeforamerica/follow-all.png?travis)][gemnasium]
Follow All allows you to select a Twitter list and follow all of its members.

[travis]: http://travis-ci.org/codeforamerica/follow-all
[gemnasium]: https://gemnasium.com/codeforamerica/follow-all

## <a name="screenshots"></a>Screenshot
![Follow All](https://github.com/codeforamerica/follow-all/raw/master/screenshot.png "Follow All")

## <a name="demo"></a>Demo
You can see a running version of the application at
[http://follow-all.herokuapp.com][demo].

[demo]: http://follow-all.herokuapp.com

## <a name="installation"></a>Installation
    git clone git://github.com/codeforamerica/follow-all.git
    cd follow-all
    bundle install

## <a name="usage"></a>Usage
Running your own instance of Follow All requires you to [register an app with
Twitter][apps] to obtain OAuth credentials. Once you obtain credentials,
substitute your consumer key and secret into the command below.

[apps]: http://dev.twitter.com/apps

    CONSUMER_KEY=abc CONSUMER_SECRET=123 rails server

## <a name="contributing"></a>Contributing
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

## <a name="issues"></a>Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. When submitting a bug report, please include a [Gist][]
that includes a stack trace and any details that may be necessary to reproduce
the bug, including your gem version, Ruby version, and operating system.
Ideally, a bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## <a name="pulls"></a>Submitting a Pull Request
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add tests for your feature or bug fix.
5. Run `bundle exec rake test`. If your changes are not 100% covered, go back
   to step 4.
6. Commit and push your changes.
7. Submit a pull request. Please do not include changes to the gemspec or
   version file. (If you want to create your own version for some reason,
   please do so in a separate commit.)

## <a name="versions"></a>Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3

If something doesn't work on one of these interpreters, it should be considered
a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

## <a name="copyright"></a>Copyright
Copyright (c) 2011 Code for America. See [LICENSE][] for details.

[license]: https://github.com/codeforamerica/follow-all/blob/master/LICENSE.md

[![Code for America Tracker](http://stats.codeforamerica.org/codeforamerica/follow-all.png)][tracker]

[tracker]: http://stats.codeforamerica.org/projects/follow-all
