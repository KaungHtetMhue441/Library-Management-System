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
 * Servlet implementation class EditCategory
 */

@WebServlet("/admin/category/edit")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int id = Integer.parseInt(request.getParameter("id"));
		CategoryRepository categoryRepository = new CategoryRepository();
		try {
			Category category = categoryRepository.get(id);
			request.setAttribute("category", category);
			request.getRequestDispatcher("/admin/category/edit.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", e.getMessage());
			response.sendRedirect("/ucst-library/admin/category/all");
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
