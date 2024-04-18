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
 * Servlet implementation class UpdateTextBookList
 */
@WebServlet("/admin/text-book-list/update")
public class UpdateTextBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTextBookList() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		TextBookList bookList = new TextBookList();
		bookList.setId(id);
		bookList.setCode(request.getParameter("code"));
		bookList.setTestBookId(Integer.parseInt(request.getParameter("text_book_id")));
		TextBookListRepository repo = new  TextBookListRepository();
		
		try {
			repo.update(bookList);
			request.getSession().setAttribute("success", "Text Book List successfully updated!");
			response.sendRedirect("/ucst-library/admin/text/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
