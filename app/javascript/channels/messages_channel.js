import consumer from "./consumer"

// consumer.subscriptions.create("MessagesChannel", {
//   connected() {
//     console.log("Subscription to Messages channel is established")
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//     console.log(data)
//     return $('#messages').append(this.renderMessage(data));
//   },

//   renderMessage(data) {
//     return "<p><b>" + data.user + ": </b>" + data.message + "</p>";
//   }
// });


let messages = consumer.subscriptions.create("MessagesChannel", {
  
  collection() { 
    return $('#messages'); 
  },

  connected() {
    return setTimeout(() => {
      console.log(this.collection())
      this.followCurrentChatroom();
      return this.installPageChangeCallback();
    }
    , 1000);
  },

  received(data) {
    console.log("received", data)
    if (!this.userIsCurrentUser(data.message)) { 
      return this.collection().append(data.message); 
    }
  },

  userIsCurrentUser(message) {
    return $(message).attr('data-user-id') === $('meta[name=current-user]').attr('id');
  },

  followCurrentChatroom() {
    
    let chatroomId;
    if ((chatroomId = this.collection().data('chatroom-id'))) {
      console.log("Folowwing chatroom", chatroomId)
      return this.perform('follow', {chatroom_id: chatroomId});
    } else {
      return this.perform('unfollow');
    }
  },

  installPageChangeCallback() {
    if (!this.installedPageChangeCallback) {
      this.installedPageChangeCallback = true;
      return $(document).on('turbolinks:load', () => messages.followCurrentChatroom());
    }
  }
}
);
