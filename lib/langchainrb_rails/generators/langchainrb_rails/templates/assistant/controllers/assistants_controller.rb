# frozen_string_literal: true

class AssistantsController < ApplicationController
  before_action :set_assistant, only: [:show, :edit, :update, :chat, :destroy]

  def index
    @assistants = Assistant.all
  end

  def new
    @assistant = Assistant.new
  end

  def create
    @assistant = Assistant.new(assistant_params)
    if @assistant.save
      redirect_to @assistant, notice: "Assistant was successfully created."
    else
      render :new
    end
  end

  def show
    @assistants = Assistant.all
    @assistant = Assistant.find(params[:id])
    @messages = @assistant.messages
    @message = Message.new
  end

  def edit
  end

  def update
    if @assistant.update(assistant_params)
      redirect_to @assistant, notice: "Assistant was successfully updated."
    else
      render :edit
    end
  end

  def chat
    @assistant = Assistant.find(params[:id])
    @message = @assistant.messages.create(role: "user", content: params[:message][:content])

    langchain_assistant = Langchain::Assistant.load(@assistant.id)
    messages = langchain_assistant.add_message_and_run!(content: params[:message][:content])
    response = messages.last

    @response = @assistant.messages.create(role: "assistant", content: response.content)

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @assistant.destroy
    redirect_to assistants_path, notice: "Assistant was successfully deleted."
  end

  private

  def set_assistant
    @assistant = Assistant.find(params[:id])
  end

  def assistant_params
    params.require(:assistant).permit(:name, :instructions, :tool_choice)
  end
end
