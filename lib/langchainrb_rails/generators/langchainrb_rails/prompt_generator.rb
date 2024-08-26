require 'rails/generators'
require 'rails/generators/active_record'

module LangchainrbRails
  module Generators
    class PromptGenerator < Rails::Generators::Base
      include ::ActiveRecord::Generators::Migration

      source_root File.join(__dir__, "templates")

      def create_prompt_model
        template 'prompt_model.rb', 'app/models/prompt.rb'
        migration_template 'create_prompts.rb', 'db/migrate/create_prompts.rb'
      end
    end
  end
end
