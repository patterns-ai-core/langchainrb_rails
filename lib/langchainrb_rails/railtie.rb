# frozen_string_literal: true

module LangchainrbRails
  class Railtie < Rails::Railtie
    initializer "langchain" do
      ActiveSupport.on_load(:active_record) do
        ::ActiveRecord::Base.include LangchainrbRails::ActiveRecord::Hooks
      end
    end

    generators do
      require_relative "generators/langchainrb_rails/chroma_generator"
      require_relative "generators/langchainrb_rails/pinecone_generator"
      require_relative "generators/langchainrb_rails/pgvector_generator"
    end
  end
end
