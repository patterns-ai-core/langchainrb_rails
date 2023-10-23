# frozen_string_literal: true

module LangchainrbRails
  class Config
    # This class is used to configure the gem config inside Rails apps, in the `config/initializers/langchainrb_rails.rb` file.
    #
    # Langchain is configured in the following way:
    #     LangchainrbRails.configure do |config|
    #       config.vectorsearch = ...
    #     end
    attr_accessor :vectorsearch

    def initialize
      # Define the defaults for future configuration here
      @vectorsearch = {}
    end
  end
end
