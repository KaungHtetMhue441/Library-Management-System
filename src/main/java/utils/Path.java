package utils;

import java.io.IOException;
import java.util.UUID;

import jakarta.servlet.http.Part;

public class Path {
	private  static final String APP_URL = "http://localhost:8080/ucst-library/";
	private  static final String REAL_IMAGE_PATH = "D:\\University library\\ucst-library\\src\\main\\webapp\\assets\\images\\";
	public static String getRoute(String path) {
		return APP_URL+path;
	}
	
	public static String getImagePath(String path) {
		return APP_URL+"assets/images"+path;
	}
	
	public static String getRealImagePath(String path) {
		return REAL_IMAGE_PATH+path;
	}
	
}
