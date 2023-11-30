# frozen_string_literal: true

module LangchainrbRails
  module Generators
    #
    # PineconeGenerator does the following:
    # 1. Creates the `langchainrb_rails.rb` initializer file
    # 2. Adds necessary code to the ActiveRecord model to enable vectorsearch
    # 3. Adds `qdrant-ruby` gem to the Gemfile
    #
    # Usage:
    #     rails generate langchainrb_rails:qdrant --model=Product --llm=openai
    #
    class QdrantGenerator < LangchainrbRails::Generators::BaseGenerator
      desc "This generator adds Qdrant vectorsearch integration to your ActiveRecord model"
      source_root File.join(__dir__, "templates")

      # Creates the `langchainrb_rails.rb` initializer file
      def create_initializer_file
        template "qdrant_initializer.rb", "config/initializers/langchainrb_rails.rb"
      end

      # Adds `vectorsearch` class method to the model and `after_save` callback that calls `upsert_to_vectorsearch()`
      def add_to_model
        inject_into_class "app/models/#{model_name.downcase}.rb", model_name do
          "  vectorsearch\n\n  after_save :upsert_to_vectorsearch\n\n"
        end
      end

      # Adds `qdrant-ruby` gem to the Gemfile
      # TODO: Can we automatically run `bundle install`?
      def add_to_gemfile
        gem "qdrant-ruby"
      end

      private

      # @return [String] Name of the model
      def model_name
        options["model"]
      end

      # @return [String] LLM provider to use
      def llm
        options["llm"]
      end

      # @return [Langchain::LLM::*] LLM class
      def llm_class
        Langchain::LLM.const_get(LLMS[llm])
      end
    end
  end
end
