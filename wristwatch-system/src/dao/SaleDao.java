package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;


import model.Sale;
import model.Wristwatch;
import model.Sale;
import model.Sale;

public class SaleDao extends DAO<Sale>{

    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.sale"
    + "(id_wristwatch, salesman_name)"
    + "VALUES (?,?) RETURNING id_wristwatch";
    
    
    private static final String READ_QUERY
    = "SELECT id_wristwatch, salesman_name "
    + "FROM wristwatch.sale "
    + "WHERE id_wristwatch = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.sale "
    + "SET id_wristwatch = ?, salesman_name = ? "
    + "WHERE id_wristwatch = ? AND salesman_name = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.sale "
    + "WHERE id_wristwatch = ? AND salesman_name = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT id_wristwatch, salesman_name "
    + "FROM wristwatch.sale "
    + "ORDER BY id_wristwatch;";
	
	SaleDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Sale element) throws SQLException {
		try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setInt(1, element.getId_wristwatch());
            statement.setString(2, element.getSalesman_name());

            try (ResultSet result = statement.executeQuery();) {
                if (result.next()) {
                    element.setId_wristwatch(result.getInt("id_wristwatch"));
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
	public Sale read(Sale element) throws SQLException {
		Sale sale = new Sale();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setInt(1, element.getId_wristwatch());
            statement.setString(2, element.getSalesman_name());
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	sale.setId_wristwatch(result.getInt("id_wristwatch"));
                	sale.setSalesman_name(result.getString("salesman_name"));
                } else {
                	throw new SQLException("Erro");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            throw new SQLException("Erro");
        }

        return sale;
	}

	@Override
	public void update(Sale element) throws SQLException {
		try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setInt(1, element.getId_wristwatch());
            statement.setString(2, element.getSalesman_name());
            
            
            if (statement.executeUpdate() < 1) {
                throw new SQLException("Erro");
            }
            
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao editar marca.");

        }
	}

	@Override
	public void delete(Sale element) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setInt(1, element.getId_wristwatch());
	            statement.setString(2, element.getSalesman_name());
	            if (statement.executeUpdate() < 1) {
	                throw new SQLException("Erro");
	            }
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());
	            throw new SQLException("Erro");
	        }	
		
	}

	@Override
	public List<Sale> all() throws SQLException {
		List<Sale> saleList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
                ResultSet result = statement.executeQuery()) {
            while (result.next()) {
            	Sale sale = new Sale();
            	
            	sale.setId_wristwatch(result.getInt("id_wristwatch"));
            	sale.setSalesman_name(result.getString("salesman_name"));

                saleList.add(sale);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro");
        }

        return saleList;
	}
	
	public CachedRowSet select(String query) throws SQLException {
		  
		  CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
		  
	    try (PreparedStatement statement = connection.prepareStatement(query)) {
	    	ResultSet result = statement.executeQuery();
	    	crs.populate(result);
	    	
	    } catch (SQLException ex) {
	        System.err.println(ex.getMessage());
	
	        if (ex.getMessage().equals("Erro ao consultar banco de dados")) {
	    throw ex;
		} else {
		    throw new SQLException("Erro ao consultar banco de dados");
		    }
		}
	    
	    return crs;
	}

}
