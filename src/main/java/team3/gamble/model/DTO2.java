package team3.gamble.model;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

public class DTO2 extends LinkedHashMap{
	private static final String ns = "team3.gamble.mybatis";
	private String serviceName;
	private String dbName;
	private String method;
	private String view;
	
	public String getNameSpace() {
		return ns+"."+serviceName+"."+method;
	}

	@Override
	public Object get(Object key) {
		return this.get(key);
	}

	@Override
	public Object put(Object key, Object value) {
		return this.put(key, value);
	}

	public void put(@RequestParam LinkedHashMap map) {
		this.putAll(map);
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
