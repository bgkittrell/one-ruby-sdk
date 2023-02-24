# Has this ever happened to you?

![One does not simply](https://github.com/bgkittrell/one-ruby-sdk/blob/main/undefined.jpg?raw=true)

We'll not anymore! With the OneRuby gem you can get a list of all of the LOTR movies and quotes, in your code!

This gem is a wrapper for [The One API to Rule Them All](https://the-one-api.dev).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'one-ruby-sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install one-ruby-sdk

## Configuration

Simply set your API Key as below. For Rails, include this in an initializer file. Sign up for a key [here](https://the-one-api.dev/sign-up)

```ruby
OneRuby.config do |c|
    c.api_key = '[PASTE API KEY HERE]'
end
```

## Usage

This gem currently only supports looking up movie data.

### Movies

```ruby
# Get a list of ALL the LOTR movies
movies = OneRuby::Movie.list
=> [<OneRuby::Movie>]

# Get details about a single movie
movie = OneRuby::Movie.find('5cd95395de30eff6ebccde56')
=> <OneRuby::Movie>

movie.id #=> '5cd95395de30eff6ebccde56'
movie.name #=> 'The Lord of the Rings Series'
movie.runtime_in_minutes #=> 558
movie.budget_in_millions #=> 281
movie.box_office_revenue_in_millions #=> 2917
movie.academy_award_nominations #=> 30
movie.academy_award_wins #=> 17
movie.rotten_tomatoes_score #=> 94
```

### Quotes

```ruby
# Get a list of quotes from a movie
quotes = OneRuby::Quote.list('5cd95395de30eff6ebccde5b')
=> [<OneRuby::Quote>]

quotes[0].id #=> '5cd95395de30eff6ebccde56'
quotes[0].dialog #=> 'Man Flesh!'
quotes[0].movie_id #=> '5cd95395de30eff6ebccde50'
quotes[0].character_id #=> '5cd95395de30eff6ebccde51'
```

## Coming Soon!

- More objects including characters and books
- Filtering
- Pagination support

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bgkittrell/one-ruby-sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
