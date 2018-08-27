package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BrandDao;
import dao.DAOFactory;
import model.Brand;
import dao.BrandDao;


/**
 * Servlet implementation class BrandController
 */

@WebServlet(name = "BrandController", urlPatterns = {"/brand",
	    "/brand/create",
	    "/brand/update",
	    "/brand/delete",
	    "/brand/read",
	    "/brand/listAll"
	})
public class BrandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BrandDao dao;
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Brand brand = new Brand();
        
		switch(request.getServletPath()) {
		case "/brand":			
			break;
			
		case "/brand/create":
			brand.setName(request.getParameter("name"));
			brand.setCountry(request.getParameter("country"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getBrandDao();

                dao.create(brand);

                session.setAttribute("error", "Marca cadastrada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/brand-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/brand/update":
			break;
			
		case "/brand/delete":
			break;
			
		case "/brand/read":
			break;
			
		case "/brand/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getBrandDao();
                
                List<Brand> daoList = dao.all();
                
                request.setAttribute("brandList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	session.setAttribute("error", ex.getMessage());
            }

			dispatcher = request.getRequestDispatcher("/view/brand-list.jsp");
			dispatcher.forward(request, response);
			break;
		}
			
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BrandDao dao;
		RequestDispatcher dispatcher;
		
		switch(request.getServletPath()) {
		case "/brand":
			break;
			
		case "/brand/create":
			break;
			
		case "/brand/update":
			break;
			
		case "/brand/delete":
			break;
			
		case "/brand/read":
			break;
			
		case "/brand/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getBrandDao();
                
                List<Brand> daoList = dao.all();
                
                request.setAttribute("brandList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	request.getSession().setAttribute("error", ex.getMessage());
            }
			
			dispatcher = request.getRequestDispatcher("/view/brand-list.jsp");
			dispatcher.forward(request, response);
			break;
		}
}

}
