package controllers.admin.testBook;

import java.io.IOException;
import java.sql.SQLException;

import dao.TestBook;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repositories.TestBookRepository;
import utils.FileAction;

/**
 * Servlet implementation class TetBookCreate
 */
@WebServlet("/admin/testbook/create")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class CreateTestBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTestBook() {
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
		String title = request.getParameter("title");
		String isbn = request.getParameter("isbn");
		String year  = request.getParameter("year");
		String semester = request.getParameter("semester");
		int author_id = Integer.parseInt(request.getParameter("author_id"));
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		String description = request.getParameter("description");
		Part filePart = request.getPart("file");
		String image = null;
		String imageName = null;
		
		TestBook testBook = new TestBook();
		testBook.setTitle(title);testBook.setYear(year);testBook.setIsbn(isbn);
		testBook.setSemester(semester);testBook.setAuthorId(author_id);
		testBook.setCategoryId(category_id);testBook.setDescription(description);;
		
		if(filePart.getSubmittedFileName()!="") {
			image  = FileAction.saveFile("testbooks\\", filePart);
			imageName = filePart.getSubmittedFileName();
		}
		testBook.setImage(image);
		testBook.setImageName(imageName);
		
		TestBookRepository testBookRepository = new TestBookRepository();
		try {
			testBookRepository.create(testBook);
			request.getSession().setAttribute("success", "TestBook successfully created!");
			response.sendRedirect("/ucst-library/admin/testbook/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.getSession().setAttribute("error", e.getMessage());
			e.printStackTrace();
		}
		
	}

}
