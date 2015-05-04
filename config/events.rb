WebsocketRails::EventMap.describe do
  subscribe :user_connected, to: ChatController, with_method: :user_connected
  subscribe :user_disconnected, to: ChatController, with_method: :user_disconnected
  subscribe :new_message, to: ChatController, with_method: :new_message
end
