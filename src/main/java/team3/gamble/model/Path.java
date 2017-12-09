package team3.gamble.model;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

public class Path{
	private static final String ns = "team3.gamble.mybatis";
	private String serviceName;
	private String dbName;
	private String method;
	private String returnMethod;
	private String returnType;
	private String view;
	private boolean returnflag=false;
	
	
	public void changeMode() {
		returnflag = !returnflag;
	}
	
	public boolean dmlexist() {
		return !method.equals("null");
	}
	
	public String getReturnMethod() {
		return returnMethod;
	}

	public String getReturnType() {
		return returnType;
	}

	public void setReturnMethod(String returnMethod) {
		this.returnMethod = returnMethod;
	}

	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}
	
	public String getNameSpace() {
		String method = returnflag? returnMethod:this.method;
		if(dbName.contains("anony_board_reply")) return ns+".anonyreply."+method;
		if(dbName.contains("anony_board")) return ns+".anonyboard."+method;
		if(dbName.contains("reply")) return ns+".reply."+method;
		if(dbName.contains("board")) return ns+".board."+method;
		return ns+"."+serviceName+"."+dbName+"."+method;
	}
	
	public String getViewPath() {
		if(view.equals("index")) return "redirect:/";
		return serviceName+"/"+dbName+"/"+view;
	}
	
	public String getServiceName() {
		return serviceName;
	}

	public String getDbName() {
		return dbName;
	}

	public String getMethod() {
		return method;
	}

	public String getView() {
		return view;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public void setView(String view) {
		this.view = view;
	}
}
