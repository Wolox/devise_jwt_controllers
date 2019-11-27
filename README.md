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

If you are only planning to use it as an API only, remember to configure devise to respond only to JSON:


In your `config/initializers/devise.rb` add:

```rb
config.jwt do |jwt|
  jwt.secret = 'Some secret key'
end

config.navigational_formats = %i[json]
```

## Quick start
-   Add `gem 'devise_jwt_controllers’` to your gemfile    
-   Install devise using `rails generate devise:install`. If this doesn't work, remove previous devise files (particularly if you were using devise_token_auth)
-   If you don’t have a configured devise model already, use `rails generate devise User`
-   Run migrations using `rails db:migrate`(if the table already exists, remember to check the migration for possible conflicts)
-   Add the needed configuration for devise jwt in `initializers/devise.rb`
```
Devise.setup do |config|
  config.jwt do |jwt|
    jwt.secret = ENV['DEVISE_JWT_SECRET_KEY']
  end
end
```    
-   Add `:jwt_authenticatable` to the `devise` bit of your model.
-  Require spec helpers using `require 'devise/jwt/test_helpers'` in `spec_helper.rb`
-   In case you need to write specs with a mocker sign in, you can use a shared context like
```
shared_context 'with authenticated admin user' do
  let(:current_user) { create(:user, confirmed_at: Time.zone.now) }
    before do
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, current_user)
    request.headers.merge!(auth_headers)
  end
end
```
-   With all the configuration done, with the server up, you can login making a request to 127.0.0.1:3000/users/sign_in with form data like
 ```
user[email]:eugenio@walker.io
user[password]:the_password
```
And you’ll get a token in headers[:authorization], like `Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTc0NDUxMTUwLCJleHAiOjE1NzQ0NTQ3NTAsImp0aSI6IjU0Mzc5N2E1LWMwZWQtNDM3YS1iZDE4LWM4Njc2OGEyNDIyZiJ9.-DDoju4GPhUtIg65A2GR5T_YOOriopjPW6FZSYlOP8o`
-   Afterwards, send the authorization header in each request.
-   If you need a logout, remember to set a revocation strategy. You can decide which one to use based on [this article](http://waiting-for-dev.github.io/blog/2017/01/24/jwt_revocation_strategies/). Read  [the devise-jwt documentation]([this article](http://waiting-for-dev.github.io/blog/2017/01/24/jwt_revocation_strategies/) for information on how to implement each one. Otherwise, add `jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null` to the devise bit of your model.

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
