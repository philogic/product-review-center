class MessagesController < ApplicationController

  API_HOST = 'http://localhost:3020'

  def index
    gateway = Messaging.new(API_HOST)
    @mailbox = Customer.find(params[:mailbox]).username
    @messages = gateway.receive(@mailbox, 1)
  end

  def new
    @originator = Customer.find(params[:originator]).username
    @recipient = Customer.find(params[:recipient]).username

  end

  def create
    @message = {content: params[:message][:content],
                originator: params[:message][:originator],
                recipient: params[:message][:recipient]}
    gateway = Messaging.new(API_HOST)
    gateway.send(@message) ? flash.now[:notice] = 'Message sent!' :
        flash.now[:error] = 'Sorry, unable to send your message'
    render 'show', message: @message
  end

  def show
  end
end
