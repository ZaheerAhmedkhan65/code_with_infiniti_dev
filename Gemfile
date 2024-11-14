source "https://rubygems.org"

# Use a stable version of Rails
gem "rails", "~> 7.2.1", ">= 7.2.1.1"
# Asset pipeline
gem "sprockets-rails"
# Use PostgreSQL for production (recommended over SQLite for scalability)
gem "pg", ">= 1.1", "< 2.0"
# Use sqlite3 for development and testing (still good for local development)
gem "sqlite3", ">= 1.4"
# Puma web server
gem "puma", ">= 5.0"
# ESM import maps for JavaScript
gem "importmap-rails"
# Hotwire: Turbo (SPA-like page acceleration)
gem "turbo-rails"
# Hotwire: Stimulus
gem "stimulus-rails"
# JSON API support
gem "jbuilder"
# Redis for Action Cable, caching, etc.
gem "redis", ">= 4.0.1"

# Devise for authentication
gem "devise"

# Image processing support (ActiveStorage variants)
gem "image_processing", "~> 1.2"

# ActiveStorage support (make sure to configure your storage services in config/storage.yml)
gem "activestorage"

# For sending emails (optional, in case you need to configure mailers for Devise or contact forms)
gem "letter_opener_web", group: :development

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# For faster boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  # Debugging with Rails
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Security analysis for vulnerabilities
  gem "brakeman", require: false

  # Audit gems for bundler security
  gem "bundler-audit", require: false

  # Code style with RuboCop
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Web console for interactive debugging in the browser
  gem "web-console"
end

group :test do
  # System testing with Capybara
  gem "capybara"
  # WebDriver for Selenium-based testing
  gem "selenium-webdriver"
end

# Optional: Add gems for testing other features
# gem "factory_bot_rails" # For factories in tests
# gem "faker" # For generating fake data in tests
