package vicclass;

import java.sql.*;
import utility.SystemGlobals;
public class User{
    private Connection conn;

    public User(){        
        conn = null;
    }

    public void setConn(Connection co) {
        this.conn = co;
    }
    
    public void createConnection(){ 
        
         
            try{
            Class.forName("com.mysql.jdbc.Driver");            
            this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhrpayonline", "root", "");  //local
            System.out.println("Connection done");
        } catch (SQLException sqe) {
            System.out.println("Connection not established " + sqe.getMessage());
        } catch (Exception e) {
            System.out.println("Connection not established " + e.getMessage());
        } 
           
       /*    
        
         try{
             System.out.println("create connection");
            this.conn=utility.MyDataSource.getInstance().getConnection();
           }catch(Exception ee){ee.printStackTrace();}
          
           
            
            
             try{
            Class.forName(SystemGlobals.getDriver()) ;
            conn = DriverManager.getConnection(SystemGlobals.getUrl(), SystemGlobals.getUsername(), SystemGlobals.getPassword());
        }catch(ClassNotFoundException e){
            System.out.println("Error: "+e.getMessage());
        }catch(SQLException e){
            System.out.println("app "+e.getMessage());
            // throw new SQLException();
        }catch(Exception e){
            System.out.println("app "+e.getMessage());
        }
           
           

            
           try{
            Class.forName("com.mysql.jdbc.Driver");            
            this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhrpayonline", "root", "");  //local
            System.out.println("Connection done");
        } catch (SQLException sqe) {
            System.out.println("Connection not established " + sqe.getMessage());
        } catch (Exception e) {
            System.out.println("Connection not established " + e.getMessage());
        } 
         
                    */
        
    }

    public Connection getConnection() {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select sysdate()");
            rs.close();
            st.close();
            this.conn.setAutoCommit(true);
        } catch (Exception e){
            System.out.println("error in get connection : "+e.getMessage());
            this.createConnection();
        }
        return this.conn;
    }

    public void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("error in closing connection : " +e.getMessage());
        }
    }
    
    public void endConnection() {
        {
            try {
                conn.close();
                System.out.println("Connection is closed now " + conn);
            } catch (Exception e) {
                System.out.println(" error at closing " + e.getMessage());
            }
        }
    }
}
