# frozen_string_literal: true

module LangchainrbRails
  module Prompting
    extend ActiveSupport::Concern

    included do
      validates :template, presence: true

      def render(variables = {})
        template.gsub(/\{(\w+)\}/) do |match|
          variable = ::Regexp.last_match(1).to_sym
          variables.fetch(variable, match)
        end
      end

      def template_variables
        template.scan(/\{(\w+)\}/).flatten.uniq
      end
    end
  end
end
