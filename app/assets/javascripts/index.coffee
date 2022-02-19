$ ->
  ws = new WebSocket $("body").data("ws-url")
  ws.onmessage = (event) ->
    repo = JSON.parse event.data
    row=$('<tr/>')
    row.append $('<td/>').append $('<a href="/users/'+repo.login+'">'+repo.login+'</a>')
    row.append $('<td/>').append $('<a href="/repository/'+repo.login+'/'+repo.name+'">'+repo.name+'</a>')
    row.append $('<td/>').append $('<a href="/search/'+repo.login+'/'+repo.name+'/issues">'+'click here'+'</a>')
    topicContainer = $('<td/>').append $('<table style="border:none"/>').append $('<tr/>')
    for topic in repo.topics
    	topicContainer.append $('<tr />').append $('<td style="border:none">').append $('<a href="/topics/'+topic+'" style="text-decoration: none;" target="_blank">'+topic+'</a>')  
    row.append topicContainer
    row.append $('<td/>').append $('<a href="/search/'+repo.login+'/'+repo.name+'/commits">'+'click here'+'</a>')
    $('#repo').append row
    
  $("#addsymbolform").submit (event) ->
    event.preventDefault()
    # send the message to watch the stock
    ws.send(JSON.stringify({keyword: $("#addsymboltext").val()}))
    # reset the form
    $("#addsymboltext").val("")