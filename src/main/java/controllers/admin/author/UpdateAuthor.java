package controllers.admin.author;

import java.io.IOException;
import java.sql.SQLException;

import dao.Author;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repositories.AuthorRepository;
import utils.FileAction;

/**
 * Servlet implementation class UpdateAuthor
 */
@WebServlet("/admin/author/update")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class UpdateAuthor extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private AuthorRepository authorRepository;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAuthor() {
    	super();
    	this.authorRepository=new AuthorRepository();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.getWriter().println("/admin/author/update");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id  = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			Part filePart = request.getPart("file");
			Author author = this.authorRepository.get(id);
			author.setName(name);
			name = filePart.getSubmittedFileName();

			if(filePart.getSubmittedFileName()!="") {
				System.out.println(filePart.getSubmittedFileName());
				System.out.println("kaung");
				System.out.println("file Name : "+filePart.getSubmittedFileName());
				String image = FileAction.saveFile("authors\\",filePart);

				FileAction.deleteFile("authors\\"+author.getImageName());
				String imageName = filePart.getSubmittedFileName();
				
				author.setImageName(image);
				author.setImageOriginalName(imageName);
			}
			
			System.out.println("hey"+author.getName());
			this.authorRepository.update(author);
			response.sendRedirect("/ucst-library/admin/author/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
