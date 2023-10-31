# frozen_string_literal: true

module LangchainrbRails
  module Generators
    #
    # Usage:
    #     rails g langchain:pgvector -model=Product -llm=openai
    #
    class PgvectorGenerator < LangchainrbRails::Generators::BaseGenerator
      desc "This generator adds Pgvector vectorsearch integration to your ActiveRecord model"
      source_root File.join(__dir__, "templates")

      def copy_migration
        migration_template "enable_vector_extension_template.rb", "db/migrate/enable_vector_extension.rb", migration_version: migration_version
        migration_template "add_vector_column_template.rb", "db/migrate/add_vector_column_to_#{table_name}.rb", migration_version: migration_version
      end

      def create_initializer_file
        template "pgvector_initializer.rb", "config/initializers/langchainrb_rails.rb"
      end

      def migration_version
        "[#{::ActiveRecord::VERSION::MAJOR}.#{::ActiveRecord::VERSION::MINOR}]"
      end

      def add_to_model
        inject_into_class "app/models/#{model_name.downcase}.rb", model_name do
          "  vectorsearch\n\n  after_save :upsert_to_vectorsearch\n\n"
        end
      end

      def add_to_gemfile
        # Dependency for Langchain PgVector
        gem "neighbor"
        gem "ruby-openai"
      end

      def post_install_message
        say "Please do the following to start Q&A with your #{model_name} records:", :green
        say "1. Run `bundle install` to install the new gems."
        say "2. Set `OPENAI_API_KEY` environment variable to your OpenAI API key."
        say "3. Run `rails db:migrate` to apply the database migrations to enable pgvector and add the embedding column."
        say "4. In Rails console, run `#{model_name}.embed!` to set the embeddings for all records."
        say "5. Ask a question in the Rails console, ie: `#{model_name}.ask('[YOUR QUESTION]')`"
      end

      private

      # @return [String] Name of the model
      def model_name
        options["model"]
      end

      # @return [String] Table name of the model
      def table_name
        model_name.downcase.pluralize
      end

      # @return [String] LLM provider to use
      def llm
        options["llm"]
      end

      # @return [Langchain::LLM::*] LLM class
      def llm_class
        Langchain::LLM.const_get(LLMS[llm])
      end

      # @return [Integer] Dimension of the vector to be used
      def vector_dimension
        llm_class.default_dimension
      end
    end
  end
end
