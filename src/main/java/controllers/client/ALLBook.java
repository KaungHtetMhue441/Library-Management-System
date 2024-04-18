package controllers.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.BookRepository;
import utils.Str;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.Book;

/**
 * 
 * Servlet implementation class Book
 */
@WebServlet("/client/books")
public class ALLBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ALLBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String search = request.getParameter("search");
		String category_id = request.getParameter("category_id");
		
		search = Str.isNullorEmpty(search)?null:search;
		category_id = Str.isNullorEmpty(category_id)?null:category_id;
		BookRepository bookRepository = new BookRepository();
		try {
			List<Book> books = bookRepository.getAll(search,category_id);
			System.out.println(books);
			request.setAttribute("books", books);
			request.getRequestDispatcher("/client/books.jsp").forward(request, response);
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
