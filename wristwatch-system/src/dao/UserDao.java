package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDao extends DAO<User>{
	
    private static final String CREATE_QUERY
    = "INSERT INTO wristwatch.user"
    + "(id, email, password, name, avatar)"
    + "VALUES (?,md5(?),?,?,?) RETURNING id";
    
    
    private static final String READ_QUERY
    = "SELECT id, email, password, name, avatar "
    + "FROM wristwatch.user "
    + "WHERE id = ?";

    
    private static final String UPDATE_QUERY
    = "UPDATE wristwatch.user "
    + "SET email = ?, avatar = ?, name = ? "
    + "WHERE id = ?;";
    
    private static final String UPDATE_WITH_PASSWORD_QUERY
    = "UPDATE wristwatch.user "
    + "SET email = ?, avatar = ?, name = ?,  password = md5(?) "
    + "WHERE id = ?;";
    
    
    private static final String DELETE_QUERY
    = "DELETE FROM wristwatch.user "
    + "WHERE id = ?;";
    
    
    private static final String ALL_QUERY
    = "SELECT id, name, email "
    + "FROM wristwatch.user "
    + "ORDER BY email;";
    
    
    private static final String AUTHENTICATE_QUERY
            = "SELECT id, email, password, name, avatar "
            + "FROM wristwatch.user "
            + "WHERE email = ? AND password = md5(?);";
    
	UserDao(Connection connection) {
		super(connection);
	}

	@Override
	public void create(User element) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(CREATE_QUERY);) {
            statement.setInt(1, element.getId());
            statement.setString(2, element.getEmail());
            statement.setString(3, element.getPassword());
            statement.setString(4, element.getName());
            statement.setString(5, element.getAvatar());

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
	public User read(Integer id) throws SQLException {
		User user = new User();

        try (PreparedStatement statement = connection.prepareStatement(READ_QUERY)) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                	user.setId(id);
                	user.setEmail(result.getString("email"));
                	user.setPassword(result.getString("password"));
                	user.setName(result.getString("name"));
                	user.setAvatar(result.getString("avatar"));
                } else {
                    throw new SQLException("Erro ao visualizar: usuário não encontrado.");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().equals("Erro ao visualizar: usuário não encontrado.")) {
                throw ex;
            } else {
                throw new SQLException("Erro ao visualizar usuário.");
            }
        }

        return user;
	}

	@Override
	public void update(User element) throws SQLException {
		String query;

        if (element.getPassword() == null) {
            query = UPDATE_QUERY;
        } else {
            query = UPDATE_WITH_PASSWORD_QUERY;
        }

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, element.getEmail());
            statement.setString(2, element.getAvatar());
            statement.setString(3, element.getName());
            
            if (element.getPassword() == null) {
                statement.setInt(4, element.getId());
            } else {
                statement.setString(4, element.getPassword());
                statement.setInt(5, element.getId());
            }

            
            if (statement.executeUpdate() < 1) {
                throw new SQLException("Erro ao editar: usuário não encontrado.");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            if (ex.getMessage().equals("Erro ao editar: usuário não encontrado.")) {
                throw ex;
            } else if (ex.getMessage().contains("uq_usuario_login")) {
                throw new SQLException("Erro ao editar usuário: login já existente.");
            } else if (ex.getMessage().contains("not-null")) {
                throw new SQLException("Erro ao editar usuário: pelo menos um campo está em branco.");
            } else {
                throw new SQLException("Erro ao editar usuário.");
            }
        }
		
	}

	@Override
	public void delete(Integer id) throws SQLException {
	       try (PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
	            statement.setInt(1, id);

	            if (statement.executeUpdate() < 1) {
	                throw new SQLException("Erro ao excluir: usuário não encontrado.");
	            }
	        } catch (SQLException ex) {
	            System.err.println(ex.getMessage());

	            if (ex.getMessage().equals("Erro ao excluir: usuário não encontrado.")) {
	                throw ex;
	            } else {
	                throw new SQLException("Erro ao excluir usuário.");
	            }
	        }
	}

	@Override
	public List<User> all() throws SQLException {
        List<User> userList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(ALL_QUERY);
                ResultSet result = statement.executeQuery()) {
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setName(result.getString("name"));
                user.setEmail(result.getString("email"));
                userList.add(user);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao listar usuários.");
        }

        return userList;
	}
	
	public void authenticate(User user) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(AUTHENTICATE_QUERY)) {
 
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());

            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    user.setId(new Integer(result.getInt("id")));
                    user.setName(result.getString("name"));
                    user.setAvatar(result.getString("avatar"));
                } else {
                    throw new SecurityException("Login ou senha incorretos.");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

            throw new SQLException("Erro ao autenticar usuário.");
        }
    }

}
