package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;
import model.Wristwatch;

public class WristwatchDao extends DAO<Wristwatch>{

    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.wristwatch"
    + "(id, name, price, qtdPlots, plotPrice, link)"
    + "VALUES (?,?,?,?,?,?) RETURNING id";
    
    
    private static final String READ_QUERY
    = "SELECT id, name, price, qtdPlots, plotPrice, link "
    + "FROM wristwatch.wristwatch "
    + "WHERE id = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.wristwatch "
    + "SET name = ?, price = ?, qtdPlots = ?, plotPrice = ?, link = ? "
    + "WHERE id = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.wristwatch "
    + "WHERE id = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT id, name, price, qtdPlots, plotPrice, link "
    + "FROM wristwatch.wristwatch "
    + "ORDER BY email;";
	
	
	WristwatchDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Wristwatch element) throws SQLException {
		
        try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setInt(1, element.getId());
            statement.setString(2, element.getName());
            statement.setFloat(3, element.getPrice());
            statement.setInt(4, element.getQtdPlots());
            statement.setFloat(5, element.getPlotPrice());
            statement.setString(6, element.getLink());


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
	public Wristwatch read(Integer id) throws SQLException {
		Wristwatch wristwach = new Wristwatch();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	wristwach.setId(id);
                	wristwach.setName(result.getString("name"));
                	wristwach.setPrice(result.getFloat("price"));
                	wristwach.setQtdPlots(result.getInt("qtdPlots"));
                	wristwach.setPlotPrice(result.getFloat("plotPrice"));
                	wristwach.setLink(result.getString("link"));
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

        return wristwach;
	}

	@Override
	public void update(Wristwatch element) throws SQLException {

        try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setString(1, element.getName());
            statement.setFloat(2, element.getPrice());
            statement.setInt(3, element.getQtdPlots());
            statement.setFloat(4, element.getPlotPrice());
            statement.setString(5, element.getLink());
            statement.setInt(6, element.getId());
            
            
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
	public void delete(Integer id) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setInt(1, id);

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
            	wristwatch.setQtdPlots(result.getInt("qtdPlots"));
            	wristwatch.setPlotPrice(result.getFloat("plotPrice"));
            	wristwatch.setLink(result.getString("link"));

                wristwatchList.add(wristwatch);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao listar relógios.");
        }

        return wristwatchList;
	}

	

}
