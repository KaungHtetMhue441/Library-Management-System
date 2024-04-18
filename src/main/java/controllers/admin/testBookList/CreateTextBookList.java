package controllers.admin.testBookList;

import java.io.IOException;
import java.sql.SQLException;

import dao.TextBookList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.TextBookListRepository;

/**
 * Servlet implementation class CreateTextBookList
 */
@WebServlet("/admin/text-book-list/create")
public class CreateTextBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTextBookList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int text_book_id = Integer.parseInt(request.getParameter("text_book_id"));
		String code = request.getParameter("code");
		TextBookList textBookList = new TextBookList();
		textBookList.setCode(code);
		textBookList.setTestBookId(text_book_id);
		
		TextBookListRepository repository = new TextBookListRepository();
		try {
			repository.create(textBookList);
			request.getSession().setAttribute("success", "Text Book List successfully created!");
			response.sendRedirect("/ucst-library/admin/text-book-list/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
