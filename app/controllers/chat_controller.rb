class ChatController < WebsocketRails::BaseController
  def initialize_session
    controller_store[:connected_users] = []
  end

  def client_connected
    unless controller_store[:connected_users].include?(message["username"])
      controller_store[:connected_users] << message["username"] 
    end

    broadcast_message :client_connected, 
                      { :connected_users => controller_store[:connected_users] }
  end

  def client_disconnected
    controller_store[:connected_users].delete(message["username"])

    broadcast_message :client_disconnected, 
                      { :connected_users => controller_store[:connected_users] }
  end

  def new_message
    new_message = { :message => message["text"], 
                    :time => message["time"], 
                    :username => message["username"] }

    broadcast_message :new_message, new_message
  end
end
