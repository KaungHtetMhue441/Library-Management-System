package controllers.admin.author;

import java.io.IOException;
import java.sql.SQLException;

import dao.Author;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.AuthorRepository;

/**
 * Servlet implementation class EditAuthor
 */
@WebServlet("/admin/author/edit")
public class EditAuthor extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final AuthorRepository authorRepository;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAuthor() {
        super();
        this.authorRepository = new AuthorRepository();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int id = Integer.parseInt((String)request.getParameter("id"));
		Author author=null;
		try {
			author=this.authorRepository.get(id);
			request.setAttribute("author", author);
			request.getRequestDispatcher("/admin/author/edit.jsp").forward(request, response);
		} catch (SQLException e) {
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
