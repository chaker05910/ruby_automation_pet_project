module Asserts
  module HerokuApp
    class HerokuAppAsserts
      def home_page_asserts(home_page)
        HerokuApp::HomePageAsserts.new(home_page)
      end
    end
  end
end