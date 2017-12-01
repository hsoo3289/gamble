package team3.web.gamble.game.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} ø¨∞·µ ", session.getId());
		for (WebSocketSession sess : sessionList)
			sess.sendMessage(new TextMessage("ªı ∏‚πˆ ¿‘¿Â"));
	}


	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		logger.info("{} binaryMessage ºˆΩ≈"+session.getId());
		super.handleBinaryMessage(session, message);
	}


	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}∑Œ ∫Œ≈Õ {} πﬁ¿Ω", session.getId(), message.getPayload());

		for (WebSocketSession sess : sessionList)
			sess.sendMessage(new TextMessage(message.getPayload()));
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} ø¨∞· ≤˜±Ë.", session.getId());
		for (WebSocketSession sess : sessionList)
			sess.sendMessage(new TextMessage(" ¥‘¿Ã ≈¿Â «œºÃΩ¿¥œ¥Ÿ."));
	}

}