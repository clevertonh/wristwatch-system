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
    + "(id, name,  qtdProducts, qtdBrands)"
    + "VALUES (?,?,?,?) RETURNING id";
    
    
    private static final String READ_QUERY
    = "SELECT id, name, qtdProducts, qtdBrands "
    + "FROM wristwatch.salesman "
    + "WHERE id = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.salesman "
    + "SET name = ?, qtdProducts = ?, qtdBrands = ? "
    + "WHERE id = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.salesman "
    + "WHERE id = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT id, name, qtdProducts, qtdBrands "
    + "FROM wristwatch.salesman "
    + "ORDER BY email;";
    
    
	SalesmanDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Salesman element) throws SQLException {
		
        try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setInt(1, element.getId());
            statement.setString(2, element.getName());
            statement.setInt(3, element.getQtdProducts());
            statement.setInt(4, element.getQtdBrands());


            try (ResultSet result = statement.executeQuery();) {
                if (result.next()) {
                    element.setId(result.getInt("id"));
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
	public Salesman read(Integer id) throws SQLException {
		Salesman salesman = new Salesman();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	salesman.setId(id);
                	salesman.setName(result.getString("name"));
                	salesman.setQtdProducts(result.getInt("qtdProducts"));
                	salesman.setQtdBrands(result.getInt("qtdBrands"));
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
	            statement.setString(1, element.getName());
	            statement.setInt(2, element.getQtdProducts());
	            statement.setInt(3, element.getQtdBrands());
	            statement.setInt(4, element.getId());
	            
	            
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
	public void delete(Integer id) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setInt(1, id);

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
        List<Salesman> salesman = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
                ResultSet result = statement.executeQuery()) {
            while (result.next()) {
            	Salesman wristwatch = new Salesman();
            	
            	wristwatch.setId(result.getInt("id"));
            	wristwatch.setName(result.getString("name"));
            	wristwatch.setQtdProducts(result.getInt("qtdProducts"));
            	wristwatch.setQtdBrands(result.getInt("qtdBrands"));


                salesman.add(wristwatch);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao listar vendedor.");
        }

        return salesman;
	}

}
