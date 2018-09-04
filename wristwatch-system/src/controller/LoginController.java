package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import dao.DAOFactory;
import dao.UserDao;

@WebServlet(name = "/LoginController", urlPatterns = {
		"/login",
	    "/logout",
	    ""
})
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session;
        RequestDispatcher dispatcher;

        switch (request.getServletPath()) {
            case "":
                session = request.getSession(false);

                if (session != null && session.getAttribute("user") != null) {
                	response.sendRedirect(request.getContextPath() + "/view/home.jsp");
                    //dispatcher = request.getRequestDispatcher("/view/home.jsp");
                } else {
                    dispatcher = request.getRequestDispatcher("/index.jsp");
                    dispatcher.forward(request, response);
                }

                break;
            case "/logout":
                session = request.getSession(false);

                if (session != null) {
                    session.invalidate();
                }

                response.sendRedirect(request.getContextPath() + "/");
        }   
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = new User();
		HttpSession session = request.getSession();
		
		UserDao dao;
		
		switch (request.getServletPath()) {
        case "/login":
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));

            try (DAOFactory daoFactory = new DAOFactory()) {
                dao = daoFactory.getUserDao();

                dao.authenticate(user);

                session.setAttribute("user", user);
            } catch (ClassNotFoundException | IOException | SQLException | SecurityException ex) {
                session.setAttribute("error", ex.getMessage());
            }

            response.sendRedirect(request.getContextPath() + "/");
		}
		
		
		
	}

}
