# Paperform-Ruby

This gem is a VERY basic wrapper around the very new Paperform API. I love Paperform and use it a lot in a lot of my projects. The API will help a lot and this wrapper should (hopefully!) make things easier as well.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paperform-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperform-ruby

## Usage

Head to the [developer documentation page](https://paperform.co/developer/api-v1-documentation/) on the paperform website for general info about the api. To get started, you'll need to generate a token. This will serve as the bearer token passed with every request you send to Paperform. Visit [this page](https://paperform.co/account/developer) in your paperform account to generate one. Note that you'll need to have a Pro or Agency account in order to use the API. Store this somewhere in your rails app (like a .env file or something). From there, you can use the gem like this:

### Submissions

```ruby
require 'paperform'

submission = Paperform::Submission.new(ENV['PAPERFORM_TOKEN']) # assuming I stored my paperform token in the env variable PAPERFORM_TOKEN

submission.list('sample-form') # this is the slug prefix in your paperform url. Ie, sample-form.paperform.co.

submission.list('<uuid>') # this is the uuid of the submission. You can find this value for a given submission in your paperform account

```

This will return a list of submitted forms. You can also pass an options hash as a second parameter. Check the developer documentation link above for attributes you can send in this options hash.


### Partial Submissions

```ruby
require 'paperform'

partial_sub = Paperform::PartialSubmission.new(ENV['PAPERFORM_TOKEN']) # assuming I stored my paperform token in the env variable PAPERFORM_TOKEN

partial_sub.list('sample-form') # this is the slug prefix in your paperform url. Ie, sample-form.paperform.co.

partial_sub.list('<uuid>') # this is the uuid of the submission. You can find this value for a given submission in your paperform account

```

This will return a list of partially submitted forms. You can also pass an options hash as a second parameter. Check the developer documentation link above for attributes you can send in this options hash.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nekapoor/paperform-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
