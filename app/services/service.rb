# frozen_string_literal: true

# This service is used for adding users to Mailchimp
module Service
  extend ActiveSupport::Concern

  included do
    def self.call(*args)
      new.call(*args)
    end
  end
end
