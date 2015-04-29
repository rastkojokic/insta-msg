class ChatController < WebsocketRails::BaseController
  def initialize_session
  end

  def client_connected
    client_connected = { :message => "New client connected" }

    broadcast_message :client_connected, client_connected
  end

  def new_message
    new_message = {:message => 'this is a message'}

    broadcast_message :new_message, new_message
  end
end
