# frozen_string_literal: true

require 'rspec'
# Assertion module designed to delegate the technical part of the code to understandable business methods
# What makes our asserts clearer for future development and reduces code duplication
include RSpec::Matchers
module Asserts
  # Base assertion class which contains RSpec initializing and base assertion templates
  class BaseAsserts
    # Base RSpec initializing
    def initialize
      RSpec.configure do |config|
        config.expect_with :rspec do |c|
          c.syntax = :expect
        end
      end
    end

    # Equals RSpec verifier template
    # @param expected [Object] expected object for comparing with expected
    # @param actual [Object] actual object for comparing with expected
    # @param verified_attribute [String] name of verifying object
    def verify_object_equals(expected, actual, verified_attribute)
      expect(expected).to eql(actual), "\"#{verified_attribute}\" should be \"#{expected}\", but \"#{actual}\""
    end

    # Contains RSpec verifier template
    # @param expected [Object] expected object for comparing with actual
    # @param actual [Object] actual object for comparing with expected
    # @param verified_attribute [String] name of verifying object
    def verify_object_contains(expected, actual, verified_attribute)
      expect(actual.downcase).to include(expected.downcase), "\"#{verified_attribute}\" \"#{actual}\" should contains \"#{expected}\", but not"
    end

    # Include RSpec verifier template
    # @param array [Object] array / hash which should include actual
    # @param object [Object] actual object for comparing with expected
    # @param verified_attribute [String] name of verifying object
    def verify_include(array, object, verified_attribute)
      expect(array).to include(object),
                       "\"#{verified_attribute}\" \"#{array}\" should include \"#{object}\" but not"
    end

    # Include RSpec verifier template
    # @param array [Object] array / hash which should not include actual
    # @param object [Object] actual object for comparing with expected
    # @param verified_attribute [String] name of verifying object
    def verify_not_include(array, object, verified_attribute)
      expect(array).not_to include(object),
                           "\"#{verified_attribute}\" \"#{array}\" should not include \"#{object}\" but not"
    end

    # Equals RSpec verifier template
    # @param actual [Boolean] actual boolean status
    # @param verified_attribute [String] name of verifying object
    def verify_truthy(actual, verified_attribute)
      LOGGER.info("Verifying \"#{verified_attribute}\" actual: [#{actual}] is true")
      # passes if actual is truthy (not nil or false)
      expect(actual).to be_truthy, "\"#{verified_attribute}\" should be true, but \"#{actual}\""
    end

    # Equals RSpec verifier template
    # @param actual [Boolean] actual boolean status
    # @param verified_attribute [String] name of verifying object
    def verify_falsey(actual, verified_attribute)
      # passes if actual is falsey (not nil or true)
      expect(actual).to be_falsey, "\"#{verified_attribute}\" should be false, but \"#{actual}\""
    end

    # Match RSpec verifier template
    # @param expected [String] expected object for matching with regex
    # @param regex [Regexp] regex to matching expected string
    # @param verified_attribute [String] name of verifying object
    def verify_regex(expected, regex, verified_attribute)
      expect(expected)
        .to match(regex), "\"#{verified_attribute}\" should match format \"#{regex}\", but \"#{expected}\""
    end

    # More than RSpec verifier template
    # @param expected [#to_i] expected object for matching with regex
    # @param more_than [Int] regex to matching expected string
    # @param verified_attribute [String] name of verifying object
    def verify_more_than(expected, more_than, verified_attribute)
      expect(expected.to_i).to be > more_than, "\"#{verified_attribute}\" value #{expected} should be"\
      " more than #{more_than}, but not"
    end

    # Include RSpec verifier template
    # @param expected_array [Object] array which should match actual
    # @param actual_array [Object] actual array for comparing with expected
    def verify_match_array(expected_array, actual_array)
      expect(expected_array).to match_array(actual_array),
                                "[#{expected_array}] should match [#{actual_array}] but not"
    end
  end
end
