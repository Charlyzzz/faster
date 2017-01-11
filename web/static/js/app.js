// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import $ from "jquery"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

var login_button
var jumbotron

$(document).ready(function(){
     login_button = $("#login")
     jumbotron = $("#jumbotron")
     login_button.click(login_fadeout)
})

var login_fadeout = function(event){
    login_button.fadeOut(400,login_button.remove)
    jumbotron.animate({height: jumbotron.outerHeight() - login_button.outerHeight() + "px"}, 800)    
}