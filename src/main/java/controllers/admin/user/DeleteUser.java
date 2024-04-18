package controllers.admin.user;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.UserRepository;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/admin/user/delete")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
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
		UserRepository repo = new UserRepository();
		try {
			repo.delete(id);
			request.getSession().setAttribute("success", "Successfully deleted!");
			response.sendRedirect("/ucst-library/admin/user/all");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getSession().setAttribute("error", "Error occur while deleting");
			response.sendRedirect("/ucst-library/admin/user/all");
		}
	}

}
