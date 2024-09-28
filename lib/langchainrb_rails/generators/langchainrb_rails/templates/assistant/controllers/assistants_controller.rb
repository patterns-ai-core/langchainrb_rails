# frozen_string_literal: true

class AssistantsController < ApplicationController
  def index
    @assistants = Assistant.all
  end

  def new
    @assistant = Assistant.new
  end

  def create
    @assistant = Assistant.new(assistant_params)
    if @assistant.save
      redirect_to @assistant, notice: 'Assistant was successfully created.'
    else
      render :new
    end
  end

  def show
    @assistant = Assistant.find(params[:id])
    @messages = @assistant.messages
  end

  def chat
    @assistant = Assistant.find(params[:id])
    message = @assistant.messages.create(role: 'user', content: params[:content])
    
    langchain_assistant = Langchain::Assistant.load(@assistant.id)
    response = langchain_assistant.chat(params[:content])
    
    @assistant.messages.create(role: 'assistant', content: response.content)
    
    render json: { message: message, response: response.content }
  end

  private

  def assistant_params
    params.require(:assistant).permit(:instructions)
  end
end