package app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.UUID;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet(name="FIleUploadServlet",urlPatterns="/file-upload")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    Part filePart = request.getPart("file");
	    String originalName = filePart.getSubmittedFileName();
	    UUID fileName = UUID.randomUUID();
	    String mine = extractMine(originalName);
	    String fullName = fileName+"."+mine;
	    
	    for (Part part : request.getParts()) {
	      part.write("D:\\Library Management System\\LibraryApplication\\src\\main\\webapp\\assets\\images\\" +fullName);
	    }
	    
	    response.getWriter().print("File name is : "+fullName);
	    response.getWriter().print("The file uploaded sucessfully.");
	}
	 
	public String extractMine(String str) {
		return str.substring(str.lastIndexOf('.'));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
