package controllers.admin.author;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import dao.Author;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repositories.AuthorRepository;

/**
 * Servlet implementation class CreateAuthors
 */
@WebServlet("/admin/author/create")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class CreateAuthors extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AuthorRepository authorRepository;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAuthors() {
        super();
        this.authorRepository=new AuthorRepository();
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			Part filePart = request.getPart("file");
			String name = request.getParameter("name");
			String image = this.saveFile(filePart);
			String imageName = filePart.getSubmittedFileName();
			
			Author author = new Author(
					name,
					image,
					imageName
					);
			
			this.authorRepository.create(author);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error Occor");
			response.sendRedirect("/ucst-library/admin/author/create");
		}
		
		response.sendRedirect("/ucst-library/admin/author/all");
		response.setContentType("text/html");
		response.getWriter().println("Successfully save");		
	}
	
	public String saveFile(Part filePart) throws IOException {
	    String originalName = filePart.getSubmittedFileName();
	    UUID fileName = UUID.randomUUID();
	    String mine = extractMine(originalName);
	    String fullName = fileName+mine;
	    filePart.write("D:\\University library\\ucst-library\\src\\main\\webapp\\assets\\images\\authors\\" +fullName);
	    return fullName;
	}
	
	public String extractMine(String str) {
		return str.substring(str.lastIndexOf('.'));
	}

}
