require 'spec_helper'
require 'generator_spec'

RSpec.describe LangchainrbRails::Generators::PromptGenerator, type: :generator do
  destination File.expand_path('../tmp', __dir__)

  before(:all) do
    prepare_destination
    run_generator
  end

  after(:all) do
    FileUtils.rm_rf(destination_root)
  end

  it "creates a prompt model" do
    assert_file "app/models/prompt.rb"
  end

  it "creates a migration" do
    assert_migration "db/migrate/create_prompts.rb"
  end
end
