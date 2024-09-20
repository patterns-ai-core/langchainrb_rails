# frozen_string_literal: true

require "spec_helper"
require "generator_spec"

RSpec.describe LangchainrbRails::Generators::AssistantGenerator, type: :generator do
  destination File.expand_path("../tmp", __dir__)

  before(:all) do
    prepare_destination
    run_generator
  end

  after(:all) do
    FileUtils.rm_rf(destination_root)
  end

  it "creates an assistant model" do
    assert_file "app/models/assistant.rb"
  end

  it "creates a message model" do
    assert_file "app/models/message.rb"
  end

  it "creates a messages migration" do
    assert_migration "db/migrate/create_messages.rb"
  end

  it "creates an assistants migration" do
    assert_migration "db/migrate/create_assistants.rb"
  end
end
