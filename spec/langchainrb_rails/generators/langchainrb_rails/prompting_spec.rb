require 'spec_helper'
require 'active_support/concern'
require 'active_model'

RSpec.describe LangchainrbRails::Prompting do
  let(:dummy_class) do
    Class.new do
      include ActiveModel::Validations
      include LangchainrbRails::Prompting
      attr_accessor :template

      def self.name
        "DummyClass"
      end

      def initialize(template)
        @template = template
      end
    end
  end

  let(:dummy_instance) { dummy_class.new("Hello, {name}! Welcome to {place}.") }

  describe 'validations' do
    it 'is valid with a template' do
      expect(dummy_instance).to be_valid
    end

    it 'is invalid without a template' do
      instance = dummy_class.new(nil)
      expect(instance).to be_invalid
      expect(instance.errors[:template]).to include("can't be blank")
    end
  end

  describe '#render' do
    it 'renders the template with provided variables' do
      result = dummy_instance.render(name: "Alice", place: "Wonderland")
      expect(result).to eq("Hello, Alice! Welcome to Wonderland.")
    end

    it 'leaves unprovided variables in curly braces' do
      result = dummy_instance.render(name: "Bob")
      expect(result).to eq("Hello, Bob! Welcome to {place}.")
    end

    it 'ignores extra variables' do
      result = dummy_instance.render(name: "Charlie", place: "Narnia", extra: "ignored")
      expect(result).to eq("Hello, Charlie! Welcome to Narnia.")
    end

    it 'handles templates without variables' do
      instance = dummy_class.new("Just a simple message.")
      result = instance.render
      expect(result).to eq("Just a simple message.")
    end
  end

  describe '#template_variables' do
    it 'returns an array of variable names used in the template' do
      instance = dummy_class.new("Hello, {name}! Welcome to {place}. Your lucky number is {number}.")
      expect(instance.template_variables).to match_array(%w[name place number])
    end

    it 'returns an empty array for templates without variables' do
      instance = dummy_class.new("Just a simple message.")
      expect(instance.template_variables).to be_empty
    end

    it 'returns unique variable names' do
      instance = dummy_class.new("Hello, {name}! Nice to meet you, {name}.")
      expect(instance.template_variables).to eq(["name"])
    end
  end
end
