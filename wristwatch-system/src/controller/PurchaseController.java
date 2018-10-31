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

import dao.PurchaseDao;
import dao.DAOFactory;
import model.Purchase;

/**
 * Servlet implementation class PurchaseController
 */
@WebServlet(name = "/PurchaseController", urlPatterns = {"/purchase",
	    "/purchase/create",
	    "/purchase/update",
	    "/purchase/set-update",
	    "/purchase/delete",
	    "/purchase/read",
	    "/purchase/listAll"
	})
public class PurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PurchaseDao dao;
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Purchase purchase = new Purchase();
        
		switch(request.getServletPath()) {
			
		case "/purchase/delete":
			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getPurchaseDao();
    			purchase.setSalesman_name(request.getParameter("salesman"));
    			purchase.setBrand_name(request.getParameter("brand"));
                dao.delete(purchase);
                
                response.sendRedirect(request.getContextPath() + "/view/home");
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
                session.setAttribute("error", ex.getMessage());
                response.sendRedirect(request.getContextPath() + "/view/home");
            }
			
			break;
			
		case "/purchase/read":
			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getPurchaseDao();
    			purchase.setSalesman_name(request.getParameter("salesman"));
    			purchase.setBrand_name(request.getParameter("brand"));
                dao.read(purchase);
                
                response.sendRedirect(request.getContextPath() + "/view/home");
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
                session.setAttribute("error", ex.getMessage());
                response.sendRedirect(request.getContextPath() + "/view/home");
            }
			break;
			
		case "/purchase/set-update":
           try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getPurchaseDao();
    			purchase.setSalesman_name(request.getParameter("salesman"));
    			purchase.setBrand_name(request.getParameter("brand"));
                purchase = dao.read(purchase);

                request.setAttribute("purchase", purchase);
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                request.setAttribute("error", ex.getMessage());
            }
	           
			dispatcher = request.getRequestDispatcher("/view/purchase-update.jsp");
			dispatcher.forward(request, response);
			break;
				
		case "/purchase/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getPurchaseDao();
                
                List<Purchase> daoList = dao.all();
                
                request.setAttribute("purchaseList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	session.setAttribute("error", ex.getMessage());
            }

			dispatcher = request.getRequestDispatcher("/view/purchase-list.jsp");
			dispatcher.forward(request, response);
			break;
		}
			
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PurchaseDao dao;
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Purchase purchase = new Purchase();
		
		switch(request.getServletPath()) {
		case "/purchase/create":
			purchase.setSalesman_name(request.getParameter("salesman"));
			purchase.setBrand_name(request.getParameter("brand"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getPurchaseDao();

                dao.create(purchase);

                session.setAttribute("error", "Empresa de distribuição cadastrada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/purchase-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/purchase/update":
			purchase.setSalesman_name(request.getParameter("salesman"));
			purchase.setBrand_name(request.getParameter("brand"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getPurchaseDao();

                dao.update(purchase);

                session.setAttribute("error", "Empresa de distribuição atualizada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }

            response.sendRedirect(request.getContextPath() + "/purchase/listAll");
			break;
			
		}
}


}
