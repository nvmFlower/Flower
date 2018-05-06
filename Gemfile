source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "~> 3.1", ">= 3.1.11"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "~> 3.3.6"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker", :git => "https://github.com/stympy/faker.git", :branch => "master"
gem "fog", "1.42"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "kaminari"
gem "kaminari"
gem "meta-tags-helpers", "~> 0.2.0"
gem "mini_magick", "4.7.0"
gem "mysql2", ">=0.3.18", "<0.6.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "rails-i18n", "~> 5.1"
gem "ransack"
gem "sass-rails", "~> 5.0"
gem "sprockets-rails"
gem "textacular", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :production do
  gem "fog", "1.42"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rubocop", "0.47.1", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
