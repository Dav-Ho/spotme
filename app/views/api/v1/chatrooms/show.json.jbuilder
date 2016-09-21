json.id @chatroom.id
json.topic @chatroom.topic
json.messages @chatroom.messages.each do |message|
  json.id message.id
  json.content message.content
  json.email message.user.email
end
