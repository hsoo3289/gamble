package team3.gamble.model;

import java.util.HashMap;

import org.springframework.web.bind.annotation.PathVariable;

public class CommonDTO{
	private static final String ns = "team3.gamble.mybatis";
	private String serviceName;
	private String dbName;
	private String method;
	private String view;
	
	public String getNameSpace() {
		return ns+"."+serviceName+"."+method;
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
