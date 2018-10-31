package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Collection;
import model.Collection;
import model.Collection;;

public class CollectionDao extends DAO<Collection> {

    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.collection"
    + "(name, brand_name)"
    + "VALUES (?,?) RETURNING name";
    
    
    private static final String READ_QUERY
    = "SELECT name, brand_name "
    + "FROM wristwatch.collection "
    + "WHERE name = ? AND brand_name = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.collection "
    + "SET name = ?, brand_name = ? "
    + "WHERE name = ? AND brand_name = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.collection "
    + "WHERE name = ? AND brand_name = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT name, brand_name "
    + "FROM wristwatch.collection "
    + "ORDER BY name;";
	
	
	CollectionDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Collection element) throws SQLException {
		try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setString(1, element.getName());
            statement.setString(2, element.getBrand_name());

            try (ResultSet result = statement.executeQuery();) {
                if (result.next()) {
                    element.setName(result.getString("name"));
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
	public Collection read(Collection element) throws SQLException {
		Collection collection = new Collection();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setString(1, element.getName());
            statement.setString(2, element.getBrand_name());
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	collection.setName(result.getString("name"));
                	collection.setBrand_name(result.getString("brand_name"));
                } else {
                	throw new SQLException("Erro");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            throw new SQLException("Erro");
        }

        return collection;
	}

	@Override
	public void update(Collection element) throws SQLException {
	      try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
	            statement.setString(1, element.getName());
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
	public void delete(Collection element) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setString(1, element.getName());
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
	public List<Collection> all() throws SQLException {
	       List<Collection> collectionList = new ArrayList<>();

	        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
	                ResultSet result = statement.executeQuery()) {
	            while (result.next()) {
	            	Collection collection = new Collection();
	            	
	            	collection.setName(result.getString("name"));
	            	collection.setBrand_name(result.getString("brand_name"));

	                collectionList.add(collection);
	            }
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());

	            throw new SQLException("Erro");
	        }

	        return collectionList;
	}
	public ResultSet select(String query) throws SQLException {
		  ResultSet result;
	    try (PreparedStatement statement = connection.prepareStatement(query)) {
          result = statement.executeQuery();

	    } catch (SQLException ex) {
	        System.err.println(ex.getMessage());
	
	        if (ex.getMessage().equals("Erro ao consultar banco de dados")) {
	    throw ex;
		} else {
		    throw new SQLException("Erro ao consultar banco de dados");
		    }
		}
	    
	    return result;
	}
	
}
