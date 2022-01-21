# frozen_string_literal: true

require 'webdrivers'

# Create selenium session
is_browser_created = false
Before('@ui_case') do
  # UI setting
  unless is_browser_created
    # Webdrivers setting
    Webdrivers.install_dir = 'drivers'

    create_local_session

    Capybara.configure do |config|
      config.default_driver = :site_prism
      config.default_max_wait_time = ENV['SELENIUM_IMPLICIT_WAIT'].to_i
    end
    # Resize to custom resolution
    Capybara.page.driver.browser.manage.window.maximize

    is_browser_created = true
  end
end

# Make screenshot on failure and reset session
After('@ui_case') do
  Capybara.reset_sessions!
end

def create_local_session
  case ENV['BROWSER']
  when 'chrome'
    # Download chrome webdriver
    Webdrivers::Chromedriver.update
    # set driver path
    Selenium::WebDriver::Chrome::Service.driver_path = 'drivers/chromedriver'

    options = Selenium::WebDriver::Chrome::Options.new

    if ENV['HEADLESS'].eql?('true')
      options.add_argument('--disable-dev-shm-usage')
      options.add_argument('--no-sandbox')
      options.add_argument('--disable-gpu')
      options.add_argument('--headless')
      if ENV['RESOLUTION'].eql?('full_screen')
        options.add_argument('--window-size=1920x1080')
      else
        options.add_argument('--window-size=full_screen')
      end
    end

    Capybara.register_driver :site_prism do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end
  else
    raise 'Your local driver not yet implemented'
  end
end
