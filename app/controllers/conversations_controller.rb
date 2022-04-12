class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def new

    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end


    # @message = @conversation.messages.new(message_params)
    redirect_to conversation_messages_path(@conversation)
  end


  def getLastUserMessage
    @conversation = current_user.getMessageRoute()
    if !@conversation.blank?
      redirect_to conversation_messages_path(@conversation)
    else
      flash[:notice]='You have no conversations'
      redirect_to "/"
    end
  end

    private
      def conversation_params
        params.permit(:sender_id, :recipient_id)
      end

  # def message_params
  #     params.require(:message).permit(:body, :user_id)
  # end
end
