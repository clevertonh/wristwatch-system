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
import model.Wristwatch;

/**
 * Servlet implementation class WristwachController
 */
@WebServlet(name = "WristwachController", urlPatterns = {"/wristwatch",
	    "/wristwatch/create",
	    "/wristwatch/update",
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
		case "/wristwatch":			
			break;
			
		case "/wristwatch/create":
			wristwatch.setName(request.getParameter("name"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getWristwatchDao();

                dao.create(wristwatch);

                session.setAttribute("error", "Relógio cadastrada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/wristwatch-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/wristwatch/update":
			break;
			
		case "/wristwatch/delete":
			break;
			
		case "/wristwatch/read":
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
		case "/wristwatch":			
			break;
			
		case "/wristwatch/create":
			wristwatch.setName(request.getParameter("name"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getWristwatchDao();

                dao.create(wristwatch);

                session.setAttribute("error", "Relógio cadastrada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/wristwatch-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/wristwatch/update":
			break;
			
		case "/wristwatch/delete":
			break;
			
		case "/wristwatch/read":
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

}
