package controllers.admin.book;

import java.io.IOException;
import java.sql.SQLException;

import dao.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repositories.BookRepository;
import utils.FileAction;

/**
 * Servlet implementation class CreateBook
 */
@WebServlet("/admin/book/create")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class CreateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		String title = request.getParameter("title");
		String bookCode = request.getParameter("code");
		int authorId = Integer.parseInt(request.getParameter("author_id"));
		int categoryId = Integer.parseInt(request.getParameter("category_id"));
		String description = request.getParameter("description");
		String imageName = null;
		String image = null;
		Part filePart = request.getPart("file");
		if(filePart.getSubmittedFileName()!="") {
			image = FileAction.saveFile("books\\",filePart);
			imageName = filePart.getSubmittedFileName();
		}
		
		BookRepository bookRepository = new BookRepository();
		
		try {
			bookRepository.create(new Book(title,bookCode,authorId,categoryId,description,image,imageName));
			request.getSession().setAttribute("success", "Book successfully created!");
			response.sendRedirect("/ucst-library/admin/book/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("/ucst-library/admin/book/create");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
