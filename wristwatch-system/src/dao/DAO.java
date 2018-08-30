package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class DAO<T> {
	
	protected Connection connection;
    
    DAO(Connection connection) {
        this.connection = connection;
    }
    
    public abstract void create(T element) throws SQLException;
    public abstract T read(T element) throws SQLException;
    public abstract void update(T element) throws SQLException;
    public abstract void delete(T id) throws SQLException;

    public abstract List<T> all() throws SQLException;
	
}
