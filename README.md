# MemeGenerate
This is a ruby driver that generate memes using https://memegen.link/.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'meme_generate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meme_generate

## Usage

- You can generate the meme using:

    generate(title, caption, image_url)

For example,

```ruby
generate('Title of meme', 'Caption of the meme', 'https://wallpaperbrowse.com/media/images/pexels-photo-248797.jpeg')
```

It will provide the information if the title, caption and image_url if is invalid and if the meme is generated or not.

- You can get the list of all the fonts using:
```ruby
list_fonts
```

- You can also add font by simply setting the value of:
```ruby
@font = font_name_from_the_list_of_fonts
```

- You can also add width and height using:
```ruby
@width = width_integer
@height = height_integer
```

- Memegen also provides you a special option to generate shareable images as:
```ruby
@share = true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maanavshah/meme_generate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MemeGenerate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maanavshah/meme_generate/blob/master/CODE_OF_CONDUCT.md).
