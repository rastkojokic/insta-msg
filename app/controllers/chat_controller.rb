class ChatController < WebsocketRails::BaseController
  def initialize_session
    controller_store[:connected_users] = []
  end

  def user_connected
    unless controller_store[:connected_users].include?(message["username"])
      controller_store[:connected_users] << message["username"] 
    end

    broadcast_message :user_connected, 
                      { :connected_users => controller_store[:connected_users] }
  end

  def user_disconnected
    controller_store[:connected_users].delete(message["username"])

    broadcast_message :user_disconnected, 
                      { :connected_users => controller_store[:connected_users] }
  end

  def new_message
    translation = Translation.new(message["dialect"], message["text"])
    translated_text = translation.translate

    new_message = { :message => translated_text,
                    :time => message["time"], 
                    :username => message["username"],
                    :dialect => message["dialect"] }

    broadcast_message :new_message, new_message
  end
end
