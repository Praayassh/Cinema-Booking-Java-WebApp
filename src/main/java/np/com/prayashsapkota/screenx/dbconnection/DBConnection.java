package np.com.prayashsapkota.screenx.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	// Connecting to DB

	public static Connection getConnection() {
		Connection con = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/screenx", "root", "root"); // CHANGE THE INFORMATION ACCORDING TO YOUR DB

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return con;
	}
}