class Chat
  constructor: (@username, @dialect, @dispatcher) ->
    @subscribe_to_new_message()
    @subscribe_to_user_connected()
    @subscribe_to_user_disconnected()

  publish_user_connected: ->
    @dispatcher.trigger("user_connected", { "username": @username })

  subscribe_to_new_message: ->
    @dispatcher.bind 'new_message', (data) ->
      $('#messageList').append '<hr><p>' + data.message + '</p><p>' + data.time + '</p><p>' + data.username + '</p>'

  subscribe_to_user_connected: ->
    @dispatcher.bind 'user_connected', (data) ->
      $('#onlineUsersList').html '<li>' + data.connected_users + '</li>'

  subscribe_to_user_disconnected: ->
    @dispatcher.bind 'user_disconnected', (data) ->
      $('#onlineUsersList').html '<li>' + data.connected_users + '</li>'

$ ->
  chat = new Chat($("#username").val(), 
                  $("#dialect").val(), 
                  new WebSocketRails("localhost:3000/websocket"))
  chat.publish_user_connected()

  $(window).bind 'beforeunload', ->
    message = 'username': chat.username
    chat.dispatcher.trigger 'user_disconnected', message
    return

  $("#sendBtn").click ->
    text = $("#newMessageTextArea").val()
    time = new Date
    message = 
      "text": text
      "time": time
      "username": chat.username
      "dialect": chat.dialect
    chat.dispatcher.trigger("new_message", message)
