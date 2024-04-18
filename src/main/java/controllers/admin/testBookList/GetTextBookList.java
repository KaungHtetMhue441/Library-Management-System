package controllers.admin.testBookList;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.TextBookList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.TextBookListRepository;

/**
 * Servlet implementation class GetTextBookList
 */
@WebServlet("/admin/text-book-list/all")
public class GetTextBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTextBookList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String search = request.getParameter("search");
		String code = request.getParameter("code");
		String isbn = request.getParameter("isbn");
		
		TextBookListRepository repository = new TextBookListRepository();
		
		int page=1;
		String p =request.getParameter("page");
		if(!(p==null||p=="")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int recordsPerPage = 10;
		
		try {
			int totalRecords=repository.getTotalRecords(search, code, isbn);
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
			
			List<TextBookList> textBookList = repository.getAll(search, code, isbn,page);
			request.setAttribute("textBookList", textBookList);
			request.getRequestDispatcher("/admin/testbooklist/index.jsp").forward(request, response);
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
