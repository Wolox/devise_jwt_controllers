lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/jwt/controllers/version'

Gem::Specification.new do |spec| # rubocop:disable Metrics/BlockLength
  spec.name          = 'devise_jwt_controllers'
  spec.version       = Devise::JWT::Controllers::VERSION
  spec.authors       = ['Ramiro Rojo', 'David Leon Calermo']
  spec.email         = ['ramiro.rojo@wolox.com.ar', 'leon.calermo@wolox.com.ar']

  spec.summary       = 'A gem to generate documentation out of tests.'
  spec.homepage      = 'https://github.com/Wolox/devise_jwt_controllers'
  spec.license       = 'Apache-2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Wolox/devise_jwt_controllers'
  spec.metadata['changelog_uri'] = 'https://github.com/Wolox/devise_jwt_controllers/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_runtime_dependency 'rails', '>= 5.2.0', '< 6.1'

  spec.add_runtime_dependency 'devise', '~> 4.7.1'
  spec.add_runtime_dependency 'devise-jwt', '~> 0.6.0'

  spec.add_development_dependency 'bundler', '~> 2.0'

  spec.add_development_dependency 'byebug'

  spec.add_development_dependency 'brakeman'

  spec.add_development_dependency 'faker', '~> 2.6.0'

  spec.add_development_dependency 'sqlite3', '~> 1.4.1'

  spec.add_development_dependency 'database_cleaner', '~> 1.7.0'
  spec.add_development_dependency 'factory_bot_rails', '~> 5.1.1'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rspec-rails', '~> 3.9'
  spec.add_development_dependency 'rubocop', '0.75'
  spec.add_development_dependency 'rubocop-rails', '2.3.2'
  spec.add_development_dependency 'rubocop-rspec', '1.36.0'
  spec.add_development_dependency 'simplecov', '~> 0.17.0'
end
