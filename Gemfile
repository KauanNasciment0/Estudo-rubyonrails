source "https://rubygems.org"

gem "rails", "~> 8.0.3"

# Assets
gem "propshaft"

# Database
gem "mysql2", "~> 0.5"

# Web server
gem "puma", ">= 5.0"

# Front-end / Hotwire
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# APIs
gem "jbuilder"

# Authentication
gem "bcrypt", "~> 3.1.7"

# Timezone data for Windows
gem "tzinfo-data", platforms: %i[windows jruby]

# Solid adapters
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Boot optimization
gem "bootsnap", require: false

# Deployment
gem "kamal", require: false

# Puma optimization
gem "thruster", require: false

# ======================
# Development & Test
# ======================
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Security scanner
  gem "brakeman", "~> 7.1", require: false

  # Ruby/Rails style
  gem "rubocop-rails-omakase", require: false
end

# ======================
# Development only
# ======================
group :development do
  gem "web-console"
end

# ======================
# Test only
# ======================
group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "sqlite3", ">= 2.1"
end
