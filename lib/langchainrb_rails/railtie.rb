# frozen_string_literal: true

module LangchainrbRails
  class Railtie < Rails::Railtie
    initializer "langchain" do
      ActiveSupport.on_load(:active_record) do
        ::ActiveRecord::Base.include LangchainrbRails::ActiveRecord::Hooks
      end
    end
  end
end
