package team3.web.util;

public class MyUtil{
	
	public static <T> T nullif (T obj, T nullif) {
		if(obj==null) return nullif;
		return obj;
	}
}
