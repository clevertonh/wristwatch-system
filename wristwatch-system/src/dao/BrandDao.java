package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Brand;
import model.Brand;

public class BrandDao extends DAO<Brand>{

	
    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.brand"
    + "(id, name, country)"
    + "VALUES (?,?,?) RETURNING id";
    
    
    private static final String READ_QUERY
    = "SELECT id, name, country "
    + "FROM wristwatch.brand "
    + "WHERE id = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.brand "
    + "SET name = ?, country = ? "
    + "WHERE id = ?;";
    

    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.brand "
    + "WHERE id = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT id, name, country "
    + "FROM wristwatch.brand "
    + "ORDER BY name;";
    
    
	BrandDao(Connection connection) {
		super(connection);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void create(Brand element) throws SQLException {
		try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setInt(1, element.getId());
            statement.setString(2, element.getName());
            statement.setString(3, element.getCountry());

            try (ResultSet result = statement.executeQuery();) {
                if (result.next()) {
                    element.setId(result.getInt("id"));
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().contains("uq_usuario_login")) {
                throw new SQLException("Erro ao inserir marca: login já existente.");
            } else if (ex.getMessage().contains("not-null")) {
                throw new SQLException("Erro ao inserir marca: pelo menos um campo está em branco.");
            } else {
                throw new SQLException("Erro ao inserir marca.");
            }
        }
		
	}

	@Override
	public Brand read(Integer id) throws SQLException {
		Brand brand = new Brand();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	brand.setId(id);
                	brand.setName(result.getString("name"));
                	brand.setCountry(result.getString("country"));
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

        return brand;
	}

	@Override
	public void update(Brand element) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setString(1, element.getName());
            statement.setString(2, element.getCountry());
            statement.setInt(3, element.getId());
            
            
            if (statement.executeUpdate() < 1) {
                throw new SQLException("Erro ao editar: marca não encontrado.");
            }
            
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().equals("Erro ao editar: marca não encontrado.")) {
                throw ex;
            } else if (ex.getMessage().contains("uq_usuario_login")) {
                throw new SQLException("Erro ao editar marca: login já existente.");
            } else if (ex.getMessage().contains("not-null")) {
                throw new SQLException("Erro ao editar marca: pelo menos um campo está em branco.");
            } else {
                throw new SQLException("Erro ao editar marca.");
            }
        }
		
	}

	@Override
	public void delete(Integer id) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setInt(1, id);

	            if (statement.executeUpdate() < 1) {
	                throw new SQLException("Erro ao excluir: marca não encontrado.");
	            }
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());

	            if (ex.getMessage().equals("Erro ao excluir: marca não encontrado.")) {
	                throw ex;
	            } else {
	                throw new SQLException("Erro ao excluir marca.");
	            }
	        }
		
	}

	@Override
	public List<Brand> all() throws SQLException {
        List<Brand> brandList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
                ResultSet result = statement.executeQuery()) {
            while (result.next()) {
            	Brand brand = new Brand();
            	
            	brand.setId(result.getInt("id"));
            	brand.setName(result.getString("name"));
            	brand.setCountry(result.getString("Country"));

                brandList.add(brand);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao listar marcas.");
        }

        return brandList;
	}

}
