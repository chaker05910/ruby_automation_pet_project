module Asserts
  class BaseUIAsserts < BaseAsserts
    # Set UI page for Asserting
    # @see pages module
    def initialize(page)
      super()
      @page = page
    end

    def verify_url(expected_url)
      verify_object_equals(expected_url, @page.current_url, 'Current URL')
    end

    def verify_title(expected_title)
      verify_object_equals(expected_title, @page.retrieve_title, 'Title')
    end
  end
end