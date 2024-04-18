package controllers.admin.testBook;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.TestBook;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.TestBookRepository;

/**
 * Servlet implementation class GetTestBooks
 */

@WebServlet("/admin/testbook/all")
public class GetTestBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTestBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String search = request.getParameter("search");
		String year = request.getParameter("year");
		System.out.println("year :"+year);
		System.out.println("search : "+search);
		TestBookRepository testBookRepository = new TestBookRepository();
		int page=1;
		String p =request.getParameter("page");
		if(!(p==null||p=="")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int recordsPerPage = 10;
		
		try {
			
			int totalRecords=testBookRepository.getTotalRecords(search, year);
			int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
			
			System.out.println("record");
			request.setAttribute("totalPages", totalPages);
			
			List<TestBook> testBooks = testBookRepository.getAll(search,year,page);
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
			request.setAttribute("testbooks", testBooks);
			request.getRequestDispatcher("/admin/testbook/index.jsp").forward(request, response);
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
