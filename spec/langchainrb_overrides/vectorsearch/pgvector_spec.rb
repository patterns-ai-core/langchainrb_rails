# frozen_string_literal: true

RSpec.describe Langchain::Vectorsearch::Pgvector do
  let(:llm) { Langchain::LLM::OpenAI.new(api_key: "123") }
  subject { described_class.new(llm: llm) }

  describe "#add_texts" do
  end

  describe "#update_text" do
  end

  describe "#create_default_schema" do
  end

  describe "#destroy_default_schema" do
  end

  describe "#similarity_search" do
  end

  describe "#similarity_search_by_vector" do
  end

  describe "#ask" do
  end
end
