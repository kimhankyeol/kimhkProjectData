package poly.util;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class websocket {
/**
 * 웹 소켓이 연결되면 호출되는 이벤트
 * */
	@OnOpen // 서버측에서 클라이언트와 웹소켓 연결이 되었을때 호출되는 함수
	public void handleOpen() {
		System.out.println("client is now connected");
	}
	/**
	 * 웹소켓으로 부터  메시지가 오면 호출되는 이벤트
	 * @Param message
	 * @return
	 */
	@OnMessage //클라이언트와 웹소켓 연결이 되었을떄 호출되는 함수
	public String handleMessage(String message) {
		System.out.println("receive from client : " +message);
		String replyMessage="echo:"+message;
		System.out.println("send to client : " +replyMessage);
		return replyMessage;
	}
	/**
	 * 웹 소켓이 닫히면 호출되는 이벤트
	 * */
	@OnClose //웹 소켓이 끊겼을 떄
	public void handleClose() {
		System.out.println("client is now disconnected");
	}
	/**
	 * 웹 소켓이 에러가 나면 호출되는 이벤트 
	 * @Param t
	 * */
	@OnError//웹소켓이 에러가 나면 발생을 하는 이벤트
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
