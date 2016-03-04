Unreleased
==========

* [➦] Merged changes
* [➠] Updated Gems / RuboCop is happy again
* [➠] Moved Rake tasks out of library
* [➠] Updated Rubocop configuration
* [➠] Updated Travis CI configration and test against the latest MongoDB version

1.4.2
=====

* [➠] Updated Gems

1.4.1
=====

* [➠] Extracted build steps for MongoDB on Travis CI into own script
* [➠] Moved Mongoid configuration under `spec/resources`
* [➠] Moved fabricators under `spec/resources`
* [➠] Modified concerns shared example
* [➠] Updated Gems

1.4.0
=====

* [➠] Modified RSpec shared examples
* [➠] Minor changes / clean up
* [➠] Updated Gems

1.3.0
=====

* [➠] Support for Mongoid 5.x
* [➠] Use `mongoid_cleaner` instead of `database_cleaner`
* [➠] Updated Gems

1.2.0
=====

* [➠] Splitted `Mongoid::UUID` shared example into `Mongoid::UUID::Concerns`, `Mongoid::UUID::Creation`,
     `Mongoid::UUID::Fabrication` and `Mongoid::UUID::ReadOnlyAttribute`
* [➠] Updated Gems

1.1.1
=====

* [♻] Cleaned up
* [➠] Updated Gems

1.1.0
=====

* [➠] Extracted specs into shared example for shared usage
* [➠] Updated Gems

1.0.0
=====

* [✚] Added specs
* [✚] First implementation
* [➠] Configured Travis CI, Code Climate, Test Coverage, RuboCop and Gemnasium
* [❶] First commit, added common files