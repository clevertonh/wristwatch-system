package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.*;


import dao.DAOFactory;
import dao.WristwatchDao;
import model.Wristwatch;

/**
 * Servlet implementation class JsonController
 */
@WebServlet(name = "JsonController" , urlPatterns = {"/json/insert"})
@MultipartConfig
public class JsonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		switch(request.getServletPath()) {
		case "/json/insert":
			String salesman = request.getParameter("salesman");
			String brand = "Desconhecido"; //Por enquanto ficará assim
		    Part filePart = request.getPart("json");
	        InputStream inputStream = filePart.getInputStream();
	        
	        StringBuilder stringBuilder = new StringBuilder();
	        String line = null;
	        
	        try(BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream))){
	        	while((line = bufferedReader.readLine()) != null) {
	        		stringBuilder.append(line);
	        	}
	        }
	        
	        
	        String jsonString = stringBuilder.toString();
	        
		    try (DAOFactory daoFactory = new DAOFactory()) {
				WristwatchDao dao;
                dao = daoFactory.getWristwatchDao();
                
                JSONArray json = new JSONArray(jsonString);
                JSONObject jsonAux = new JSONObject();
                
				int i=0;
				String plotPrice;
				
				while(i < json.length()) {
					Wristwatch w = new Wristwatch();
					jsonAux = json.getJSONObject(i);
					
					w.setName(jsonAux.getString("nome"));
					w.setPrice(jsonAux.getString("preco").replace("R$", ""));
					
					
					plotPrice = jsonAux.getString("parcelas");
					if(plotPrice.charAt(1) >= 0 && plotPrice.charAt(1) <= 9) {
						w.setQtdPlots(Integer.parseInt(plotPrice.substring(0, 2)));
						plotPrice = plotPrice.substring(2, plotPrice.length());
					}
					else
					{
						w.setQtdPlots(Integer.parseInt(plotPrice.substring(0, 1)));
						plotPrice = plotPrice.substring(1, plotPrice.length());
					}
					
					plotPrice = plotPrice.replaceAll("^[A-Za-z\\$\\s]+", "");
					plotPrice = plotPrice.replaceAll("sem juros", "");
					
		
					w.setPlotPrice(plotPrice);
					
					w.setSalesman_name(salesman);
					w.setBrand_name(brand);
					
			        dao.create(w);
			     
					i++;
				}
			} catch (JSONException | ClassNotFoundException | IOException | SQLException ex) {
				// TODO Auto-generated catch block
				System.out.println(ex.getMessage());
			}

		    response.sendRedirect(request.getContextPath() + "/view/create-json.jsp");
			break;
		}
		
	}

}
