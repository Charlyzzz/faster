import $ from "jquery"
import socket from "./socket"

const ENTER_KEY = 13

let channel = socket.channel("lobby", {})

let $messages
let $chatbox

channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("new_message", (payload) => {
    let line = newLine(payload.user, payload.content)
    $messages.append(line)
})

let registerChatboxAction = function () {
    $chatbox.keypress(function (event) {
        let username = $("#from_phoenix").attr("username")
        let pressedKey = event.which
        if (pressedKey == ENTER_KEY && chatboxContent() !== "") {
            pushMessage(username, chatboxContent())
            clearChatbox()
        }
    })
}

let clearChatbox = function () {
    $chatbox.val("")
}

let chatboxContent = function () {
    return $chatbox.val()
}

let pushMessage = function (username, text) {
    channel.push('new_message', { user: username, content: text })
}

let messageReceived = function (payload) {
    $messages.append(payload.content)
}

let newLine = function (username, text) {
    return `<div><b>${username}:</b> <i>${text}</i></div>`
}

export let Chat = {
    run: function () {
        $(window).on('load', function () {
            $messages = $("#messages")
            $chatbox = $("#chatbox")
            registerChatboxAction()
        })
    }
}
