source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails',          '~> 4.1.1'
gem 'bootstrap-sass', '~> 2.0'
gem 'haml'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'rails_12factor'
gem 'twitter'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails', '>= 4.0.3'
  gem 'uglifier'
end

group :production do
  gem 'puma'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'coveralls', require: false
  gem 'mocha', require: false
  gem 'rubocop'
  gem 'simplecov', require: false
  gem 'webmock'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
