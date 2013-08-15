## Purpose

Keep your gems up to date with a rake task. up_to_date will `bundle update`
each outdated gem that appears in your Gemfile, run the default rake task for
your project, and if they pass commit the changes to your Gemfile.lock to the
project's git repository.

## Caveats
This is alpha.

There currently aren't any tests in place. Running the update task is going to
make commits to your local git repository. If you don't have good coverage for
things that get updated, up_to_date can't figure that out. This is designed to
take the bulk of the work out of keeping your gems up to date. Some manual work
may still be required.

## Installation

Add this line to your application's Gemfile:

    gem 'up_to_date'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install up_to_date

## Usage

    $ rake deps:outdated
    $ rake deps:update

## Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Write tests for your feature
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request
