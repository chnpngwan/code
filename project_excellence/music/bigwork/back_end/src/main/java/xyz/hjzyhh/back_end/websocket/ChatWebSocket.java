package xyz.hjzyhh.back_end.websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import xyz.hjzyhh.back_end.DTO.ReceiveMessage;
import xyz.hjzyhh.back_end.DTO.SendMessage;
import xyz.hjzyhh.back_end.service.UserService;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig;
import java.io.IOException;
import java.util.TreeMap;
import java.util.logging.Logger;

@Component
@ServerEndpoint(value = "/chat", configurator = ChatWebSocket.Configurator.class)
public class ChatWebSocket {

    private static final Logger logger = Logger.getLogger(ChatWebSocket.class.getName());


    private static final TreeMap<Long, Session> sessions = new TreeMap<>();

    private ObjectMapper objectMapper = new ObjectMapper(); // 创建ObjectMapper实例
    private Long uid;
    private String nickname;


    private static UserService userService;
    @Autowired
    public void setUserService(UserService userService){
        ChatWebSocket.userService = userService;
    }


    private static RedisTemplate<String, String> redisTemplate;

    @Autowired
    public void setRedisTemplate(RedisTemplate<String, String> redisTemplate){
        ChatWebSocket.redisTemplate = redisTemplate;
    }

    private static final String REDIS_KEY_PREFIX = "chat_";

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) throws IOException {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        // 在这里可以使用httpSession对象进行操作
        uid = (Long) httpSession.getAttribute("uid");
        logger.info("WebSocket connection opened. UID: " + uid);
        nickname = userService.findOne(uid).getNickname();
        sessions.put(uid, session);
        String message = redisTemplate.opsForList().rightPop(REDIS_KEY_PREFIX + uid);
        while (message != null) {
            session.getBasicRemote().sendText(message);
            message = redisTemplate.opsForList().rightPop(REDIS_KEY_PREFIX + uid);
        }
    }

    @OnClose
    public void onClose(Session session) {
        sessions.remove(uid, session);
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        // 你可以在这里添加逻辑来保存消息到数据库等操作
        // 解析消息为对象
        ReceiveMessage messageObject = objectMapper.readValue(message, ReceiveMessage.class);
        // 广播消息给所有连接的客户端
        long receiveId = messageObject.getReceiveId();
        SendMessage sendMessage = new SendMessage(uid, nickname, messageObject.getMessage());
        Session sendSession = sessions.get(receiveId);
        if (sendSession == null) {
            redisTemplate.opsForList().leftPush(REDIS_KEY_PREFIX + receiveId, objectMapper.writeValueAsString(objectMapper));
        }
        sendSession.getBasicRemote().sendText(objectMapper.writeValueAsString(sendMessage));
    }

    @Component
    public static class Configurator extends ServerEndpointConfig.Configurator {
        @Override
        public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
            HttpSession httpSession = (HttpSession) request.getHttpSession();
            config.getUserProperties().put(HttpSession.class.getName(), httpSession);
        }
    }
}
