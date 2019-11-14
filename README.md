# DeviseJwtControllers

[![Build Status](https://travis-ci.org/Wolox/devise_jwt_controllers.svg?branch=development-1.x.x)](https://travis-ci.org/Wolox/devise_jwt_controllers) [![Maintainability](https://api.codeclimate.com/v1/badges/d37c76dac875775e487d/maintainability)](https://codeclimate.com/github/Wolox/devise_jwt_controllers/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/d37c76dac875775e487d/test_coverage)](https://codeclimate.com/github/Wolox/devise_jwt_controllers/test_coverage) [![Gem Version](https://badge.fury.io/rb/devise_jwt_controllers.svg)](https://badge.fury.io/rb/devise_jwt_controllers)

This gem add devise-jwt JSON-like controllers to your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise_jwt_controllers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise_jwt_controllers

## Usage

Setup [devise](https://github.com/plataformatec/devise) an [devise-jwt](https://github.com/waiting-for-dev/devise-jwt) as normal.

You then just replace your `devise_for` in `config/routes.rb` with `devise_jwt_for`.

`devise_jwt_for` accepts the same arguments as `devise_for`, and configurations.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/devise_jwt_controllers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## About
This project was developed by [Leon Calermo](leoncalermo) and [Ramiro Rojo](https://github.com/holywyvern).

Maintainers: [Leon Calermo](https://github.com/leoncalermo)

Contributors: [Ramiro Rojo](https://github.com/holywyvern)

This gem is eveloped at [Wolox]((http://www.wolox.com.ar)):

[![Wolox](https://raw.githubusercontent.com/Wolox/press-kit/master/logos/logo_banner.png)]((http://www.wolox.com.ar))

## Code of Conduct

Everyone interacting in the DeviseJwtControllers project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/devise_jwt_controllers/blob/master/CODE_OF_CONDUCT.md).
