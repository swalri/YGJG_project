<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  

    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />

    <meta name="apple-mobile-web-app-title" content="CodePen">

    <link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg" color="#111" />



  
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>


  <title>CodePen - jQuery ChatBot</title>

    <link rel="canonical" href="https://codepen.io/TVBZ/pen/WmPPyR">
  
  
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css'>
  
<style>
html {
   font-family: Arial, sans-serif;
   font-size: 16px;
}

body {
   min-height: 100vh;
   background: #ffffff;
   background: -moz-linear-gradient(-45deg, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
   background: -webkit-gradient(left top, right bottom, color-stop(0%, rgba(255, 255, 255, 1)), color-stop(47%, rgba(246, 246, 246, 1)), color-stop(100%, rgba(237, 237, 237, 1)));
   background: -webkit-linear-gradient(-45deg, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
   background: -o-linear-gradient(-45deg, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
   background: -ms-linear-gradient(-45deg, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
   background: linear-gradient(135deg, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
   filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ededed', GradientType=1);
}

h2,
h3 {
   margin: 0;
   padding: 0;
}

h1 {}

h2 {
   font-size: 1rem;
   font-weight: 400;
}

hr {
   margin: 15px 0;
}

.bg-dark {
   background: hsl(231, 50%, 50%);
}

.bg-light {
   background: hsla(231, 10%, 90%, 0.8);
}

.text-light {
   color: #f0f0f0;
}

.align-center {
   text-align: center;
}

/*** NAV ***/

nav#nav-container {
   background: #f0f0f0;
   padding: 15px;
   position: absolute;
   z-index: 1;
   right: 0;
   top: 0;
   box-sizing: border-box;
}

ul.nav {
   list-style: none;
   margin: 0;
   padding: 0;
}

.nav-link {
   padding: 2px 0;
   margin: 8px 0;
   font-size: .9rem;
   position: relative;
   padding-left: 40px;
}

.nav-link > span {
   margin-right: 10px;
   position: absolute;
   left: 0;
}


a,
button,
.link,
.nav-link {
   cursor: pointer;
}

.btn-transparent {
   border: 0;
   background: 0;
}

.btn-icon {
   font-size: 1.5rem;
   width: 100%;
}

/**************************/

/*** Display fake phone ***/

/**************************/

#phone-wrapper {
   margin: 50px auto;
   background: url("https://cdn.pixabay.com/photo/2017/06/17/10/39/cell-phone-2411808_960_720.png") 0 0;
   /*background: url("https://cdn.pixabay.com/photo/2017/06/17/10/39/cell-phone-2411808_960_720.png") -418px 0px;*/
   background-repeat: no-repeat;
   background-position: 0px 0px;
   width: 363px;
   height: 720px;
   position: relative;
   overflow: hidden;
}

#app {
   background: #ffffff;
   background-image: url("https://www.transparenttextures.com/patterns/asfalt-light.png");
   position: relative;
   top: 47px;
   left: 19px;
   height: 608px;
   width: 325px;
   display: grid;
   grid-template-rows: 50px 1fr auto;
}

/*** Start Chat overlay ***/

div#landing {
   position: absolute;
   z-index: 1;
   width: 100%;
   height: 100%;
   box-sizing: border-box;
   padding: 15px;
   display: grid;
   grid-template-rows: 1fr 1fr 1fr;
   text-align: center;
}

span.fas.fa-robot {
   align-self: end;
}

input#username {
   font-size: 1.1rem;
   line-height: 2.5rem;
   text-align: center;
   border-radius: 5px;
   border: solid 1px #00000087;
   margin: 15px 0;
   width: 100%;
}

form#form-start {
   align-self: end;
}

#start-chat {
   background: #FF9800;
   border: none;
   padding: 15px 30px;
   font-size: 1.2rem;
   color: #ffffff;
   border-radius: 5px;
   width: 100%;
}

/********************/

/*** Main chat UI ***/

/********************/

#header,
#form {
   display: grid;
   grid-template-columns: 50px auto 50px;
   align-items: center;
}

#header {
   padding: 6px;
}

/* Conversation */

#message-board {
   display: grid;
   align-self: end;
   grid-auto-rows: minmax(min-content, max-content);
   padding: 5px 0;
   box-sizing: border-box;
   max-height: 100%;
   overflow-x: hidden;
   overflow-y: scroll;
}

.post {
   position: relative;
   margin: 4px 10px;
   padding: 10px;
   border-radius: 10px;
   font-size: .9rem;
   word-break: break-word;
}

.post-user {
   justify-self: left;
   margin-right: 50px;
   background: rgba(255, 152, 0, 0.1);
   /*border-top-left-radius: 0;*/
}

