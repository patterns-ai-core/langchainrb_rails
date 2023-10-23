# frozen_string_literal: true

require "langchain"
require_relative "langchainrb_rails/version"
require "langchainrb_rails/railtie"
require "langchainrb_rails/config"

module LangchainrbRails
  class Error < StandardError; end

  module ActiveRecord
    autoload :Hooks, "langchainrb_rails/active_record/hooks"
  end

  module Generators
    autoload :PgvectorGenerator, "langchainrb_rails/generators/langchainrb_rails/pgvector_generator"
  end

  class << self
    # Configures global settings for Langchain
    #     LangchainrbRails.configure do |config|
    #       config.vectorsearch = Langchain::Vectorsearch::Pgvector.new(
    #         llm: Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])
    #       )
    #     end
    def configure
      yield(config)
    end

    # @return [Config] The global configuration object
    def config
      @_config ||= Config.new
    end
  end
end
