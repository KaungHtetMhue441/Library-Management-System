package controllers.admin.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.UserRepository;

/**
 * Servlet implementation class GetUsers
 */
@WebServlet("/admin/user/all")
public class GetUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String search = request.getParameter("search");
		String type  = request.getParameter("type");
		String p =request.getParameter("page");
		int page=1;
		if(!(p==null||p=="")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int recordsPerPage = 10;
		
		UserRepository repo = new UserRepository();
		try {
			int totalRecords = repo.getTotalRecords(search,type);
			int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
			
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
			List<User> users = repo.getAll(search, type, page);
			request.setAttribute("userList", users);
			request.setAttribute("totalPages", totalPages);
			request.getRequestDispatcher("/admin/user/index.jsp").forward(request, response);
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