.post-bot {
   justify-self: right;
   margin-left: 50px;
   background: rgba(64, 83, 191, 0.1);
   /*border-top-right-radius: 0;*/
}

.post:after {
   content: '';
   position: absolute;
   right: -10px;
   top: 10px;
   width: 0;
   height: 0;
   border: 10px solid transparent;
   border-top: 0;
}

.post-user:after {
   left: -10px;
   border-right-color: rgba(255, 152, 0, 0.1);
   border-left: 0;
}

.post-bot:after {
   right: -10px;
   border-left-color: rgba(64, 83, 191, 0.1);
   border-right: 0;
}

.timestamp {
   font-size: .6em;
   opacity: .4;
   margin: 5px 0 -5px;
   display: block;
}

/* Chat Form */

#form {
   padding: 6px;
   /*min-height: 40px;*/
   grid-template-rows: auto 1fr;
}

#emoijis {
   grid-column: 1 / -1;
   display: grid;
   grid-template-columns: repeat(7, 1fr);
   padding: 5px;
   grid-gap: 5px;
   margin-bottom: 5px;
}

#message {
   padding: 5px;
   font-size: 1rem;
   min-height: 25px;
   max-height: 25vh;
   overflow: auto;
   background: rgba(0, 0, 0, 0.05);
   color: rgba(0, 0, 0, 0.29);
   font-style: italic;
   outline: none;
   resize: none;
}

#form.focus {
   background: rgba(255, 152, 0, 0.1);
}

#message.focus {
   background: rgba(255, 255, 255, 0.5);
}

/* Custom Scrollbar */

::-webkit-scrollbar {
   width: 5px;
}

::-webkit-scrollbar-track {
   box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
   border-radius: 10px;
}

::-webkit-scrollbar-thumb {
   background: hsl(231, 50%, 50%, 10%);
   border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
   background: #b30000;
}

/***************/

/*** Credits ***/

/***************/

.credits {
   text-align: center;
   font-size: small;
   color: #b2b2b2;
}

