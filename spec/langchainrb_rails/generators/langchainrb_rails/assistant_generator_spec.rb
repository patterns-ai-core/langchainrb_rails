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
    delete_directory(destination_root)
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

  describe "views" do
    it "creates index view" do
      assert_file "app/views/assistants/index.html.erb"
    end

    it "creates show view" do
      assert_file "app/views/assistants/show.html.erb"
    end

    it "creates edit view" do
      assert_file "app/views/assistants/edit.html.erb"
    end

    it "creates new view" do
      assert_file "app/views/assistants/new.html.erb"
    end

    it "creates chat partial" do
      assert_file "app/views/assistants/_message.html.erb"
    end

    it "creates message form partial" do
      assert_file "app/views/assistants/_message_form.html.erb"
    end

    it "creates chat stream template" do
      assert_file "app/views/assistants/chat.turbo_stream.erb"
    end
  end
end
