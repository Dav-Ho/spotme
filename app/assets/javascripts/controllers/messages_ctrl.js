(function() {
  'use strict';

  angular.module('app').controller('messagesCtrl',function($scope, $http) {

  $scope.getChatroom = function(id) {
    $http.get('/api/v1/chatrooms/' + id + '.json').then(function(response){
      $scope.chatroom = response.data;
      App.activity = App.cable.subscriptions.create({
            channel: "MessagesChannel",
            chatroom_id: $scope.chatroom.id
          },
          {
            received: function(data) {
              console.log(data);
              console.log($scope.chatroom.messages);
              $scope.chatroom.messages.push(data);
              $scope.$apply();
            }
          });
      });
    };

  $scope.sendMessage = function(content) {
    var params = {
      content: content,
      chatroom_id: $scope.chatroom.id
    };
    $http.post('/api/v1/messages', params).then(function(response){
      $scope.content = '';
    });
   };
  });
})();
