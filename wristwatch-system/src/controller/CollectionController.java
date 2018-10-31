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

import dao.CollectionDao;
import dao.DAOFactory;
import model.Collection;

/**
 * Servlet implementation class CollectionController
 */
@WebServlet(name = "/CollectionController", urlPatterns = 
	{	"/collection",
	    "/collectio/create",
	    "/collection/update",
	    "/collection/set-update",
	    "/collection/delete",
	    "/collection/read",
	    "/collection/listAll"
	}
)
public class CollectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CollectionDao dao;
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Collection collection = new Collection();
        
		switch(request.getServletPath()) {
			
		case "/collection/delete":
			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getCollectionDao();
                collection.setName(request.getParameter("name"));
                collection.setBrand_name(request.getParameter("brand"));
                dao.delete(collection);
                
                response.sendRedirect(request.getContextPath() + "/view/home");
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
                session.setAttribute("error", ex.getMessage());
                response.sendRedirect(request.getContextPath() + "/view/home");
            }
			
			break;
			
		case "/collection/read":
			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getCollectionDao();
                collection.setName(request.getParameter("name"));
                collection.setBrand_name(request.getParameter("brand"));
                dao.read(collection);
                
                response.sendRedirect(request.getContextPath() + "/view/home");
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
                session.setAttribute("error", ex.getMessage());
                response.sendRedirect(request.getContextPath() + "/view/home");
            }
			break;
			
		case "/collection/set-update":
           try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getCollectionDao();
                collection.setName(request.getParameter("name"));
                collection.setBrand_name(request.getParameter("brand"));
                collection = dao.read(collection);

                request.setAttribute("collection", collection);
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                request.setAttribute("error", ex.getMessage());
            }
	           
			dispatcher = request.getRequestDispatcher("/view/collection-update.jsp");
			dispatcher.forward(request, response);
			break;
				
		case "/collection/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getCollectionDao();
                
                List<Collection> daoList = dao.all();
                
                request.setAttribute("collectionList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	session.setAttribute("error", ex.getMessage());
            }

			dispatcher = request.getRequestDispatcher("/view/collection-list.jsp");
			dispatcher.forward(request, response);
			break;
		}
			
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CollectionDao dao;
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession();
		Collection collection = new Collection();
		
		switch(request.getServletPath()) {
		case "/collection/create":
			collection.setName(request.getParameter("name"));
			collection.setBrand_name(request.getParameter("brand"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getCollectionDao();

                dao.create(collection);

                session.setAttribute("error", "Coleção cadastrada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }
            
            dispatcher = request.getRequestDispatcher("/view/collection-create.jsp");
			dispatcher.forward(request, response);
			break;
			
		case "/collection/update":
			collection.setName(request.getParameter("name"));
			collection.setBrand_name(request.getParameter("brand"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getCollectionDao();

                dao.update(collection);

                session.setAttribute("error", "Coleção atualizada com sucesso!");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
            }

            response.sendRedirect(request.getContextPath() + "/collection/listAll");
			break;
			
		}
}
}
