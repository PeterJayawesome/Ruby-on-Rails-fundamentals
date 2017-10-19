class MessagesController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	# @messages = Message.joins(:user).includes(:comments).select("messages.id,users.username as username,DATE(messages.created_at) as create_at,messages.content,comments.content as comment").all.references(:comments)
  	@messages = Message.joins(:user).includes(:comments).select("messages.id,users.username as username,DATE(messages.created_at) as create_at,messages.content").all.order("messages.created_at DESC")
  	@comments = {}
  	@messages.each do |message|
  		@comments["#{message.id}"] = Comment.joins(:user).select("users.username as username,DATE(comments.created_at) as create_at,content").where(message_id:message.id).order("comments.created_at DESC")
	end
  end

  def create
  	message = Message.new(message_params)
  	if message.save
  		flash[:notices] = ["You post a message successfully!"]
  	else
  		flash[:notices] = message.errors.full_messages
	end
	redirect_to messages_path
  end

  def comment
  	comment = Comment.new(comment_params)
  	if comment.save
  		flash[:notices] = ["You post a comment successfully!"]
  	else
  		flash[:notices] = comment.errors.full_messages
  	end
  	redirect_to messages_path
  end

  private
  def message_params
	{content:params[:message_content],user_id:session[:user_id]}
  end

  def comment_params
  	{content:params[:content],user_id:session[:user_id],message_id:params[:id]}
  end
end
