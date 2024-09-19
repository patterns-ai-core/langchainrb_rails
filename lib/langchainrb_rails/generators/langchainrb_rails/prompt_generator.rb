# frozen_string_literal: true

require "rails/generators"
require "rails/generators/active_record"

module LangchainrbRails
  module Generators
    # Adds prompt templating capabilities to your ActiveRecord model
    #
    # Usage:
    #     rails generate langchainrb_rails:prompt
    #
    class PromptGenerator < Rails::Generators::Base
      include ::ActiveRecord::Generators::Migration

      source_root File.join(__dir__, "templates")

      def create_model_file
        template "prompt_model.rb", "app/models/prompt.rb"
      end

      def copy_migration
        migration_template "create_prompts.rb", "db/migrate/create_prompts.rb", migration_version: migration_version
      end

      def migration_version
        "[#{::ActiveRecord::VERSION::MAJOR}.#{::ActiveRecord::VERSION::MINOR}]"
      end
    end
  end
end
