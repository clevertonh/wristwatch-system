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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.*;


import dao.DAOFactory;
import dao.PurchaseDao;
import dao.SaleDao;
import dao.SalesmanDao;
import dao.WristwatchDao;
import dao.BrandDao;
import dao.CollectionDao;
import model.Brand;
import model.Collection;
import model.Purchase;
import model.Sale;
import model.Salesman;
import model.Wristwatch;

/**
 * Servlet implementation class JsonController
 */
@WebServlet(name = "JsonController" , urlPatterns = {
		"/wristwatch-json/insert",
		"/salesman-json/insert",
		"/brand-json/insert",
		"/collection-json/insert",
		"/sale-json/insert",
		"/purchase-json/insert"
		}
)
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
		HttpSession session = request.getSession(true);
		
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
        
		switch(request.getServletPath()) {
		case "/wristwatch-json/insert":
   
		    try (DAOFactory daoFactory = new DAOFactory()) {
				WristwatchDao dao;
                dao = daoFactory.getWristwatchDao();
                
    			JSONArray json;
    			json = new JSONArray(jsonString);
    			JSONObject jsonAux = new JSONObject();
                
				int i=0;
				String plotPrice;
				
				while(i < json.length()) {
					Wristwatch w = new Wristwatch();
					jsonAux = json.getJSONObject(i);
					
					w.setName(jsonAux.getString("nome"));
					w.setPrice(Double.parseDouble(jsonAux.getString("preco").replace("R$", "")));
					w.setCollection_name(jsonAux.getString("colecao"));
					w.setBrand_name(jsonAux.getString("marca"));
					
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
					
		
					w.setPlotPrice(Double.parseDouble(plotPrice));
					
			        dao.create(w);
			     
					i++;
				}
			} catch (JSONException | ClassNotFoundException | IOException | SQLException ex) {
				session.setAttribute("error", ex.getMessage());
			}

		    response.sendRedirect(request.getContextPath() + "/view/create-wristwatch-json.jsp");
			break;
			
		case "/salesman-json/insert":
	        
		    try (DAOFactory daoFactory = new DAOFactory()) {
				SalesmanDao dao;
                dao = daoFactory.getSalesmanDao();
                
    			JSONArray json;
    			json = new JSONArray(jsonString);
    			JSONObject jsonAux = new JSONObject();
                
				int i=0;
				
				while(i < json.length()) {
					Salesman s = new Salesman();
					
					jsonAux = json.getJSONObject(i);
					
					s.setName(jsonAux.getString("nome"));
				
			        dao.create(s);
			     
					i++;
				}
			} catch (JSONException | ClassNotFoundException | IOException | SQLException ex) {
				session.setAttribute("error", ex.getMessage());
			}

			
	        response.sendRedirect(request.getContextPath() + "/view/create-salesman-json.jsp");
			break;
		case "/brand-json/insert":
			
		    try (DAOFactory daoFactory = new DAOFactory()) {
				BrandDao dao;
                dao = daoFactory.getBrandDao();
                
    			JSONArray json;
    			json = new JSONArray(jsonString);
    			JSONObject jsonAux = new JSONObject();
                
				int i=0;
				
				while(i < json.length()) {
					Brand b = new Brand();
					
					jsonAux = json.getJSONObject(i);
					
					b.setName(jsonAux.getString("nome"));
					b.setCountry(jsonAux.getString("country"));
					b.setCreation(jsonAux.getString("creation"));
					
			        dao.create(b);
			     
					i++;
				}
			} catch (JSONException | ClassNotFoundException | IOException | SQLException ex) {
				session.setAttribute("error", ex.getMessage());
			}
			
			response.sendRedirect(request.getContextPath() + "/view/create-brand-json.jsp");
			break;
		case "/collection-json/insert":
		    try (DAOFactory daoFactory = new DAOFactory()) {
				CollectionDao dao;
                dao = daoFactory.getCollectionDao();
                
    			JSONArray json;
    			json = new JSONArray(jsonString);
    			JSONObject jsonAux = new JSONObject();
                
				int i=0;
				
				while(i < json.length()) {
					Collection c = new Collection();
					
					jsonAux = json.getJSONObject(i);
					
					c.setName(jsonAux.getString("nome"));
					c.setBrand_name(jsonAux.getString("marca"));
					
			        dao.create(c);
			     
					i++;
				}
			} catch (JSONException | ClassNotFoundException | IOException | SQLException ex) {
				session.setAttribute("error", ex.getMessage());
			}
			
			response.sendRedirect(request.getContextPath() + "/view/create-collection-json.jsp");
			break;
		case "/sale-json/insert":
		    try (DAOFactory daoFactory = new DAOFactory()) {
				SaleDao dao;
                dao = daoFactory.getSaleDao();
                
    			JSONArray json;
    			json = new JSONArray(jsonString);
    			JSONObject jsonAux = new JSONObject();
                
				int i=0;
				
				while(i < json.length()) {
					Sale s = new Sale();
					
					jsonAux = json.getJSONObject(i);
					
					s.setId_wristwatch(jsonAux.getInt("id"));
					s.setSalesman_name(jsonAux.getString("vendedor"));
					
			        dao.create(s);
			     
					i++;
				}
			} catch (JSONException | ClassNotFoundException | IOException | SQLException ex) {
				session.setAttribute("error", ex.getMessage());
			}
			
			response.sendRedirect(request.getContextPath() + "/view/create-sale-json.jsp");
			break;
		case "/purchase-json/insert":
		    try (DAOFactory daoFactory = new DAOFactory()) {
				PurchaseDao dao;
                dao = daoFactory.getPurchaseDao();
                
    			JSONArray json;
    			json = new JSONArray(jsonString);
    			JSONObject jsonAux = new JSONObject();
                
				int i=0;
				
				while(i < json.length()) {
					Purchase p = new Purchase();
					
					jsonAux = json.getJSONObject(i);
					
					p.setSalesman_name(jsonAux.getString("vendedor"));
					p.setBrand_name(jsonAux.getString("marca"));
					
			        dao.create(p);
			     
					i++;
				}
			} catch (JSONException | ClassNotFoundException | IOException | SQLException ex) {
				session.setAttribute("error", ex.getMessage());
			}
			
			response.sendRedirect(request.getContextPath() + "/view/create-purchase-json.jsp");
			break;
		}
		
	}

}
