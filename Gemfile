source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'pg'
gem 'jquery-validation-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'jquery-ui-rails'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
#gem para acceder a los servicios de google
gem "nested_form", :git => 'https://github.com/ryanb/nested_form.git'
gem "brakeman", :require => false

#gem para el manejo de usuarios
gem 'devise', '~> 4.3'
gem 'newrelic_rpm'
#gem para autenticacion de usuarios con google


#jquery para rails 
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

#bootstrap
gem 'twitter-bootstrap-rails', '~> 4.0'
gem 'fog', '~> 1.38'
gem 'figaro'
#manejo de archivos
gem 'carrierwave', '~> 0.11.2'

gem 'will_paginate',           '3.1.0'
#Fronend
gem 'bootstrap-will_paginate', '0.0.10'
#Ver los campos en los modelos
gem 'annotate'
gem "font-awesome-rails"
gem "mini_magick"
gem 'chosen-rails'
gem 'active_decorator', '~> 0.7.1'
gem 'wicked_pdf'
gem 'roo'
gem 'wkhtmltopdf-binary'
gem 'google-api-client', '0.8.2', require: 'google/api_client'
gem 'google_calendar', '~> 0.6.2'
gem 'omniauth-google-oauth2'
gem 'jquery-datetimepicker-rails'

gem 'roo'
gem 'chartjs-ror'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'


end


group :production do
   gem 'rails_12factor'
 
  
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
