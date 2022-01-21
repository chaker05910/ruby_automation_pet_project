# frozen_string_literal: true

require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'dotenv'
require 'require_all'
require_all './asserts'
require_all './pages'

# Load configs
Dotenv.load('config/.env')
