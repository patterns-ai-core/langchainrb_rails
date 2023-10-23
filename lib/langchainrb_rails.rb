# frozen_string_literal: true

require "langchain"
require_relative "langchainrb_rails/version"
require "langchainrb_rails/railtie"

module LangchainrbRails
  class Error < StandardError; end

  module ActiveRecord
    autoload :Hooks, "langchainrb_rails/active_record/hooks"
  end
end
