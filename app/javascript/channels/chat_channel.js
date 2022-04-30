import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (data["isCurrent_user"] == true){
      sentence = `<div class="mycomment"><p>${data["sentence"]}</p></div>`;
    }
    else{
      sentence=`<div class='fukidasi'><div class='faceicon'>
      <img src='/assets/profile.png' alt='管理人'></div>
      <div class='chatting'><div class='says'><p>${data["sentence"]}</p>
      </div></div></div>`;
    }
    $('#chats').append(sentence);
  },

  speak: function(sentence) {
    current_user_id=$("#current_user_id").val();
    partner_id=$("#partner_id").val();
    return this.perform('speak',{sentence: sentence, current_user_id: current_user_id, partner_id: partner_id});
  }
});
$(function(){
  $("#send").on("click",function(e){
    sentence=$("#sentence").val();
    App.chat.speak(sentence);
    $("#sentence").val(""); //フォームを空に
    e.preventDefault();
  });
});