package utils;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

import jakarta.servlet.http.Part;

public class FileAction {

	public static String extractMine(String str) {
		return str.substring(str.lastIndexOf('.'));
	}
	
	public static String saveFile(String path,Part filePart) throws IOException {
	    String originalName = filePart.getSubmittedFileName();
	    UUID fileName = UUID.randomUUID();
	    String mine = extractMine(originalName);
	    String fullName = fileName+mine;
	    filePart.write("D:\\University library\\ucst-library\\src\\main\\webapp\\assets\\images\\"+path+fullName);
	    return fullName;
	}

	public static void deleteFile(String name) {
		File file= new File(Path.getRealImagePath("\\"+name));
		if(file.exists()) {
			file.delete();
			System.out.println("Delete File successfully!");
		}else {
			System.out.println("File is null!");
		}
	}

}
