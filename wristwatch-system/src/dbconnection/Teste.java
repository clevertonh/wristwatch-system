package dbconnection;

import java.io.IOException;
import java.sql.SQLException;

public class Teste {

	public static void main(String[] args) {
		
		ConnectionFactory cf = ConnectionFactory.getInstance();
		try {
			cf.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Fim");
	}

}
