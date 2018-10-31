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

import dao.SaleDao;
import dao.DAOFactory;
import model.Sale;

/**
 * Servlet implementation class SaleController
 */
@WebServlet(name = "SaleController", urlPatterns = {"/sale",
	    "/sale/create",
	    "/sale/update",
	    "/sale/set-update",
	    "/sale/delete",
	    "/sale/read",
	    "/sale/listAll"
	})
public class SaleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SaleDao dao;
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Sale sale = new Sale();
        
		switch(request.getServletPath()) {
			
		case "/sale/delete":
			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getSaleDao();
    			sale.setId_wristwatch(Integer.parseInt(request.getParameter("id")));
    			sale.setSalesman_name(request.getParameter("salesman"));
                dao.delete(sale);
                
                response.sendRedirect(request.getContextPath() + "/view/home");
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
                session.setAttribute("error", ex.getMessage());
                response.sendRedirect(request.getContextPath() + "/view/home");
            }
			
			break;
			
		case "/sale/read":
			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getSaleDao();
    			sale.setId_wristwatch(Integer.parseInt(request.getParameter("id")));
    			sale.setSalesman_name(request.getParameter("salesman"));
                dao.read(sale);
                
                response.sendRedirect(request.getContextPath() + "/view/home");
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
                session.setAttribute("error", ex.getMessage());
                response.sendRedirect(request.getContextPath() + "/view/home");
            }
			break;
			
		case "/sale/set-update":
           try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getSaleDao();
    			sale.setId_wristwatch(Integer.parseInt(request.getParameter("id")));
    			sale.setSalesman_name(request.getParameter("salesman"));
                sale = dao.read(sale);

                request.setAttribute("sale", sale);
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                request.setAttribute("error", ex.getMessage());
            }
	           
			dispatcher = request.getRequestDispatcher("/view/sale-update.jsp");
			dispatcher.forward(request, response);
			break;
				
		case "/sale/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getSaleDao();
                
                List<Sale> daoList = dao.all();
                
                request.setAttribute("saleList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	session.setAttribute("error", ex.getMessage());
            }

			dispatcher = request.getRequestDispatcher("/view/sale-list.jsp");
			dispatcher.forward(request, response);
			break;
		}
			
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleDao dao;
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Sale sale = new Sale();
		
		switch(request.getServletPath()) {
		case "/sale/create":
			sale.setId_wristwatch(Integer.parseInt(request.getParameter("id")));
			sale.setSalesman_name(request.getParameter("salesman"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getSaleDao();

                dao.create(sale);

                session.setAttribute("error", "Empresa de venda cadastrada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/sale-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/sale/update":
			sale.setId_wristwatch(Integer.parseInt(request.getParameter("id")));
			sale.setSalesman_name(request.getParameter("salesman"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getSaleDao();

                dao.update(sale);

                session.setAttribute("error", "Empresa de venda atualizada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }

            response.sendRedirect(request.getContextPath() + "/sale/listAll");
			break;
			
		}
}


}
