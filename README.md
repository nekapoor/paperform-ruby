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


## Auth

After we have gotten our token, we just need to initialize the client

```ruby
 client = Paperform::Client.new(token: token)
```

Every request returns a JSON body response

## Forms
```ruby
client.forms
```

You can also pass in parameters that you need.

```ruby
client.forms(limit: 200, skip: 3)
``

## Form

```ruby
client.form(slug_or_id)
```

## Form Fields

```ruby
client.form_fields(slug_or_id)
```

## Partial Submissions

```ruby
client.partial_submissions
```
You can also pass in parameters that you need.

```ruby
client.partial_submissions(limit: 200, skip: 3)
```

## Partial Submission

```ruby
client.partial_submission(slug_or_id)
```


## Submissions

```ruby
client.submissions
```
You can also pass in parameters that you need.

```ruby
client.submissions(limit: 200, skip: 3)
```

## Submission

```ruby
client._submission(slug_or_id)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nekapoor/paperform-ruby.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
