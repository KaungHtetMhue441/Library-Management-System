package controllers.admin.category;

import java.io.IOException;
import java.sql.SQLException;

import dao.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositories.CategoryRepository;

/**
 * Servlet implementation class UpdateCategory
 */
@WebServlet("/admin/category/update")
public class UpdateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategory() {
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
		CategoryRepository categoryRepository = new CategoryRepository();
		
		try {
			categoryRepository.update(new Category(
					Integer.parseInt(request.getParameter("id")),
					request.getParameter("name")
			));
			
			request.getSession().setAttribute("success","Category succesfully created");
			response.sendRedirect("/ucst-library/admin/category/all");
		} catch (NumberFormatException e) {
			request.getSession().setAttribute("error", "Number format is not correct");
			e.printStackTrace();
			response.sendRedirect("/ucst-library/admin/edit");
		} catch (SQLException e) {
			
			e.printStackTrace();
			request.getSession().setAttribute("error", e.getMessage());
			response.sendRedirect("/ucst-library/admin/eidt");
		}
		
		
		
		
	}

}
