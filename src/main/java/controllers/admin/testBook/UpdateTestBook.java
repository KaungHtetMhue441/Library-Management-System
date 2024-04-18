package controllers.admin.testBook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import repositories.TestBookRepository;
import utils.FileAction;

import java.io.IOException;
import java.sql.SQLException;

import dao.TestBook;

/**
 * Servlet implementation class UpdateTestBook
 */
@WebServlet("/admin/testbook/update")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class UpdateTestBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTestBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String isbn = request.getParameter("isbn");
		String year  = request.getParameter("year");
		String semester = request.getParameter("semester");
		int author_id = Integer.parseInt(request.getParameter("author_id"));
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		String description = request.getParameter("description");
		Part filePart = request.getPart("file");
		String image = request.getParameter("image");
		String imageName = request.getParameter("image_name");
		
		TestBook testBook = new TestBook();
		testBook.setId(id);
		testBook.setTitle(title);testBook.setYear(year);testBook.setIsbn(isbn);
		testBook.setSemester(semester);testBook.setAuthorId(author_id);
		testBook.setCategoryId(category_id);testBook.setDescription(description);;
		
		if(filePart.getSubmittedFileName()!="") {
			String deleteImage = image;
			image  = FileAction.saveFile("testbooks\\", filePart);
			imageName = filePart.getSubmittedFileName();
			FileAction.deleteFile("testbooks\\"+deleteImage);
		}
		testBook.setImage(image);
		testBook.setImageName(imageName);
		
		TestBookRepository testBookRepository = new TestBookRepository();
		try {
			testBookRepository.update(testBook);
			request.getSession().setAttribute("success", "TestBook successfully Updated!");
			response.sendRedirect("/ucst-library/admin/testbook/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.getSession().setAttribute("error", e.getMessage());
			e.printStackTrace();
		}
	}

}
