/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

/**
 *
 * @author NIC
 */
 

 
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import utility.SystemGlobals;

public class MyDataSource {

    private static MyDataSource     datasource;
    private BasicDataSource ds;

    private MyDataSource() throws IOException, SQLException, Exception {
        ds = new BasicDataSource();
        
      /*   ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUsername("root");
        ds.setPassword("");
      ds.setUrl("jdbc:mysql://localhost:3306/jhrpayonline");
      */  
        
        ds.setDriverClassName(SystemGlobals.getDriver());
        ds.setUsername(SystemGlobals.getUsername());
        ds.setPassword(SystemGlobals.getPassword());
        ds.setUrl(SystemGlobals.getUrl());
        
       System.out.println("INSIDE MYDATASOURCE "+SystemGlobals.getUrl());
     // the settings below are optional -- dbcp can work with defaults
        ds.setMaxActive(SystemGlobals.getMaxActive()); //user input for number of pooled connections
        ds.setMinIdle(SystemGlobals.getMaxIdle());
        ds.setMaxIdle(100);//user input for number of pooled connections
        ds.setMaxWait(10000);//ds.getConnection will timeout and throw exception after 10 sec
        ds.setMaxOpenPreparedStatements(180);
        ///connections that have not been used in more than one hour may be closed
        ds.setRemoveAbandoned(true);
        ds.setRemoveAbandonedTimeout(10*60);   ///connections that have not been used in more than 10 minutes may be closed
     // ds.setRemoveAbandonedTimeout(60*60);
    //  ds.setLogAbandoned(true);

    }

    public static MyDataSource getInstance() throws IOException, SQLException, Exception {
        if (datasource == null) {
            datasource = new MyDataSource();
            return datasource;
        } else {
            return datasource;
        }
    }

    public Connection getConnection() {
            Connection c=null;
     try{
           c=this.ds.getConnection();
          
     }catch(Exception e){
         System.out.println(e.getMessage());
     }
          return c;
    }
  public   void printStatus() throws Exception{
      BasicDataSource bds = (BasicDataSource) this.ds;
       System.out.println("max: " + bds.getMaxActive());
         System.out.println("NumActive: " + bds.getNumActive());
         System.out.println("NumIdle: " + bds.getNumIdle());
  }
}