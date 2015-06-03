
source 'https://rubygems.org'
#ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails'
gem 'rails', github: 'rails/rails', branch: '4-2-stable'  # avoid arel problem
gem 'bootstrap-sass', '2.3.2.0'
gem 'sprockets', '2.12.3'

gem 'json'

gem 'therubyracer'
gem 'devise', '~> 3.4.0'   # or later
gem 'omniauth'
gem 'omniauth-cas'

group :development, :test do
  # Use sqlite3 as the database for Active Record for dev
  gem 'sqlite3'
end

group :production do
  # Use postgres as the database for Active Record for dev
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use dropzone gem instead of having the javascript and css in /assets [jrl]
gem 'dropzonejs-rails'

# carrierwave for upload details
#gem 'carrierwave'

# use rspec for tests
gem 'rspec-rails'
gem 'rspec'

#gem "bootstrap-sass", "~> 2.2.0"

gem 'protected_attributes'

gem 'simplecov', :require => false, :group => :test

#gem 'arel', '6.0.0.beta2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]