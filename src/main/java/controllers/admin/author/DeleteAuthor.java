package controllers.admin.author;

import java.io.IOException;
import java.sql.SQLException;

import repositories.AuthorRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import com.repositories.AuthorRepository;

/**
 * Servlet implementation class DeleteAuthor
 */
@WebServlet("/admin/author/delete")
public class DeleteAuthor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AuthorRepository authorRepository;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAuthor() {
        super();
        this.authorRepository = new AuthorRepository();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			this.authorRepository.delete(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("success", true);
		response.sendRedirect("/ucst-library/admin/author/all");
	}

}
