package controllers.admin.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repositories.BookRepository;
import utils.FileAction;

import java.io.IOException;
import java.sql.SQLException;

import dao.Book;

/**
 * Servlet implementation class UpdateBook
 */
@WebServlet("/admin/book/update")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class UpdateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		Book book = new Book();
		book.setId(Integer.parseInt(request.getParameter("id")));
		book.setTitle(request.getParameter("title"));
		book.setCode(request.getParameter("code"));
		book.setAuthor_id(Integer.parseInt(request.getParameter("author_id")));
		System.out.println("author_id"+request.getParameter("author_id"));
		book.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		book.setDescription(request.getParameter("description"));
		book.setImage(request.getParameter("image"));
		book.setImage_name(request.getParameter("image_name"));
		Part filePart = request.getPart("file");
		
		BookRepository bookRepository = new BookRepository();
		
		try {
			if(filePart.getSubmittedFileName()!="") {
				
				String deleteImg = bookRepository.getImage(book.getId());
				FileAction.deleteFile("books\\"+deleteImg);
			
				 book.setImage(FileAction.saveFile("books\\",filePart));
				 book.setImage_name(filePart.getSubmittedFileName());
			}
			bookRepository.update(book);
			request.getSession().setAttribute("success", "Book successfully created!");
			response.sendRedirect("/ucst-library/admin/book/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("/ucst-library/admin/book/create");
		}
	}

}
