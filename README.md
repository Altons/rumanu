# Rumanu

Tiny gem for Numerology. Calculate your Life Path and Destiny Numbers

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rumanu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rumanu

## Usage

```ruby
require 'rumanu'

jl = Numerology.new("John Lennon","09.10.1940");
puts jl.dob
# "09.10.1940"
puts jl.destiny
# 6
puts jl.destiny.destiny
# "Your destiny is to provide a nurturing safe ‘nest’ for yourself and your loved ones."

puts 9.destiny
# "Your destiny is to achieve a higher state of consciousness and teach others how to achieve theirs."

puts jl.motivation
# 8
puts jl.motivation.meaning
# {"positive"=>"decisive, determined, political skills, strong willed, loyal, fighter for a cause",
# "negative"=>"workaholic, cruel, greedy, impatient, revengeful"}

puts jl.expression.meaning
# {"positive"=>"integrity, solid, organized, highly practical, visionary",
# "negative"=>"indifference, skewed to details vs. big picture, slow, narrow, spiteful"}

puts jl.personality.meaning
# {"positive"=>"visionary, traveler, explorer, flexible, quick to learn", "negative"=>"impatient, vulgar, # # restless, impulsive"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Altons/rumanu. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rumanu project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rumanu/blob/master/CODE_OF_CONDUCT.md).
