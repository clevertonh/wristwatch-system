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

import dao.DAOFactory;
import dao.SalesmanDao;
import model.Salesman;

/**
 * Servlet implementation class SalesmanController
 */

@WebServlet(name = "SalesmanController", urlPatterns = {"/salesman",
	    "/salesman/create",
	    "/salesman/update",
	    "/salesman/delete",
	    "/salesman/read",
	    "/salesman/listAll"
	})
public class SalesmanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesmanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Salesman salesman = new Salesman();
        SalesmanDao dao;

		switch(request.getServletPath()) {
		case "/salesman":			
			break;
			
		case "/salesman/create":
			salesman.setName(request.getParameter("name"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getSalesmanDao();

                dao.create(salesman);

                session.setAttribute("error", "Revendedor cadastrado com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/salesman-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/salesman/update":
			break;
			
		case "/salesman/delete":
			break;
			
		case "/salesman/read":
			break;
			
		case "/salesman/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
				dao = daoFactory.getSalesmanDao();
                
                List<Salesman> daoList = dao.all();
                
                request.setAttribute("salesmanList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	session.setAttribute("error", ex.getMessage());
            }

			dispatcher = request.getRequestDispatcher("/view/salesman-list.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Salesman salesman = new Salesman();
        SalesmanDao dao;

		switch(request.getServletPath()) {
		case "/salesman":			
			break;
			
		case "/salesman/create":
			salesman.setName(request.getParameter("name"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getSalesmanDao();

                dao.create(salesman);

                session.setAttribute("error", "Revendedor cadastrado com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/salesman-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/salesman/update":
			break;
			
		case "/salesman/delete":
			break;
			
		case "/salesman/read":
			break;
			
		case "/salesman/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
				dao = daoFactory.getSalesmanDao();
                
                List<Salesman> daoList = dao.all();
                
                request.setAttribute("salesmanList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	session.setAttribute("error", ex.getMessage());
            }

			dispatcher = request.getRequestDispatcher("/view/salesman-list.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

}
