require "spec_helper"

RSpec.describe Langchain::Assistant::Messages::Base do
  describe "#id" do
    it "allows setting and getting an id" do
      message = described_class.new
      message.id = 1
      expect(message.id).to eq(1)
    end
  end
end
