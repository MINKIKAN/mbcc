<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container">
    <h1 class="text-center">MBCC 회의방</h1>
    <div id="chatArea" class="border">
        <!-- Chat messages will be displayed here -->
    </div>
    <div class="input-group mt-3">
        <input type="text" id="chatInput" class="form-control" placeholder="Type your message...">
        <div class="input-group-append">
            <button type="button" class="btn btn-primary" onclick="sendMessage()">전송</button>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<style>
body {
    margin: 20px;
}

#chatArea {
    height: 400px;
    overflow-y: auto;
    padding: 15px;
    background-color: #f8f8f8;
}
</style>
<script>
const chatArea = document.getElementById("chatArea");
const chatInput = document.getElementById("chatInput");

const userId = '<%= session.getAttribute("id") %>';
const socket = new WebSocket("ws://" + location.host + "/MBCC/chat");

console.log("WebSocket object created:", socket);

socket.onopen = (event) => {
    writeToChat("Connected to the chat server.");
};

socket.onmessage = (event) => {
    writeToChat(event.data);
};

socket.onclose = (event) => {
    writeToChat("Disconnected from the chat server.");
};

socket.onerror = (event) => {
    writeToChat("Error: " + event.data);
};

function sendMessage() {
    if (chatInput.value.trim() !== "") {
        socket.send(chatInput.value);
        chatInput.value = "";
    }
}

function writeToChat(message) {
    const messageElement = document.createElement("div");
    messageElement.innerText = message;
    chatArea.appendChild(messageElement);
    chatArea.scrollTop = chatArea.scrollHeight;
}

chatInput.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
        sendMessage();
    }
});
</script>