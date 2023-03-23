package com.mbcc.util;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.HandshakeResponse;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig;

@ServerEndpoint(value = "/MBCC/chat", configurator = ChatEndPoint.ChatConfigurator.class)
public class ChatEndPoint extends javax.websocket.Endpoint {
	
	private static Set<Session> clients=Collections.synchronizedSet(new HashSet<>());
	
//	@OnOpen
//    public void onOpen(Session session, EndpointConfig config) {
//        String userId = (String) config.getUserProperties().get("userId");
//        clients.add(session);
//        // 환영 메시지 전송
//        try {
//            session.getBasicRemote().sendText("환영합니다. " + userId + "님이 채팅에 참여하셨습니다.");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
	
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
	    String userId = (String) config.getUserProperties().get("userId");
	    clients.add(session);
	    // 환영 메시지 전송
	    String welcomeMessage = "환영합니다. " + userId + "님이 채팅에 참여하셨습니다.";
	    broadcastMessage(welcomeMessage, session);
	}


    @OnClose
    public void onClose(Session session) {
    	clients.remove(session);
        // 퇴장 알림 메시지 전송
        broadcastMessage("사용자가 채팅에서 나갔습니다.", session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
    	// 메시지 브로드캐스팅
        broadcastMessage(message, session);
    }
    
    private void broadcastMessage(String message, Session sender) {
        clients.forEach(client -> {
            try {
                client.getBasicRemote().sendText(message);
            } 
            catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

    @OnError
    public void onError(Throwable error) {
        // 에러 발생 시의 로직 구현
    	error.printStackTrace();
    }
    
    public static class ChatConfigurator extends ServerEndpointConfig.Configurator {
        @Override
        public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest req, HandshakeResponse res) {
            HttpSession httpSession = (HttpSession) req.getHttpSession();
            if (httpSession != null) {
                String userId = (String) httpSession.getAttribute("id");
                if (userId != null) {
                    config.getUserProperties().put("userId", userId);
                }
            }
        }
    }
}
