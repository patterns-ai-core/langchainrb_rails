# frozen_string_literal: true

require "forwardable"
require "langchain"
require "rails"
require_relative "langchainrb_rails/version"
require "langchainrb_rails/railtie"
require "langchainrb_rails/config"
require "langchainrb_rails/prompting"
require_relative "langchainrb_overrides/vectorsearch/pgvector"

module LangchainrbRails
  class Error < StandardError; end

  module ActiveRecord
    autoload :Hooks, "langchainrb_rails/active_record/hooks"
  end

  module Generators
    autoload :BaseGenerator, "langchainrb_rails/generators/langchainrb_rails/base_generator"
    autoload :ChromaGenerator, "langchainrb_rails/generators/langchainrb_rails/chroma_generator"
    autoload :PgvectorGenerator, "langchainrb_rails/generators/langchainrb_rails/pgvector_generator"
    autoload :QdrantGenerator, "langchainrb_rails/generators/langchainrb_rails/qdrant_generator"
    autoload :PromptGenerator, "langchainrb_rails/generators/langchainrb_rails/prompt_generator"
  end

  class << self
    # Configures global settings for LangchainrbRails
    #     LangchainrbRails.configure do |config|
    #       config.vectorsearch = ...
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
