package utils;

public class Str {
	public static boolean isNullorEmpty(String str) {
		return str==null||str=="";
	}
	
	public static int lastIndex(String str) {
			return (int)str.charAt(str.length()-1);
		
	}
}
