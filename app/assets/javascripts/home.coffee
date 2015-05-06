class Chat
  constructor: (@username, @dialect, @dispatcher) ->
    @subscribe_to_new_message()
    @subscribe_to_user_connected()
    @subscribe_to_user_disconnected()

  subscribe_to_new_message: ->
    @dispatcher.bind 'new_message', (data) ->
      $('#messageList').append("<div><div>" + data.username + " at <span>" + data.time + "</span></div><div><img src='/" + data.dialect + ".png'><span class='messageTextSpan'>" + data.message + "<span></div></div>")

  subscribe_to_user_connected: ->
    @dispatcher.bind 'user_connected', (data) ->
      $('#onlineUsersList').html("") 
      
      for user in data.connected_users
        $('#onlineUsersList').append("<div>" + user + "</div>") 

  subscribe_to_user_disconnected: ->
    @dispatcher.bind 'user_disconnected', (data) ->
      $('#onlineUsersList').html("") 
      
      for user in data.connected_users
        $('#onlineUsersList').append("<div>" + user + "</div>") 

  publish_user_connected: ->
    $("#goOffline").show()
    $("#goOnline").hide()
    @dispatcher.trigger("user_connected", { "username": @username })

  publish_user_disconnected: ->
    $("#goOffline").hide()
    $("#goOnline").show()
    @dispatcher.trigger("user_disconnected", { "username": @username })

$ ->
  chat = new Chat($("#username").val(), 
                  $("#dialect").val(), 
                  new WebSocketRails("localhost:3000/websocket"))
  chat.publish_user_connected()

  $(window).bind 'beforeunload', ->
    chat.publish_user_disconnected()
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

  $("#goOffline").click ->
    chat.publish_user_disconnected()
    return

  $("#goOnline").click ->
    chat.publish_user_connected()

