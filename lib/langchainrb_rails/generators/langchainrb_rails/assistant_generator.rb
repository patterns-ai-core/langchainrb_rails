# frozen_string_literal: true

require "rails/generators"
require "rails/generators/active_record"

module LangchainrbRails
  module Generators
    #
    # Usage:
    #     rails generate langchainrb_rails:assistant --llm=openai
    #
    class AssistantGenerator < Rails::Generators::Base
      include ::ActiveRecord::Generators::Migration

      # TODO: Move constant this to a shared place
      LLMS = {
        "anthropic" => "Langchain::LLM::Anthropic",
        "cohere" => "Langchain::LLM::Cohere",
        "google_palm" => "Langchain::LLM::GooglePalm",
        "google_gemini" => "Langchain::LLM::GoogleGemini",
        "google_vertex_ai" => "Langchain::LLM::GoogleVertexAI",
        "hugging_face" => "Langchain::LLM::HuggingFace",
        "llama_cpp" => "Langchain::LLM::LlamaCpp",
        "mistral_ai" => "Langchain::LLM::MistralAI",
        "ollama" => "Langchain::LLM::Ollama",
        "openai" => "Langchain::LLM::OpenAI",
        "replicate" => "Langchain::LLM::Replicate"
      }.freeze

      class_option :llm,
        type: :string,
        required: true,
        default: "openai",
        desc: "LLM provider that will be used to generate embeddings and completions",
        enum: LLMS.keys

      desc "This generator adds Assistant and Message models and tables to your Rails app"
      source_root File.join(__dir__, "templates")

      def copy_migration
        migration_template "assistant/migrations/create_assistants.rb", "db/migrate/create_assistants.rb", migration_version: migration_version
        migration_template "assistant/migrations/create_messages.rb", "db/migrate/create_messages.rb", migration_version: migration_version
      end

      def create_model_file
        template "assistant/models/assistant.rb", "app/models/assistant.rb"
        template "assistant/models/message.rb", "app/models/message.rb"
      end

      def migration_version
        "[#{::ActiveRecord::VERSION::MAJOR}.#{::ActiveRecord::VERSION::MINOR}]"
      end

      # TODO: Depending on the LLM provider, we may need to add additional gems
      # def add_to_gemfile
      # end

      private

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
