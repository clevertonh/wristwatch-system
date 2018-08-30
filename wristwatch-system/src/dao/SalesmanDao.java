package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Salesman;
import model.Salesman;
import model.Salesman;

public class SalesmanDao extends DAO<Salesman>{

	
    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.salesman"
    + "(name,  qtd_products, qtd_brands)"
    + "VALUES (?,?,?) RETURNING name";
    
    
    private static final String READ_QUERY
    = "SELECT name, qtd_products, qtd_brands "
    + "FROM wristwatch.salesman "
    + "WHERE name = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.salesman "
    + "SET qtd_products = ?, qtd_brands = ? "
    + "WHERE name = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.salesman "
    + "WHERE name = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT name, qtd_products, qtd_brands "
    + "FROM wristwatch.salesman "
    + "ORDER BY name;";
    
    
	SalesmanDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Salesman element) throws SQLException {
		
        try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setString(1, element.getName());
            statement.setInt(2, element.getQtdProducts());
            statement.setInt(3, element.getQtdBrands());


            try (ResultSet result = statement.executeQuery();) {
                if (result.next()) {
                    element.setName(result.getString("name"));
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().contains("not-null")) {
                throw new SQLException("Erro ao inserir vendedor: pelo menos um campo está em branco.");
            } else {
                throw new SQLException("Erro ao inserir vendedor.");
            }
        }
		
	}

	@Override
	public Salesman read(Salesman element) throws SQLException {
		Salesman salesman = new Salesman();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setString(1, element.getName());
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	salesman.setName(result.getString("name"));
                	salesman.setQtdProducts(result.getInt("qtd_products"));
                	salesman.setQtdBrands(result.getInt("qtd_brands"));
                } else {
                    throw new SQLException("Erro ao visualizar: vendedor não encontrado.");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().equals("Erro ao visualizar: vendedor não encontrado.")) {
                throw ex;
            } else {
                throw new SQLException("Erro ao visualizar vendedor.");
            }
        }

        return salesman;
	}

	@Override
	public void update(Salesman element) throws SQLException {
		 try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
	            statement.setInt(1, element.getQtdProducts());
	            statement.setInt(2, element.getQtdBrands());
	            statement.setString(3, element.getName());
	            
	            if (statement.executeUpdate() < 1) {
	                throw new SQLException("Erro ao editar: vendedor não encontrado.");
	            }
	            
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());

	            if (ex.getMessage().equals("Erro ao editar: vendedor não encontrado.")) {
	                throw ex;
	            } else if (ex.getMessage().contains("not-null")) {
	                throw new SQLException("Erro ao editar vendedor: pelo menos um campo está em branco.");
	            } else {
	                throw new SQLException("Erro ao editar vendedor.");
	            }
	        }
		
	}

	@Override
	public void delete(Salesman element) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setString(1, element.getName());

	            if (statement.executeUpdate() < 1) {
	                throw new SQLException("Erro ao excluir: vendedor não encontrado.");
	            }
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());

	            if (ex.getMessage().equals("Erro ao excluir: vendedor não encontrado.")) {
	                throw ex;
	            } else {
	                throw new SQLException("Erro ao excluir vendedor.");
	            }
	        }
		
		
	}

	@Override
	public List<Salesman> all() throws SQLException {
        List<Salesman> salesmanList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
                ResultSet result = statement.executeQuery()) {
            while (result.next()) {
            	Salesman salesman = new Salesman();
            	
            	salesman.setName(result.getString("name"));
            	salesman.setQtdProducts(result.getInt("qtd_products"));
            	salesman.setQtdBrands(result.getInt("qtd_brands"));


                salesmanList.add(salesman);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao listar vendedor.");
        }

        return salesmanList;
	}

}
