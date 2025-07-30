source 'https://rubygems.org'

gem 'rails', '8.0.2'

# 変更によるリスクが大きいためバージョン指定
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
# readmeで指定されているためバージョン指定
gem 'haml-rails', '~> 2.0'
gem 'importmap-rails'
gem 'propshaft'
# 変更による影響が大きいためバージョン指定
gem 'pg', '~> 1.1'
# 変更による影響が大きいためバージョン指定
gem 'puma', '>= 5.0'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'factory_bot_rails'
  # 指定しないと開発ビルドを参照するとのことなのでバージョン指定 https://github.com/rspec/rspec-rails?tab=readme-ov-file#installation
  gem 'rspec-rails', '~> 8.0.0'
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
