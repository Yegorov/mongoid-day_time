# Mongoid DayTime type

Save time in minutes from midnight and show as 24-format string in `HH:MM`

Inspired by their issues:

* [MongoDb opening hours Schema and query for open/closed](https://stackoverflow.com/questions/17460235/mongodb-opening-hours-schema-and-query-for-open-closed)
* [Schema for opening hours MongoDB](https://stackoverflow.com/questions/8375799/schema-for-opening-hours-mongodb)
* [Best way to store only 'time' in MongoDB?](https://groups.google.com/forum/#!topic/mongodb-user/ki7W4MHhXtg)
* [How to order data by ONLY Hour:Minute format in MongoDB/Mongoid? (Without date!)
Ask Question](https://stackoverflow.com/questions/14100782/how-to-order-data-by-only-hourminute-format-in-mongodb-mongoid-without-date)

Some usefull [link](https://docs.mongodb.com/mongoid/current/tutorials/mongoid-documents/#custom-fields)
for create custom type for Mongoid.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid-day_time'
```

And then execute:

    $ bundle

## Usage

```ruby
# in your app/models/my_awesome_model.rb
class MyAwesomeModel
  include Mongoid::Document

  field :name, type: String
  field :time, type: Mongoid::DayTime::Type, default: "9:35"

end
```

```
# in irb:
2.6.0 :01 > MyAwesomeModel.create(name: "foobar", time: "10:15")
 => #<MyAwesomeModel _id: 5c601a38f047055bcd9f2888, name: "foobar", time: 615>
2.6.0 :02 > m = MyAwesomeModel.last
 => #<MyAwesomeModel _id: 5c601a38f047055bcd9f2888, name: "foobar", time: 615>
2.6.0 :03 > m.read_attribute_before_type_cast :time
 => 615
2.6.0 :04 > m.time
 => "10:15"
```

## Gotchas :smirk:

DayTime type has not validation, you can type `10:75` and this respresents as
`10 * 60 + 75` = `675 minutes` what corresponds `11:15`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` or `bin/rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
[github.com/Yegorov/mongoid-day_time](https://github.com/Yegorov/mongoid-day_time).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
