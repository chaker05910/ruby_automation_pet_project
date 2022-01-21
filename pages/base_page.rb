# frozen_string_literal: true

module Pages
  class BasePage < SitePrism::Page

    element :title, :xpath, '//h1'

    def retrieve_title
      title.text
    end
  end
end
