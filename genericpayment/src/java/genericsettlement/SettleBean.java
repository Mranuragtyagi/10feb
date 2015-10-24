package genericsettlement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.Iterator;

public class SettleBean {
    private String transid;
    private String challan_No;
    private String treasury_code;
    private String cin;
    private Timestamp transdate;
    private double total1;
    private double total2;
    private String addInfo;
    private String pos6;
    private String pos7;
    private String pos8;
    private String flag;
    
    public SettleBean() {
                this.transid="";
                this.challan_No="";
                this.treasury_code="";
                this.cin="";
                this.total1=0.0;
                this.total2=0.0;
                this.addInfo="";
                this.pos6="";
                this.pos7="";
                this.pos8="";
                this.flag="N";
    }

    public void setTransid(String transid) {
        this.transid = transid;
    }

    public String getTransid() {
        return transid;
    }

    public void setChallan_No(String challan_No) {
        this.challan_No = challan_No;
    }

    public String getChallan_No() {
        return challan_No;
    }

    public void setTreasury_code(String treasury_code) {
        this.treasury_code = treasury_code;
    }

    public String getTreasury_code() {
        return treasury_code;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getCin() {
        return cin;
    }

    public void setTransdate(Timestamp transdate) {
        this.transdate = transdate;
    }

    public Timestamp getTransdate() {
        return transdate;
    }

    public void setTotal1(double total1) {
        this.total1 = total1;
    }

    public double getTotal1() {
        return total1;
    }

    public void setTotal2(double total2) {
        this.total2 = total2;
    }

    public double getTotal2() {
        return total2;
    }

    public void setAddInfo(String addInfo) {
        this.addInfo = addInfo;
    }

    public String getAddInfo() {
        return addInfo;
    }

    public void setPos6(String pos6) {
        this.pos6 = pos6;
    }

    public String getPos6() {
        return pos6;
    }

    public void setPos7(String pos7) {
        this.pos7 = pos7;
    }

    public String getPos7() {
        return pos7;
    }

    public void setPos8(String pos8) {
        this.pos8 = pos8;
    }

    public String getPos8() {
        return pos8;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getFlag() {
        return flag;
    }
    
    
    public int doInsertSettlement(java.sql.Connection con) throws Exception{
        PreparedStatement ps=null;
        int status=0;
        try{
         String sql="insert into generic_settlement (TRANSID,CHALLAN_NO,TREASURY_CODE,CIN,TRANSDATE,TOTAL1,TOTAL2,ADDINFO,POS6,POS7,POS8,FLAG) values (?,?,?,?,?,?,?,?,?,?,?,?)";   
         ps=con.prepareStatement(sql); 
         ps.setString(1,this.transid);
         ps.setString(2,this.challan_No);
         ps.setString(3,this.treasury_code);
         ps.setString(4,this.cin);
         ps.setTimestamp(5,this.transdate);
         ps.setDouble(6,this.total1);
         ps.setDouble(7,this.total2);
         ps.setString(8,this.addInfo);
         ps.setString(9,this.pos6);
         ps.setString(10,this.pos7);
         ps.setString(11,this.pos8);
         ps.setString(12,"N");
         status=ps.executeUpdate();
         
        }catch(SQLException sqe){
           throw new SQLException("Data already exists.");  
         }catch(Exception e){
            throw e; 
         }finally{
          ps.close();   
         }
            return status;
    }
    
    
    public ArrayList<SettleBean> doSelectSettlementListByPeriod(java.sql.Connection con,java.sql.Date date) throws Exception{
        PreparedStatement ps=null;
        ResultSet rs=null;
        
        try{
        String sql="select generic_settlement.CHALLAN_NO,generic_settlement.TRANSID,generic_settlement.TRANSDATE,generic_settlement.CIN,generic_settlement.TREASURY_CODE,generic_settlement.TOTAL1  from generic_settlement generic_settlement where generic_settlement.flag='N' AND trunc(generic_settlement.transdate)=? AND generic_settlement.challan_no IN (select challan_no from generic_epayment where generic_epayment.status<>'0300' or status is null)";
        ps=con.prepareStatement(sql);
        ps.setDate(1,date);
         ArrayList<SettleBean> list=new ArrayList<SettleBean>();
        rs=ps.executeQuery();
        while(rs.next()){
            SettleBean  settlementbean=new SettleBean();
            settlementbean.setChallan_No(rs.getString("CHALLAN_NO"));
            settlementbean.setTransid(rs.getString("TRANSID"));
            settlementbean.setTransdate(rs.getTimestamp("TRANSDATE"));
            settlementbean.setCin(rs.getString("CIN"));
            settlementbean.setTreasury_code(rs.getString("TREASURY_CODE"));
            settlementbean.setTotal1(rs.getDouble("TOTAL1"));
            list.add(settlementbean);
        }
        
        return list;
        }catch(SQLException sqe){
                    System.out.println(sqe.getMessage());
                    throw new SQLException(sqe.getMessage());
               }
         catch(Exception e){
                    System.out.println(e.getMessage());
                    throw new SQLException(e.getMessage());
                }
         finally{
                   rs.close();
                   ps.close();  
                }
                
    }
    
    
    
    
    public int doInsertForcedSettlement(java.sql.Connection con,ArrayList<SettleBean> settlementlist){
        PreparedStatement ps=null;
        ResultSet rs=null;
        int flag=1;
       // Echallan ecl=new Echallan();
        Iterator settlementItr =settlementlist.iterator();
        while(settlementItr.hasNext()) {
            SettleBean settle=(SettleBean)settlementItr.next();
            try{
                  String sql="update generic_epayment set status='0300',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?,cin=? where challan_no='"+settle.getChallan_No()+"' " ;
                  ps=con.prepareStatement(sql);
                  ps.setTimestamp(1,settle.getTransdate());
                  ps.setString(2,settle.getTransid());
                  ps.setString(3,"ForcedSettle");
                  ps.setString(4,settle.getTransid().substring(1,4));
                  ps.setString(5,settle.getCin());
                  ps.executeUpdate();
                  ps.close();
               }catch(Exception e){
               flag=0;
               System.out.println(e.getMessage());
             }

           try{
            boolean flg=true;
                if(flg){
                
                    String sql1="update generic_epayment set flag='S' where challan_no='"+settle.getChallan_No()+"' ";
                    System.out.println(sql1);
                    PreparedStatement ps1=con.prepareStatement(sql1);
                 
                    ps1.executeUpdate();
                    ps1.close();
                    //updating the echallan_settlement status.
                    String sql2="update generic_settlement set flag='Y' where challan_no='"+settle.getChallan_No()+"' ";
                    PreparedStatement ps2=con.prepareStatement(sql2);
                    ps2.executeUpdate();
                    ps2.close();
                    
                }
            }
            catch(Exception e){
             flag=0;
             System.out.println(e.getMessage());
             }
        }
        
        return flag;
        
    }


    /**
     * @param con
     * @return
     * @throws Exception
     */
    public ArrayList<SettleBean> doSelectAllSettlementList(java.sql.Connection con) throws Exception{
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            String sql="select generic_settlement.CHALLAN_NO,generic_settlement.TRANSID,generic_settlement.TRANSDATE,generic_settlement.CIN,generic_settlement.TREASURY_CODE,generic_settlement.TOTAL1  from generic_settlement where generic_settlement.flag='N' AND generic_settlement.challan_no IN (select CHALLAN_NO from generic_epayment where generic_epayment.status<>'0300')";
          // String sql="select generic_settlement.CHALLAN_NO,generic_settlement.TRANSID,generic_settlement.TRANSDATE,generic_settlement.CIN,generic_settlement.TREASURY_CODE,generic_settlement.TOTAL1  from generic_settlement where generic_settlement.flag='N' AND generic_settlement.challan_no NOT IN (select DEPT_TRANSACTION_ID from scroll)";
            ps=con.prepareStatement(sql);
            ArrayList<SettleBean> list=new ArrayList<SettleBean>();
            rs=ps.executeQuery();
            while(rs.next()){
                SettleBean  settlementbean=new SettleBean();
                settlementbean.setChallan_No(rs.getString("CHALLAN_NO"));
                settlementbean.setTransid(rs.getString("TRANSID"));
                settlementbean.setTransdate(rs.getTimestamp("TRANSDATE"));
                settlementbean.setCin(rs.getString("CIN"));
                settlementbean.setTreasury_code(rs.getString("TREASURY_CODE"));
                settlementbean.setTotal1(rs.getDouble("TOTAL1"));
                list.add(settlementbean);
            }
            
            return list;
            
        }catch(SQLException sqe){
                    System.out.println(sqe.getMessage());
                    throw new SQLException(sqe.getMessage());
               }
         catch(Exception e){
                    System.out.println(e.getMessage());
                    throw new SQLException(e.getMessage());
                }
         finally{
                   rs.close();
                   ps.close();  
                }

    }
}
