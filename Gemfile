source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
	gem 'sqlite3'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov'
  gem 'debugger'
end

group :production do
	gem 'pg'
  gem 'rails_12factor'
end


group :assets do
	gem 'coffee-rails', '~> 4.0.0'
	gem 'uglifier', '>= 1.3.0'
	gem 'sass-rails', '~> 4.0.0'
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#gem 'protected_attributes'    # allows attr_acessible
gem 'jquery-rails'
gem 'turbolinks'							# makes following links faster
gem 'jbuilder', '~> 1.2'			# Build JSON APIs with ease.

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'      # automatically adds the proper vendor prefixes to your CSS code when it is compiled
gem 'devise'									# a flexible authentication solution

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