.credits a {
   color: inherit;
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
</head>

<body translate="no">
  <html>

<head>
   <title>jQuery ChatBot</title>
</head>

<body>
   <div id="phone-wrapper">
      <div id="app">
         <div id="landing" class="bg-dark text-light" style="">
            <span class="fas fa-robot fa-4x"></span>
            <div>
               <h1 class="mt-3">ChatBot</h1>
            </div>
            <form id="form-start">
               <input type="text" name="username" id="username" value="" placeholder="Your name" required>
               <button type="submit" id="start-chat">Start chat</button>
            </form>
         </div>
         <div id="header" class="bg-dark">
            <div><button id="back-button" class="text-light btn-transparent btn-icon fas fa-arrow-left"></button></div>
            <div class="text-light align-center">
               <h2>ChatBot</h2>
            </div>
            <div>
               <button id="nav-icon" class="text-light btn-transparent btn-icon fas fa-bars"></button>
               <nav id="nav-container" style="display: none;">
                  <ul class="nav">
                     <li id="search" class="nav-link"><span class="fas fa-search"></span>Search</li>
                     <li id="clear-history" class="nav-link"><span class="fas fa-trash-alt"></span>Clear history</li>
                     <li id="theme" class="nav-link"><span class="fas fa-cogs"></span>Settings</li>
                     <hr>
                     <li id="sign-out" class="nav-link"><span class="fas fa-sign-out-alt"></span>Sign out</li>
                  </ul>
               </nav>
            </div>
         </div>
         <div id="message-board">


         </div>
         <div id="form" class="bg-light">
            <div id="emoijis" style="display: none;">
               <button class="smiley btn-transparent btn-icon"><span class="far fa-grin-beam"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-grin"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-grin-wink"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-grin-tongue"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-grin-tongue-wink"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-kiss-wink-heart"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-grin-hearts"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-surprise"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-angry"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-tired"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-sad-tear"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-grin-squint-tears"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-sad-cry"></span></button>
               <button class="smiley btn-transparent btn-icon"><span class="far fa-dizzy"></span></button>
            </div>
            <div><button id="emoi" class="btn-transparent btn-icon far fa-grin"></button></div>
            <div id="message" placeholder="Type your message here" rows="1" contenteditable></div>
            <div><button id="send" type="" class="btn-transparent btn-icon fas fa-paper-plane"></button></div>
         </div>
      </div>
   </div>

</body>

</html>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
      <script id="rendered-js" >
$(document).ready(() => {


  /******************/
  /*** START CHAT ***/
  /******************/


  // set visitor name
  let $userName = "Tom";

  // start chatbox
  $("#form-start").on("submit", event => {
    event.preventDefault();
    $userName = $("#username").val();
    $("#landing").slideUp(300);
    setTimeout(() => {
      $("#start-chat").html("Continue chat");
    }, 300);
  });




  /*****************/
  /*** USER CHAT ***/
  /*****************/


  // Post a message to the board
  function $postMessage() {
    $("#message").find("br").remove();
    let $message = $("#message").html().trim(); // get text from text box
    $message = $message.replace(/<div>/, "<br>").replace(/<div>/g, "").replace(/<\/div>/g, "<br>").replace(/<br>/g, " ").trim();
    if ($message) {// if text is not empty
      const html = `<div class="post post-user">${$message + timeStamp()}</span></div>`; // convert post to html
      $("#message-board").append(html); // add post to board
      $scrollDown(); // stay at bottom of chat
      botReply($message);
    };
    $("#message").empty();
  };

  // Chat input
  $("#message").on("keyup", event => {
    if (event.which === 13) $postMessage(); // Use enter to send
  }).on("focus", () => {
    $("#message").addClass("focus");
  }).on("blur", () => {
    $("#message").removeClass("focus");
  });
  $("#send").on("click", $postMessage);




  /**********************/
  /*** AUTO REPLY BOT ***/
  /**********************/


  function botReply(userMessage) {
    const reply = generateReply(userMessage);
    if (typeof reply === "string") postBotReply(reply);else
    reply.forEach(str => postBotReply(str));
  };

  function generateReply(userMessage) {
    const message = userMessage.toLowerCase();
    let reply = [`Sorry, I don't understand you.`, `Please try again`];

    // Generate some different replies
    if (/^hi$|^hell?o|^howdy|^hoi|^hey|^ola/.test(message)) reply = [`Hi ${$userName}`, `What can I do for you?`];else
    if (/test/.test(message)) reply = [`Ok`, `Feel free to test as much as you want`];else
    if (/help|sos|emergency|support/.test(message)) reply = [`I am here to help.`, `What seems to be the problem?`];else
    if (/class\=\"fa/.test(message)) reply = [`I see you've found the smileys`, `Cool! <span class="far fa-grin-beam fa-2x"></span>`, `Did you need something?`];else
    if (/how|what|why/.test(message)) reply = userMessage + " what?";else
    if (/^huh+|boring|lame|wtf|pff/.test(message)) reply = [`<span class="far fa-dizzy fa-2x"></span>`, `I'm sorry you feel that way`, `How can I make it better?`];else
    if (/bye|ciao|adieu|salu/.test(message)) reply = [`Ok, bye :)`];

    return reply;
  };

  function postBotReply(reply) {
    const html = `<div class="post post-bot">${reply + timeStamp()}</div>`;
    const timeTyping = 500 + Math.floor(Math.random() * 2000);
    $("#message-board").append(html);
    $scrollDown();
  };



  /******************/
  /*** TIMESTAMPS ***/
  /******************/


  function timeStamp() {
    const timestamp = new Date();
    const hours = timestamp.getHours();
    let minutes = timestamp.getMinutes();
    if (minutes < 10) minutes = "0" + minutes;
    const html = `<span class="timestamp">${hours}:${minutes}</span>`;
    return html;
  };




  /***************/
  /*** CHAT UI ***/
  /***************/


  // Back arrow button
  $("#back-button").on("click", () => {
    $("#landing").show();
  });


  // Menu - navigation
  $("#nav-icon").on("click", () => {
    $("#nav-container").show();
  });

  $("#nav-container").on("mouseleave", () => {
    $("#nav-container").hide();
  });

  $(".nav-link").on("click", () => {
    $("#nav-container").slideToggle(200);
  });

  // Clear history
  $("#clear-history").on("click", () => {
    $("#message-board").empty();
    $("#message").empty();
  });

  // Sign out
  $("#sign-out").on("click", () => {
    $("#message-board").empty();
    $("#message").empty();
    $("#landing").show();
    $("#username").val("");
    $("#start-chat").html("Start chat");
  });




  /*********************/
  /*** SCROLL TO END ***/
  /*********************/


  function $scrollDown() {
    const $container = $("#message-board");
    const $maxHeight = $container.height();
    const $scrollHeight = $container[0].scrollHeight;
    if ($scrollHeight > $maxHeight) $container.scrollTop($scrollHeight);
  }




  /***************/
  /*** EMOIJIS ***/
  /***************/


  // toggle emoijis
  $("#emoi").on("click", () => {
    $("#emoijis").slideToggle(300);
    $("#emoi").toggleClass("fa fa-grin far fa-chevron-down");
  });

  // add emoiji to message
  $(".smiley").on("click", event => {
    const $smiley = $(event.currentTarget).clone().contents().addClass("fa-lg");
    $("#message").append($smiley);
    $("#message").select(); // ==> BUG: message field not selected after adding smiley !! 
  });





});
//# sourceURL=pen.js
    </script>

  
</body>

</html> 