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
import dao.UserDao;
import model.User;


@WebServlet(name = "UserController", urlPatterns = {"/user",
	    "/user/create",
	    "/user/update",
	    "/user/delete",
	    "/user/read",
	    "/user/listAll"
	})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDao dao;
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher;
		
		switch(request.getServletPath()) {
		case "/user":
			break;
			
		case "/user/create":
			break;
			
		case "/user/update":
			break;
			
		case "/user/delete":
			break;
			
		case "/user/read":
			break;
			
		case "/user/listAll":

			try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getUserDao();
                
                List<User> daoList = dao.all();
                
                request.setAttribute("userList", daoList);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
            	request.getSession().setAttribute("error", ex.getMessage());
            }
			
			dispatcher = request.getRequestDispatcher("/view/user-list.jsp");
			dispatcher.forward(request, response);
			break;
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDao dao;
		User user = new User();
		HttpSession session = request.getSession();
		
		switch(request.getServletPath()) {			
		case "/user/create":
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));
			
            try (DAOFactory daoFactory = new DAOFactory()) {

                dao = daoFactory.getUserDao();

                dao.create(user);

                response.sendRedirect(request.getContextPath() + "/view");
            } catch (ClassNotFoundException | IOException | SQLException ex) {
                session.setAttribute("error", ex.getMessage());
                response.sendRedirect(request.getContextPath() + "/view/user-create");
            }

			break;
			
		case "/user/update":
			break;
			
		case "/user/delete":
			break;
			
		case "/user/listAll":
			break;
			
		}
	}

}
