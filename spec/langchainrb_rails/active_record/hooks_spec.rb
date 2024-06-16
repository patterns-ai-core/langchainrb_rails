# frozen_string_literal: true

class Dummy
  include ::LangchainrbRails::ActiveRecord::Hooks
end

RSpec.describe LangchainrbRails::ActiveRecord::Hooks do
  it "responds to instance methods" do
    expect(::Dummy.new).to respond_to(:upsert_to_vectorsearch)
    expect(::Dummy.new).to respond_to(:destroy_from_vectorsearch)
    expect(::Dummy.new).to respond_to(:as_vector)
  end

  it "responds to class methods" do
    expect(::Dummy).to respond_to(:vectorsearch)
    expect(::Dummy).to respond_to(:similarity_search)
    expect(::Dummy).to respond_to(:ask)
    expect(::Dummy).to respond_to(:embed!)
  end
end
