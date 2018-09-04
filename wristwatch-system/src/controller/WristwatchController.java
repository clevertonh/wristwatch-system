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
import dao.WristwatchDao;
import model.Brand;
import model.Salesman;

import model.Wristwatch;

import dao.BrandDao;
import dao.SalesmanDao;

/**
 * Servlet implementation class WristwachController
 */
@WebServlet(name = "WristwachController", urlPatterns = {"/wristwatch",
	    "/wristwatch/create",
	    "/wristwatch/update",
	    "/wristwatch/set-create",
	    "/wristwatch/set-update",
	    "/wristwatch/delete",
	    "/wristwatch/read",
	    "/wristwatch/listAll"
	})
public class WristwatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WristwatchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Wristwatch wristwatch = new Wristwatch();
        WristwatchDao dao;

		switch(request.getServletPath()) {
	
		case "/wristwatch/delete":
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getWristwatchDao();
                wristwatch.setId(Integer.parseInt(request.getParameter("id")));
                dao.delete(wristwatch);

                session.setAttribute("error", "Relógio removido com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/wristwatch-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/wristwatch/set-create":
			   BrandDao dao1;
			   SalesmanDao dao2;
	           try (DAOFactory daoFactory = new DAOFactory()) {

	        	    dao1 = daoFactory.getBrandDao();                
	                List<Brand> daoList1 = dao1.all();     
	                request.setAttribute("brandList", daoList1);

					dao2 = daoFactory.getSalesmanDao();          
	                List<Salesman> daoList2 = dao2.all();  
	                request.setAttribute("salesmanList", daoList2);
	                
	            } catch (ClassNotFoundException | IOException | SQLException ex) {
	                request.setAttribute("error", ex.getMessage());
	            }
		           
				dispatcher = request.getRequestDispatcher("/view/wristwatch-create.jsp");
				dispatcher.forward(request, response);
				break;
				
		case "/wristwatch/read":
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getWristwatchDao();
                wristwatch.setId(Integer.parseInt(request.getParameter("id")));
                wristwatch = dao.read(wristwatch);

                session.setAttribute("wristwatch", wristwatch);
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/wristwatch-list.jsp");
			dispatcher.forward(request, response);
			break;
			
			
		case "/wristwatch/set-update":
	           try (DAOFactory daoFactory = new DAOFactory()) {

	                dao = daoFactory.getWristwatchDao();
	                wristwatch.setId(Integer.parseInt(request.getParameter("id")));
	                wristwatch = dao.read(wristwatch);
	                wristwatch.setId(Integer.parseInt(request.getParameter("id")));
	                request.setAttribute("wristwatch", wristwatch);
	                
	        	    dao1 = daoFactory.getBrandDao();                
	                List<Brand> daoList1 = dao1.all();     
	                request.setAttribute("brandList", daoList1);

					dao2 = daoFactory.getSalesmanDao();          
	                List<Salesman> daoList2 = dao2.all();  
	                request.setAttribute("salesmanList", daoList2);
	            } catch (ClassNotFoundException | IOException | SQLException ex) {
	                request.setAttribute("error", ex.getMessage());
	            }
		           
				dispatcher = request.getRequestDispatcher("/view/wristwatch-update.jsp");
				dispatcher.forward(request, response);
				break;
				
		case "/wristwatch/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
				dao = daoFactory.getWristwatchDao();
                
                List<Wristwatch> daoList = dao.all();
                
                request.setAttribute("wristwatchList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	session.setAttribute("error", ex.getMessage());
            }

			dispatcher = request.getRequestDispatcher("/view/wristwatch-list.jsp");
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
		Wristwatch wristwatch = new Wristwatch();
        WristwatchDao dao;

		switch(request.getServletPath()) {
			
		case "/wristwatch/create":
			wristwatch.setName(request.getParameter("name"));
			wristwatch.setPrice(request.getParameter("price"));
			wristwatch.setQtdPlots(Integer.parseInt(request.getParameter("qtdPlots")));
			wristwatch.setPlotPrice(request.getParameter("plotPrice"));
			wristwatch.setBrand_name(request.getParameter("brand"));
			wristwatch.setSalesman_name(request.getParameter("salesman"));
			
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getWristwatchDao();

                dao.create(wristwatch);

                session.setAttribute("error", "Relógio cadastrada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/wristwatch-create.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/wristwatch/update":
			wristwatch.setId(Integer.parseInt(request.getParameter("id")));
			wristwatch.setName(request.getParameter("name"));
			wristwatch.setPrice(request.getParameter("price"));
			wristwatch.setQtdPlots(Integer.parseInt(request.getParameter("qtdPlots")));
			wristwatch.setPlotPrice(request.getParameter("plotPrice"));
			wristwatch.setBrand_name(request.getParameter("brand"));
			wristwatch.setSalesman_name(request.getParameter("salesman"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getWristwatchDao();

                dao.update(wristwatch);

                session.setAttribute("error", "Relógio atualizado com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            response.sendRedirect(request.getContextPath() + "/wristwatch/listAll");
			break;
			
		}
	}

}
