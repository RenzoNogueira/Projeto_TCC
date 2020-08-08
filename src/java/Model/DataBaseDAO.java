package Model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Renzo
 */
public class DataBaseDAO {

    public final String URL = "jdbc:mysql://localhost:3306/auton_db";
    public final String USER = "root";
    public final String PASSWORD = "";
    public Connection connection;

    /**
     *
     * @throws Exception
     * @author Renzo Nogueira.
     */
    public DataBaseDAO() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
    }

    /**
     *
     * @throws Exception
     * @author Renzo Nogueira.
     *
     * Conecta ao banco de dados.
     */
    public void connect() throws Exception {
        connection = DriverManager.getConnection(URL, USER, PASSWORD);
    }

    /**
     *
     * @throws Exception
     * @author Renzo Nogueira.
     *
     * Disconeta do banco de dados.
     */
    public void disconnect() throws Exception {
        connection.close();
    }
}
