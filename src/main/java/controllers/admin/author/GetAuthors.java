package controllers.admin.author;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import dao.Author;
import repositories.AuthorRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetAuthors
 */
@WebServlet("/admin/author/all")
public class GetAuthors extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AuthorRepository authorRepository;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAuthors() {
        this.authorRepository=new AuthorRepository();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String search = (String)request.getParameter("search");
		List<Author> authors=null;
		try {
			 authors=this.authorRepository.getAll(search);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		request.setAttribute("authors", authors);
		request.getRequestDispatcher("/admin/author/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
