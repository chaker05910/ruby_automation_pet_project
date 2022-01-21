# frozen_string_literal: true

module Pages
  module HerokuApp
    class HomePage < BaseHerokuAppPage

      def open_home_page
        visit('http://the-internet.herokuapp.com/')
        self
      end
    end
  end
end