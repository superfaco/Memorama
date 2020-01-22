/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nent.utils;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author facoj
 */
public final class Server {

    private final String host;
    private final String port;
    private final String db;
    private final String user;
    private final String pass;

    private static Server instance;

    private Server() throws Exception {
        try {
            DriverManager.registerDriver(new Driver());
        } catch (SQLException e) {
            throw e;
        }
        host = "localhost";
        port = "3306";
        db = "memgame";
        user = "root";
        pass = "";
    }

    public static final Server getInstance() throws Exception {
        if (instance == null) {
            instance = new Server();
        }
        return instance;
    }

    public final Connection getConnection() throws Exception {
        Connection conn = null;
        try {
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/" + db, user, pass);
        } catch (Exception e) {
            throw e;
        }
        return conn;
    }

    @Override
    public final Object clone() throws CloneNotSupportedException {
        super.clone();
        throw new CloneNotSupportedException();
    }

}
