package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Purchase;
import model.Sale;

public class PurchaseDao extends DAO<Purchase>{

    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.purchase"
    + "(salesman_name, brand_name)"
    + "VALUES (?,?) RETURNING salesman_name";
    
    
    private static final String READ_QUERY
    = "SELECT salesman_name, brand_name "
    + "FROM wristwatch.purchase "
    + "WHERE salesman_name = ? AND brand_name = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.purchase "
    + "SET salesman_name = ?, brand_name = ? "
    + "WHERE salesman_name = ? AND brand_name = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.purchase "
    + "WHERE salesman_name = ? AND brand_name = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT salesman_name, brand_name "
    + "FROM wristwatch.purchase "
    + "ORDER BY salesman_name;";
	
	PurchaseDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Purchase element) throws SQLException {
		try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setString(1, element.getSalesman_name());
            statement.setString(2, element.getBrand_name());

            try (ResultSet result = statement.executeQuery();) {
                if (result.next()) {
                    element.setSalesman_name(result.getString("salesman_name"));
                }else {
                	throw new SQLException("Erro");
                }
            }
        } catch (SQLException ex) {
        	
            System.err.println(ex.getMessage());
            throw new SQLException("Erro");
        }
		
	}

	@Override
	public Purchase read(Purchase element) throws SQLException {
		Purchase purchase = new Purchase();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setString(1, element.getSalesman_name());
            statement.setString(2, element.getSalesman_name());
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	purchase.setSalesman_name(result.getString("salesman_name"));
                	purchase.setBrand_name(result.getString("brand_name"));
                } else {
                	throw new SQLException("Erro");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            throw new SQLException("Erro");
        }

        return purchase;
	}

	@Override
	public void update(Purchase element) throws SQLException {
		try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setString(1, element.getSalesman_name());
            statement.setString(2, element.getBrand_name());
            
            
            if (statement.executeUpdate() < 1) {
                throw new SQLException("Erro");
            }
            
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao editar marca.");

        }
		
	}

	@Override
	public void delete(Purchase element) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setString(1, element.getSalesman_name());
	            statement.setString(2, element.getBrand_name());
	            if (statement.executeUpdate() < 1) {
	                throw new SQLException("Erro");
	            }
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());
	            throw new SQLException("Erro");
	        }	
	}

	@Override
	public List<Purchase> all() throws SQLException {
		List<Purchase> purchaseList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
                ResultSet result = statement.executeQuery()) {
            while (result.next()) {
            	Purchase purchase = new Purchase();
            	
            	purchase.setSalesman_name(result.getString("salesman_name"));
            	purchase.setBrand_name(result.getString("brand_name"));

                purchaseList.add(purchase);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro");
        }

        return purchaseList;
	}

}
