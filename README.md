[Mongoid UUID]
==============

[![Travis CI Status][Travis CI Status]][Travis CI]
[![Code Climate Status][Code Climate Status]][Code Climate]
[![Test Coverage Status][Test Coverage Status]][Test Coverage]
[![Gemnasium Status][Gemnasium Status]][Gemnasium]

**Universally unique identifier (UUID) for [Mongoid] documents.**

Installation
------------

1. Add Mongoid UUID to your Gemfile:

    ```
    gem 'mongoid-uuid', github: 'bitaculous/mongoid-uuid'
    ```

2. Run `bundle` to install all dependencies with [Bundler]

Usage
-----

```ruby
class Sample
  include Mongoid::Document
  include Mongoid::UUID

  field :name
end

sample = Sample.create! name: 'Condimentum Ligula'

sample.uuid # Returns a `BSON::Binary` object
sample.uuid.data # Returns UUID as string
```

### [RSpec]

1. Require `mongoid/uuid/rspec` in your spec helper

2. Use `it_behaves_like 'Mongoid::UUID'` to test your model

    ```ruby
    RSpec.describe Sample, type: :model do
      it_behaves_like 'Mongoid::UUID'
    end
    ```

    or

    ```ruby
    RSpec.describe Sample, type: :model do
      sample  = Fabricate :sample
      sample2 = Fabricate :sample2

      it_behaves_like 'Mongoid::UUID'
      it_behaves_like 'Mongoid::UUID::Fabrication', sample, sample2
      it_behaves_like 'Mongoid::UUID::ReadOnlyAttribute', sample
    end
    ```

Development
-----------

### Run specs with [RSpec]

Run `rspec`.

or via [Guard]:

```
$ guard -g spec
```

### See Test Coverage

Run `COVERAGE=true rspec`.

### Run [RuboCop]

Run `rubocop`.

To run all specs and RuboCop altogether, run `rake`.

Bug Reports
-----------

Github Issues are used for managing bug reports and feature requests. If you run into issues, please search the issues
and submit new problems [here].

Credits
-------

### Mongoid UUID uses code from the following repositories:

* [mongoid-uuid](https://github.com/badlamer/mongoid-uuid "mongoid-uuid") by [Yury Druzhkov](https://github.com/badlamer "Yury Druzhkov")
* [mongoid-uuid-securerandom](https://github.com/warrenguy/mongoid-uuid-securerandom "mongoid-uuid-securerandom") by [Warren Guy](https://github.com/warrenguy "Warren Guy")
* [vidibus-uuid](https://github.com/vidibus/vidibus-uuid "vidibus-uuid") by [Vidibus](https://github.com/vidibus "Vidibus")

License
-------

Mongoid UUID is released under the [MIT License (MIT)], see [LICENSE].

[Bundler]: http://bundler.io "The best way to manage a Ruby application's gems"
[Code Climate]: https://codeclimate.com/github/bitaculous/mongoid-uuid "Mongoid UUID at Code Climate"
[Code Climate Status]: https://img.shields.io/codeclimate/github/bitaculous/mongoid-uuid.svg?style=flat "Code Climate Status"
[Gemnasium]: https://gemnasium.com/bitaculous/mongoid-uuid "Mongoid UUID at Gemnasium"
[Gemnasium Status]: https://img.shields.io/gemnasium/bitaculous/mongoid-uuid.svg?style=flat "Gemnasium Status"
[Guard]: http://guardgem.org "A command line tool to easily handle events on file system modifications."
[here]: https://github.com/bitaculous/mongoid-uuid/issues "Github Issues"
[LICENSE]: https://raw.githubusercontent.com/bitaculous/mongoid-uuid/master/LICENSE "License"
[MIT License (MIT)]: http://opensource.org/licenses/MIT "The MIT License (MIT)"
[Mongoid]: http://mongoid.org "Ruby ODM framework for MongoDB"
[Mongoid UUID]: https://bitaculous.github.io/mongoid-uuid/ "Universally unique identifier (UUID) for Mongoid documents."
[RSpec]: http://rspec.info "Behaviour Driven Development for Ruby"
[RuboCop]: https://github.com/bbatsov/rubocop "A Ruby static code analyzer, based on the community Ruby style guide."
[Test Coverage]: https://codeclimate.com/github/bitaculous/mongoid-uuid "Test Coverage (Code Climate)"
[Test Coverage Status]: https://img.shields.io/codeclimate/coverage/github/bitaculous/mongoid-uuid.svg?style=flat "Test Coverage Status"
[Travis CI]: https://travis-ci.org/bitaculous/mongoid-uuid "Mongoid UUID at Travis CI"
[Travis CI Status]: https://img.shields.io/travis/bitaculous/mongoid-uuid.svg?style=flat "Travis CI Status"