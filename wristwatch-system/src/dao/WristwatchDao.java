package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Request;

import model.User;
import model.Wristwatch;

public class WristwatchDao extends DAO<Wristwatch>{

    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.wristwatch"
    + "(name, price, qtd_plots, plots_price, brand_name, salesman_name)"
    + "VALUES (?,?,?,?,?,?) RETURNING id";
    
    
    private static final String READ_QUERY
    = "SELECT id, name, price, qtd_plots, plots_price, brand_name, salesman_name "
    + "FROM wristwatch.wristwatch "
    + "WHERE id = ?;";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.wristwatch "
    + "SET name = ?, price = ?, qtd_plots = ?, plots_price = ?, brand_name = ?, salesman_name = ?"
    + "WHERE id = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.wristwatch "
    + "WHERE id = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT id, name, price, qtd_plots, plots_price, brand_name, salesman_name "
    + "FROM wristwatch.wristwatch "
    + "ORDER BY name;";
	
	
	WristwatchDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Wristwatch element) throws SQLException {
		
        try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setString(1, element.getName());
            statement.setFloat(2, element.getPrice());
            statement.setInt(3, element.getQtdPlots());
            statement.setFloat(4, element.getPlotPrice());
            statement.setString(5, element.getBrand_name());
            statement.setString(6, element.getSalesman_name());

            try (ResultSet result = statement.executeQuery();) {
                if (result.next()) {
                    element.setId(result.getInt("id"));
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().contains("uq_usuario_login")) {
                throw new SQLException("Erro ao inserir usuário: login já existente.");
            } else if (ex.getMessage().contains("not-null")) {
                throw new SQLException("Erro ao inserir usuário: pelo menos um campo está em branco.");
            } else {
                throw new SQLException("Erro ao inserir usuário.");
            }
        }
        
	}

	@Override
	public Wristwatch read(Wristwatch element) throws SQLException {
		Wristwatch wristwatch = new Wristwatch();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setInt(1, element.getId());
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	wristwatch.setId(element.getId());
                	wristwatch.setName(result.getString("name"));
                	wristwatch.setPrice(result.getFloat("price"));
                	wristwatch.setQtdPlots(result.getInt("qtd_plots"));
                	wristwatch.setPlotPrice(result.getFloat("plots_price"));
                	wristwatch.setBrand_name(result.getString("brand_name"));
                	wristwatch.setSalesman_name(result.getString("salesman_name"));
                } else {
                    throw new SQLException("Erro ao visualizar: relógio não encontrado.");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().equals("Erro ao visualizar: relógio não encontrado.")) {
                throw ex;
            } else {
                throw new SQLException("Erro ao visualizar relógio.");
            }
        }

        return wristwatch;
	}

	@Override
	public void update(Wristwatch element) throws SQLException {

        try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setString(1, element.getName());
            statement.setFloat(2, element.getPrice());
            statement.setInt(3, element.getQtdPlots());
            statement.setFloat(4, element.getPlotPrice());
            statement.setString(5, element.getBrand_name());
            statement.setString(6, element.getSalesman_name());
            statement.setInt(7, element.getId());
            
            
            if (statement.executeUpdate() < 1) {
                throw new SQLException("Erro ao editar: relógio não encontrado.");
            }
            
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().equals("Erro ao editar: relógio não encontrado.")) {
                throw ex;
            } else if (ex.getMessage().contains("uq_usuario_login")) {
                throw new SQLException("Erro ao editar usuário: login já existente.");
            } else if (ex.getMessage().contains("not-null")) {
                throw new SQLException("Erro ao editar relógio: pelo menos um campo está em branco.");
            } else {
                throw new SQLException("Erro ao editar relógio.");
            }
        }
		
	}

	@Override
	public void delete(Wristwatch element) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setInt(1, element.getId());

	            if (statement.executeUpdate() < 1) {
	                throw new SQLException("Erro ao excluir: relógio não encontrado.");
	            }
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());

	            if (ex.getMessage().equals("Erro ao excluir: relógio não encontrado.")) {
	                throw ex;
	            } else {
	                throw new SQLException("Erro ao excluir relógio.");
	            }
	        }
		
	}

	@Override
	public List<Wristwatch> all() throws SQLException {
        List<Wristwatch> wristwatchList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
                ResultSet result = statement.executeQuery()) {
            while (result.next()) {
            	Wristwatch wristwatch = new Wristwatch();
            	
            	wristwatch.setId(result.getInt("id"));
            	wristwatch.setName(result.getString("name"));
            	wristwatch.setPrice(result.getFloat("price"));
            	wristwatch.setQtdPlots(result.getInt("qtd_plots"));
            	wristwatch.setPlotPrice(result.getFloat("plots_price"));
            	wristwatch.setBrand_name(result.getString("brand_name"));
            	wristwatch.setSalesman_name(result.getString("salesman_name"));
                wristwatchList.add(wristwatch);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao listar relógios.");
        }

        return wristwatchList;
	}

	

}
