package utility;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
 
import com.ibatis.common.jdbc.ScriptRunner;
//import org.apache.ibatis.jdbc.ScriptRunner;
 
/**
 * 
 @author Dhinakaran Pragasam
 */
public class RunSqlScript {
	/**
	 * @param args
	 *            the command line arguments
	 */
	/* public static void main(String[] args) throws ClassNotFoundException,
		SQLException {  */
	  public static void doImportTables(String sqlpath) throws ClassNotFoundException,
	                 SQLException {
	   
            String aSQLScriptFilePath = "E:/payonline/GenericPayment/public_html/WEB-INF/jhrpayonline.sql";
	    aSQLScriptFilePath=sqlpath;
		 //Create MySql Connection
		/*Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/jhr", "root", "jhr#123");  */
		 Class.forName(SystemGlobals.getDriver()) ;
		 Connection con = DriverManager.getConnection(SystemGlobals.getUrl(), SystemGlobals.getUsername(), SystemGlobals.getPassword());
                  
		Statement stmt = null;
 
		try {
			// Initialize object for ScripRunner
			ScriptRunner sr = new ScriptRunner(con, false, false);
 
			// Give the input file to Reader
			Reader reader = new BufferedReader(
                               new FileReader(aSQLScriptFilePath));
 
			// Exctute script
			sr.runScript(reader);
		     java.sql.Statement st = con.createStatement();
		      st.execute("CREATE FUNCTION initcap(x varchar(255)) RETURNS varchar(255) CHARSET latin1 return concat( upper(substring(x,1,1)),lower(substring(x,2)) );");
		                
		   
                        con.close();
 
		} catch (Exception e) {
			System.err.println("Failed to Execute" + aSQLScriptFilePath
					+ " The error is " + e.getMessage());
		}
	}
}
