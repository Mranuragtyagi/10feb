/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author NIC
 */
public class TestingClass {
    public static void main(String[] args) throws  Exception, SQLException, IOException {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
                vicclass.User u=new vicclass.User();
               // u.createConnection();
                connection = MyDataSource.getInstance().getConnection();
                
           // connection = u.getConnection();
           // connection.close();
               MyDataSource.getInstance().printStatus();
               connection.close();
               MyDataSource.getInstance().printStatus();
                 connection = MyDataSource.getInstance().getConnection();
                   MyDataSource.getInstance().printStatus();
              //Thread.sleep(62000);
             // connection = MyDataSource.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select * from states");
             while (resultSet.next()) {
                 System.out.println("states: " + resultSet.getString("state_name"));
                
             }
             
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
        }

    }
}
