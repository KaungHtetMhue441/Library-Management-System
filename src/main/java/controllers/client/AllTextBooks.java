package controllers.client;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.TextBookList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.TextBookListRepository2;

/**
 * Servlet implementation class AllTextBooks
 */
@WebServlet("/client/text-books")
public class AllTextBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllTextBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String search = request.getParameter("search");
		String semester
		= request.getParameter("semester");
		String year = request.getParameter("year");
		
		TextBookListRepository2 repository = new TextBookListRepository2();
		
		int page=1;
		String p =request.getParameter("page");
		if(!(p==null||p=="")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int recordsPerPage = 10;
		
		try {
			int totalRecords=repository.getTotalRecords(search, year, semester);
			int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
			
			request.setAttribute("totalPages", totalPages);
			String uri = request.getRequestURL().toString();
            String queryString = request.getQueryString();
            if (queryString != null) {
                uri += "?" + queryString;
                if(uri.indexOf("?page")!=-1){
                    uri=uri.substring(0,uri.indexOf("?page"));
                    queryString=null;
                }
                else
                if(uri.indexOf("&page")!=-1){
                    uri=uri.substring(0,uri.indexOf("&page"));
                }
                request.setAttribute("queryString", queryString);
            }
            request.setAttribute("uri", uri);
			
			List<TextBookList> textBookList = repository.getAll(search, year, semester,page);
			request.setAttribute("textBookList", textBookList);
			request.getRequestDispatcher("/client/textBooks.jsp").forward(request, response);
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
