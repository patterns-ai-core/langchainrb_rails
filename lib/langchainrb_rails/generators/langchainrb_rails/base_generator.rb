# frozen_string_literal: true

require "rails/generators"
require "rails/generators/active_record"

module LangchainrbRails
  module Generators
    class BaseGenerator < Rails::Generators::Base
      include ::ActiveRecord::Generators::Migration

      # Available LLM providers to be passed in as --llm option
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

      class_option :model,
        type: :string,
        required: true,
        aliases: "-m",
        desc: "ActiveRecord Model to add vectorsearch to"

      class_option :llm,
        type: :string,
        required: true,
        default: "openai",
        desc: "LLM provider that will be used to generate embeddings and completions",
        enum: LLMS.keys

      # Run bundle install after running the generator
      def after_generate
        run "bundle install"
      end

      def post_install_message
        say "Please do the following to start Q&A with your #{model_name} records:", :green
        say "1. Run `bundle install` to install the new gems."
        say "2. Set an environment variable ENV['#{llm.upcase}_API_KEY'] for your #{llm_class}."
        say "3. Run `rails db:migrate` to apply the database migrations to enable pgvector and add the embedding column."
        say "4. In Rails console, run `#{model_name}.embed!` to set the embeddings for all records."
        say "5. Ask a question in the Rails console, ie: `#{model_name}.ask('[YOUR QUESTION]')`"
      end
    end
  end
end
