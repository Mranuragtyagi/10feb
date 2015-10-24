package genericepayment;


import exceptions.UnknownException;

import genericepayadmin.GenericAdminBean;

import java.security.MessageDigest;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import java.util.ArrayList;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import vicclas.MD5;

import vicclass.State;

public class GenericBean {
    private String departmentid;
    private String departmentname;
    private String treasuryhead;
    private String purpose;
    private String description;
    private String periodtype;
    private String remarks;
    private String dlrname;
    private String address;
    private String mobile;
    private String email;
    private java.sql.Date period_from;
    private java.sql.Date period_to;
    private String challanno;
    private String city;
    private String state;
    private String pincode;
    private String question;
    private String answer;
    private String password;
    private String repassword;
    private String finalyear;
    private String halfyear;
    private String quarter;
    private String month;
    private String fromdate;
    private String todate;
    private String registrationstatus ;
    private Date registratondate;
    private Date paymentdate;
    private String statecode;
    private String citycode;
    private String taxtype;
    private String excisetotal;
    private String miningtotal;
    private String comtaxtotal;
    public static int totalrecords;
    private String idproof ;
    private String idproofval ;
    private String majortax ;
    private String subtax;
    private double admit;
    private double asses;
    private double advn;
    private double interest;
    private double penalty;
    private double misc;
    private double amount;
    private double grandtotal;
    private String circle;
    private String cir_name;
    private String tinp;
    private String circlep;
    private String branchaddress;
    private String branchdistrict;
    private String branchstate;
    private String branchpincode;
     private String search;
     private String branchlocation;
      private String contnam;
    private String contissue;
     private String contmail;
     private String conmsg;
    public GenericBean() {
         contnam="" ;
        contissue="" ;
        contmail="" ;
        conmsg="";
        search="" ;
        branchaddress="" ;
        branchdistrict="" ;
        branchstate="";
        branchpincode="" ;
        circlep="";
        cir_name="";
        circle="" ;
        tinp="";
        subtax="" ;
        admit=0;
        asses=0;
        advn=0;
        interest=0;
        penalty=0;
        misc=0 ;
        majortax="" ;
        idproof="" ;
        idproofval="" ;
        excisetotal="";
        miningtotal="" ;
        comtaxtotal="" ;
        taxtype="" ;
        citycode="" ;
        statecode="" ;
        departmentid="" ;
        departmentname="" ;
        treasuryhead="" ;
        purpose="" ;
        description="" ;
        periodtype="" ;
        dlrname="" ;
        address="" ;
        mobile="" ;
        email="" ;
        amount=0.0 ;
        remarks="" ;
        period_from=null;
        period_to=null;
        challanno="" ;
        city="" ;
        state="" ;
        pincode="" ;
        question="" ;
        answer="" ;
        password="" ;
        repassword="" ;
        finalyear="" ;
        halfyear="" ;
        quarter="" ;
        month="" ;
        fromdate="" ;
        todate="" ;
        registrationstatus="" ;
        registratondate=null ;
        paymentdate=null ;
        branchlocation="" ;
       
    }
    public String getBranchlocation() {
        return branchlocation;
    }

 
    public void setBranchlocation(String branchlocation) {
        this.branchlocation = branchlocation;
    }
    public void setDepartmentid(String departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentid() {
        return departmentid;
    }
    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getDepartmentname() {
        return departmentname;
    }

        public void setCircle(String circle) {
            this.circle = circle;
        }

        public String getCircle() {
            return circle;
        }

        public void setCir_name(String cir_name) {
            this.cir_name = cir_name;
        }

        public String getCir_name() {
            return cir_name;
        }

        public void setTinp(String tinp) {
            this.tinp = tinp;
        }

        public String getTinp() {
            return tinp;
        }

        public void setCirclep(String circlep) {
            this.circlep = circlep;
        }

        public String getCirclep() {
            return circlep;
        }
    public void setTreasuryhead(String treasuryhead) {
        this.treasuryhead = treasuryhead;
    }

    public String getTreasuryhead() {
        return treasuryhead;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setPeriodtype(String periodtype) {
        this.periodtype = periodtype;
    }

    public String getPeriodtype() {
        return periodtype;
    }

    public void setDlrname(String dlrname) {
        this.dlrname = dlrname;
    }

    public String getDlrname() {
        return dlrname;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
    
    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getAmount() {
        return amount;
    }
    
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getRemarks() {
        return remarks;
    }
    
    public void setPeriod_from(Date period_from) {
        this.period_from = period_from;
    }

    public Date getPeriod_from() {
        return period_from;
    }

    public void setPeriod_to(Date period_to) {
        this.period_to = period_to;
    }

    public Date getPeriod_to() {
        return period_to;
    }
    
    public void setChallanno(String challanno) {
        this.challanno = challanno;
    }

    public String getChallanno() {
        return challanno;
    }
    
    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getPincode() {
        return pincode;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getQuestion() {
        return question;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public String getRepassword() {
        return repassword;
    }
    
    public void setFinalyear(String finalyear) {
        this.finalyear = finalyear;
    }

    public String getFinalyear() {
        return finalyear;
    }

    public void setHalfyear(String halfyear) {
        this.halfyear = halfyear;
    }

    public String getHalfyear() {
        return halfyear;
    }

    public void setQuarter(String quarter) {
        this.quarter = quarter;
    }

    public String getQuarter() {
        return quarter;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getMonth() {
        return month;
    }

    public void setFromdate(String fromdate) {
        this.fromdate = fromdate;
    }

    public String getFromdate() {
        return fromdate;
    }

    public void setTodate(String todate) {
        this.todate = todate;
    }

    public String getTodate() {
        return todate;
    }
    
    public void setRegistrationstatus(String registrationstatus) {
        this.registrationstatus = registrationstatus;
    }

    public String getRegistrationstatus() {
        return registrationstatus;
    }
    
    public void setRegistratondate(Date registratondate) {
        this.registratondate = registratondate;
    }

    public Date getRegistratondate() {
        return registratondate;
    }
    
    public void setPaymentdate(Date paymentdate) {
        this.paymentdate = paymentdate;
    }

    public Date getPaymentdate() {
        return paymentdate;
    }
    
    public void setStatecode(String statecode) {
        this.statecode = statecode;
    }

    public String getStatecode() {
        return statecode;
    }

    public void setCitycode(String citycode) {
        this.citycode = citycode;
    }

    public String getCitycode() {
        return citycode;
    }
    
    public void setTaxtype(String taxtype) {
        this.taxtype = taxtype;
    }

    public String getTaxtype() {
        return taxtype;
    }
    
    public int getTotalrecords() {
        return totalrecords;
    }
    
    public void setExcisetotal(String excisetotal) {
        this.excisetotal = excisetotal;
    }

    public String getExcisetotal() {
        return excisetotal;
    }

    public void setMiningtotal(String miningtotal) {
        this.miningtotal = miningtotal;
    }

    public String getMiningtotal() {
        return miningtotal;
    }

    public void setComtaxtotal(String comtaxtotal) {
        this.comtaxtotal = comtaxtotal;
    }

    public String getComtaxtotal() {
        return comtaxtotal;
    }
    
    public void setIdproof(String idproof) {
        this.idproof = idproof;
    }

    public String getIdproof() {
        return idproof;
    }

    public void setIdproofval(String idproofval) {
        this.idproofval = idproofval;
    }

    public String getIdproofval() {
        return idproofval;
    }
    
    public void setMajortax(String majortax) {
        this.majortax = majortax;
    }

    public String getMajortax() {
        return majortax;
    }

    public void setSubtax(String subtax) {
        this.subtax = subtax;
    }

    public String getSubtax() {
        return subtax;
    }

  

    public void setInterest(double interest) {
        this.interest = interest;
    }

    public double getInterest() {
        return interest;
    }

    public void setPenalty(double penalty) {
        this.penalty = penalty;
    }

    public double getPenalty() {
        return penalty;
    }

    public void setMisc(double misc) {
        this.misc = misc;
    }

    public double getMisc() {
        return misc;
    }
    
    public void setBranchaddress(String branchaddress) {
        this.branchaddress = branchaddress;
    }

    public String getBranchaddress() {
        return branchaddress;
    }

    public void setBranchdistrict(String branchdistrict) {
        this.branchdistrict = branchdistrict;
    }

    public String getBranchdistrict() {
        return branchdistrict;
    }

    public void setBranchstate(String branchstate) {
        this.branchstate = branchstate;
    }

    public String getBranchstate() {
        return branchstate;
    }

    public void setBranchpincode(String branchpincode) {
        this.branchpincode = branchpincode;
    }

    public String getBranchpincode() {
        return branchpincode;
    }
    
     public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }
    
     public String deptValidationBranch(Connection con, GenericBean tbeans) throws Exception {
        String deptid = tbeans.getDepartmentid();
        String blosc = tbeans.getBranchlocation();
        String adrs=tbeans.getBranchaddress();
        String stat=tbeans.getBranchstate();
        String cty=tbeans.getBranchdistrict();
        String pncd=tbeans.getBranchpincode();
       
        String nameEx = "^[a-zA-Z0-9 ]+$";
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        String nameEx12="^[0-9]+$";
         String msg1 = "Please Fill The Appropriate";
        if ((!deptid.matches(nameEx11)) || (deptid == null) || (deptid.equalsIgnoreCase("")) || (deptid.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " Department Name \n";
        }

        if ((!blosc.matches(nameEx)) || (blosc == null) || (blosc.equalsIgnoreCase("")) || (blosc.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " BranchLocation \n";
        }

        if ((!adrs.matches(nameEx)) || (adrs == null) || (adrs.equalsIgnoreCase(""))) {
            msg1 = msg1 + " Branch Address \n";
        }
         if ((!stat.matches(nameEx11)) || (stat == null) || (stat.equalsIgnoreCase("")) || (stat.equalsIgnoreCase("#"))) {
            msg1 = msg1 + " State \n";
        } if ((!cty.matches(nameEx11)) || (cty == null) || (cty.equalsIgnoreCase("")) || (cty.equalsIgnoreCase("#"))) {
            msg1 = msg1 + " City \n";
        } if ((!pncd.matches(nameEx12)) || (pncd == null) || (pncd.equalsIgnoreCase("")) || (pncd.equalsIgnoreCase("#"))) {
            msg1 = msg1 + " Pincode \n";
        }

        return msg1;
        
    }
     
    public ArrayList getAdrsBranch(Connection con,String dept,String brnchlocsn) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql ="SELECT address FROM branch_location WHERE branch_name=? and department_id=? and status='A'";
            ps = con.prepareStatement(sql);
            ps.setString(1, brnchlocsn);
            ps.setString(2, dept);
            rs = ps.executeQuery();
            while (rs.next()){
                GenericBean gab = new GenericBean();
               gab.setAddress(rs.getString("address"));
                al.add(gab);
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return al;
    }
    
     public ArrayList getPinBranch(Connection con,String dept,String brnchlocsn) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql ="SELECT pincode FROM branch_location WHERE branch_name=? and department_id=? and status='A'";
            ps = con.prepareStatement(sql);
            ps.setString(1, brnchlocsn);
            ps.setString(2, dept);
            rs = ps.executeQuery();
            while (rs.next()){
                GenericBean gab = new GenericBean();
               
               gab.setPincode(rs.getString("pincode"));
               
                al.add(gab);
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return al;
    }
    
     public String searchvalid(Connection con, GenericBean tbeans) throws Exception {
       String searchval = tbeans.getSearch();
       String sear = "^[0-9]+$";
        String msg1 = "Please Fill The Appropriate";
        if ((!searchval.matches(sear))) {
            msg1 = msg1 + "  Search Field \n";
        }
        return msg1;
    }
     
    public void doInsertUnregisteredDetails(Connection con,GenericBean gb) throws Exception{
        PreparedStatement ps=null;
        String sql="insert into generic_epayment (DEPARTMENT,TREASURY_HEAD,PURPOSE,DESCRIPTION,PERIOD_TYPE,AMOUNT,REMARKS,DLRNAME,ADDRESS,MOBILE,EMAIL,PERIOD_FROM,PERIOD_TO,CHALLAN_NO,CITY,STATE,PIN_CODE,CITY_CODE,STATE_CODE,SUBTAX,INTEREST,PENALTY,MISC,IDENTITY,IDENTITY_NO,branch_location,grand_total,PAYMENT_DATE) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE()) " ;
        try{           
            ps=con.prepareStatement(sql);
            ps.setString(1,gb.getDepartmentid());
            ps.setString(2,gb.getTreasuryhead());
            ps.setString(3,gb.getPurpose());
            ps.setString(4,gb.getDescription());
            ps.setString(5,gb.getPeriodtype());
            ps.setDouble(6,gb.getAmount());
            ps.setString(7,gb.getRemarks());
            ps.setString(8,gb.getDlrname());
            ps.setString(9,gb.getAddress());
            ps.setString(10,gb.getMobile());
            ps.setString(11,gb.getEmail());
            ps.setDate(12,gb.getPeriod_from());
            ps.setDate(13,gb.getPeriod_to());
            ps.setString(14,gb.getChallanno());
            ps.setString(15,gb.getCity());
            ps.setString(16,gb.getState());
            ps.setString(17,gb.getPincode());
            ps.setString(18,gb.getCitycode());
            ps.setString(19,gb.getStatecode());
            ps.setString(20,gb.getSubtax());
            ps.setDouble(21,gb.getInterest());
            ps.setDouble(22,gb.getPenalty());
            ps.setDouble(23,gb.getMisc());
            ps.setString(24,gb.getIdproof());
            ps.setString(25,gb.getIdproofval());
            ps.setString(26,gb.getBranchaddress());
            ps.setDouble(27,gb.getGrandtotal());
            ps.execute();            
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
        ps.close();
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        
    }
    
    
   public void doInsertRegisteredDetails(Connection con,GenericBean gb) throws Exception{
        PreparedStatement ps=null;
        String sql="insert into generic_epayment (DEPARTMENT,TREASURY_HEAD,PURPOSE,DESCRIPTION,PERIOD_TYPE,AMOUNT,REMARKS,DLRNAME,ADDRESS,MOBILE,EMAIL,PERIOD_FROM,PERIOD_TO,CHALLAN_NO,CITY,STATE,PIN_CODE,CITY_CODE,STATE_CODE,REGISTERED,IDENTITY,IDENTITY_NO,SUBTAX,grand_total,INTEREST,PENALTY,MISC,branch_location,PAYMENT_DATE) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'Y',?,?,?,?,?,?,?,?,SYSDATE()) " ;
        try{           
            ps=con.prepareStatement(sql);
            ps.setString(1,gb.getDepartmentid());
            ps.setString(2,gb.getTreasuryhead());
            ps.setString(3,gb.getPurpose());
            ps.setString(4,gb.getDescription());
            ps.setString(5,gb.getPeriodtype());
            ps.setDouble(6,gb.getAmount());
            ps.setString(7,gb.getRemarks());
            ps.setString(8,gb.getDlrname());
            ps.setString(9,gb.getAddress());
            ps.setString(10,gb.getMobile());
            ps.setString(11,gb.getEmail());
            ps.setDate(12,gb.getPeriod_from());
            ps.setDate(13,gb.getPeriod_to());
            ps.setString(14,gb.getChallanno());
            ps.setString(15,gb.getCity());
            ps.setString(16,gb.getState());
            ps.setString(17,gb.getPincode());
            ps.setString(18,gb.getCitycode());
            ps.setString(19,gb.getStatecode());
            ps.setString(20,gb.getIdproof());
            ps.setString(21,gb.getIdproofval());
            ps.setString(22,gb.getSubtax());
            ps.setDouble(23,gb.getGrandtotal());
            ps.setDouble(24,gb.getInterest());
            ps.setDouble(25,gb.getPenalty());
            ps.setDouble(26,gb.getMisc());
            ps.setString(27,gb.getBranchaddress());
            ps.execute();            
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
        ps.close();
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        
    }
   
    
    
    
   /*  public void doInsertRegisteredDetails(Connection con,GenericBean gb) throws Exception{
        PreparedStatement ps=null;
        String sql="insert into GENERIC_EPAYMENT (DEPARTMENT,TREASURY_HEAD,PURPOSE,DESCRIPTION,PERIOD_TYPE,AMOUNT,REMARKS,PERIOD_FROM,PERIOD_TO,CHALLAN_NO,EMAIL,REGISTERED,PAYMENT_DATE) values(?,?,?,?,?,?,?,?,?,?,?,'Y',SYSDATE()) " ;
        try{           
            ps=con.prepareStatement(sql);
            ps.setInt(1,gb.getDepartmentid());
            ps.setString(2,gb.getTreasuryhead());
            ps.setString(3,gb.getPurpose());
            ps.setString(4,gb.getDescription());
            ps.setString(5,gb.getPeriodtype());
            ps.setDouble(6,gb.getAmount());
            ps.setString(7,gb.getRemarks());
            ps.setDate(8,gb.getPeriod_from());
            ps.setDate(9,gb.getPeriod_to());
            ps.setString(10,gb.getChallanno());
            ps.setString(11,gb.getEmail());
            ps.execute();            
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
        ps.close();
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
    }  */
    public String deptForget(Connection con, GenericBean tbeans) throws Exception {
       String ansr = tbeans.getAnswer();
        String maile = tbeans.getEmail();
        int atpos = maile.indexOf("@");
        int dotpos = maile.lastIndexOf(".");
        String nameEx = "^[a-zA-Z ]+$";
        String pwdRegex="^[0-9A-Za-z!@#$%&* ]+$" ;
        String cpcha = "^[a-zA-Z0-9]+$";
        String msg1 = "Please Fill The Appropriate";
        if (((atpos < 1) || ( dotpos - atpos < 2 )) || (maile.equalsIgnoreCase(""))) {
             msg1 = msg1 + " Email \n";
        }
        if ((!ansr.matches(nameEx))) {
            msg1 = msg1 + "  Answer \n";
        }
        return msg1;

    }
    
    public String headerLog(Connection con, GenericBean tbeans) throws Exception {
       
        String maile = tbeans.getEmail();
        String paswrd = tbeans.getPassword();
        int atpos = maile.indexOf("@");
        int dotpos = maile.lastIndexOf(".");
        
         int pwdlength=password.length();
         String strongRegex ="^(?=.{8,})(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*])";
         String msg1 = "Please Fill The Appropriate";
        if (((atpos < 1) || ( dotpos - atpos < 2 )) || (maile.equalsIgnoreCase("")) || (maile.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = "Invalid username or password";
        }

        //if (((!paswrd.matches(strongRegex)) || (pwdlength<8)) || (paswrd.equalsIgnoreCase("")) || (paswrd.equalsIgnoreCase("#"))) {
          //  msg1 = "Please Fill The Appropriate Email or Password";
       // }

        return msg1;

    }
    
    public void doInsertSignUpDetails(Connection con,GenericBean gb) throws Exception{
        PreparedStatement ps=null;
        String sql="insert into generic_user_profile(DLRNAME,EMAIL,MOBILE,ADDRESS,CITY,STATE,PIN_CODE,SECURITY_QUESTION,SECURITY_ANSWER,PASSWORD,CITY_CODE,STATE_CODE,REGISTRATION_DATE) values(?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE()) " ;
        try{ 
            MD5 md=new MD5();
            String password=gb.getRepassword();
            String pwd = md.calcMD5(password);
            ps=con.prepareStatement(sql);
            ps.setString(1,gb.getDlrname());
            ps.setString(2,gb.getEmail());
            ps.setString(3,gb.getMobile());
            ps.setString(4,gb.getAddress());
            ps.setString(5,gb.getCity());
            ps.setString(6,gb.getState());
            ps.setString(7,gb.getPincode());
            ps.setString(8,gb.getQuestion());
            ps.setString(9,gb.getAnswer());
            ps.setString(10,pwd);
            ps.setString(11,gb.getCitycode());
            ps.setString(12,gb.getStatecode());
            ps.execute();            
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
         ps.close();
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        
    }

    public boolean doFindByUser(Connection conn, String username, String pasword, String rnd) throws NullPointerException{
            boolean flag=false;
        try{
            String sql="select EMAIL, PASSWORD from generic_user_profile where EMAIL=? ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,username);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                String pwd=rs.getString("PASSWORD");
                  MD5 m = new MD5();
                String mf = m.calcMD5(pwd + rnd);
                if (mf.equals(pasword)){
                    flag=true;
                }
                else{
                    flag=false;
                }
              }
            rs.close();
            ps.close();
          //  conn.close();
            }catch(SQLException e){
              System.out.println("erro at do query in User "+e.getMessage());
            }catch(NullPointerException e){
               throw new NullPointerException(); 
            }
            return flag;
    }
    
    public GenericBean getDetailsByEmail(Connection con,String  email) throws Exception{
        PreparedStatement ps=null; ResultSet rs=null ; GenericBean genrbean=null ;
        String sql="select DLRNAME,ADDRESS,MOBILE,EMAIL,CITY,STATE,PIN_CODE,SECURITY_QUESTION,SECURITY_ANSWER,CITY_CODE,STATE_CODE from generic_user_profile where EMAIL=?  " ;
        try{  
            ps=con.prepareStatement(sql);
            ps.setString(1,email);
            rs=ps.executeQuery() ;
            if(rs.next()){
                genrbean=new GenericBean();
            genrbean.setDlrname( rs.getString("DLRNAME"));
            genrbean.setAddress( rs.getString("ADDRESS"));
            genrbean.setMobile(rs.getString("MOBILE"));
            genrbean.setEmail(rs.getString("EMAIL"));
            genrbean.setCity(rs.getString("CITY"));
            genrbean.setState(rs.getString("STATE"));
            genrbean.setPincode(rs.getString("PIN_CODE"));
            genrbean.setQuestion(rs.getString("SECURITY_QUESTION"));
            genrbean.setAnswer(rs.getString("SECURITY_ANSWER"));
            genrbean.setCitycode(rs.getString("CITY_CODE"));
            genrbean.setStatecode(rs.getString("STATE_CODE"));
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
        ps.close();
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        return genrbean;
    }

    public String getRegistrationStatusByChallan(Connection con,String  challan) throws Exception{
        PreparedStatement ps=null; GenericBean genrbean=null ; ResultSet rs=null; String stats=null ;
        String sql="select REGISTERED from generic_epayment where CHALLAN_NO=? ";
        try{  
           ps=con.prepareStatement(sql);
           ps.setString(1,challan);
           rs=ps.executeQuery() ;
            if(rs.next()){
            genrbean=new GenericBean();
            stats=rs.getString("registered");
            }else{
                stats="N" ;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        }
        return stats;
    }

  public String getSecurityAnswerByEmail(Connection con,String  email) throws Exception{
        PreparedStatement ps=null; GenericBean genrbean=null ; ResultSet rs=null; String stats=null ;
        String sql="select SECURITY_ANSWER from generic_user_profile where EMAIL=? ";
        try{  
            ps=con.prepareStatement(sql);
            ps.setString(1,email);
            rs=ps.executeQuery() ;
            if(rs.next()){
            genrbean=new GenericBean();
            stats=rs.getString("SECURITY_ANSWER");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        }
        return stats;
    }
 
 /*   public void doUpdatePassword(Connection conn,String  email,String password) throws SQLException{
            PreparedStatement ps=null; 
            String sql="update GENERIC_USER_PROFILE set PASSWORD='"+password+"'  where EMAIL='"+email+"'";
            try{
            ps=conn.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw e;            
        }
        finally{
            try{
                if(ps !=null)
                ps.close();
            }catch(Exception e){
                e.getMessage();                            
            }
        }
    }*/
    
    
    
    public static void doUpdatePassword(String oldpwd,Connection conn,String email,String password)throws Exception{
        try{
            String sql="";
            sql="select PASSWORD as pwd from generic_user_profile where EMAIL=? ";
            PreparedStatement ps1=conn.prepareStatement(sql);
            ps1.setString(1,email);
            ResultSet rs=ps1.executeQuery();
            if(rs.next()){
                String pwd1=rs.getString("pwd");
                MD5 m=new MD5();
                String mf=m.calcMD5(oldpwd); // 
                if(mf.equals(pwd1)){
                    MD5 md=new MD5();
                    String pwd = md.calcMD5(password);
                    java.util.Date d=new java.util.Date();
                    java.sql.Date pred=new java.sql.Date(d.getTime());
                    sql="update generic_user_profile set PASSWORD=?  where EMAIL='"+email+"'";
                    PreparedStatement ps=conn.prepareStatement(sql);
                    ps.setString(1, pwd);
                    ps.execute();
                    ps.close();    
                }else{
                    throw new Exception("Old Password is wrong. Please Try Again.");
                }
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new UnknownException(e.toString());
        }    
    }
    
    public static void doUpdateForgotPassword(Connection conn,String email,String password)throws Exception{
        try{
           String sql="" ;
                    MD5 md=new MD5();
                    String pwd = md.calcMD5(password);
                    java.util.Date d=new java.util.Date();
                    java.sql.Date pred=new java.sql.Date(d.getTime());
                    sql="update generic_user_profile set PASSWORD=?  where EMAIL='"+email+"'";
                    PreparedStatement ps=conn.prepareStatement(sql);
                    ps.setString(1, pwd);
                    ps.execute();
                    ps.close();    
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new UnknownException(e.toString());
        }    
    }
    
    
    public void doInsertLogDetails(Connection con,GenericBean gb) throws Exception{
        PreparedStatement ps=null;
        String sql="insert into generic_user_profile_log(DLRNAME,EMAIL,MOBILE,ADDRESS,CITY,STATE,PIN_CODE,SECURITY_QUESTION,SECURITY_ANSWER,PASSWORD,REGISTRATION_DATE,MODIFIED_DATE) values(?,?,?,?,?,?,?,?,?,?,?,SYSDATE()) " ;
        try{           
            ps=con.prepareStatement(sql);
            ps.setString(1,gb.getDlrname());
            ps.setString(2,gb.getEmail());
            ps.setString(3,gb.getMobile());
            ps.setString(4,gb.getAddress());
            ps.setString(5,gb.getCity());
            ps.setString(6,gb.getState());
            ps.setString(7,gb.getPincode());
            ps.setString(8,gb.getQuestion());
            ps.setString(9,gb.getAnswer());
            ps.setString(10,gb.getPassword());
            ps.setDate(11,gb.getRegistratondate());
            ps.execute();            
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
        ps.close();
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        
    }
    
    
    
    
    public GenericBean getUpdateUserDetails(Connection con,GenericBean  gb) throws Exception{
        PreparedStatement ps=null;  GenericBean genrbean=null ;
       
        try{  
       // this.getDetailsByEmail(con,email);
       // this.doInsertLogDetails(con,gb);
            String sql="update generic_user_profile set DLRNAME=?,MOBILE=?,ADDRESS=?,CITY=?,STATE=?,PIN_CODE=?,SECURITY_QUESTION=?,SECURITY_ANSWER=?,CITY_CODE=?,STATE_CODE=?,MODIFIED_DATE=SYSDATE() where EMAIL=?  " ;
            ps=con.prepareStatement(sql);
            ps.setString(1,gb.getDlrname());
            ps.setString(2,gb.getMobile()); 
            ps.setString(3,gb.getAddress());
            ps.setString(4,gb.getCity());
            ps.setString(5,gb.getState());
            ps.setString(6,gb.getPincode());
            ps.setString(7,gb.getQuestion());
            ps.setString(8,gb.getAnswer());
            ps.setString(9,gb.getCitycode());
            ps.setString(10,gb.getStatecode());
            ps.setString(11,gb.getEmail());
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
       if(ps!=null){
        ps.close();
       }
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        return genrbean;
    }
    
  
    
    public GenericBean getDetailsByChallanNo(Connection con,String  challan) throws Exception{
      ResultSet rs=null ; GenericBean genrbean=null ; String sql="" ;
      PreparedStatement ps=null ;
      String status=getRegistrationStatusByChallan(con,challan)!=null?getRegistrationStatusByChallan(con,challan) : "";
      if(status.equalsIgnoreCase("Y")){
          sql="select gup.DLRNAME,gup.ADDRESS,gup.MOBILE,gup.CITY,gup.STATE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID join GENERIC_USER_PROFILE gup on gp.email=gup.email  where gp.CHALLAN_NO=?  " ;
      }
      else{
         sql="select gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.MOBILE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID where gp.CHALLAN_NO=? " ;
      }
        try{  
            ps=con.prepareStatement(sql);
            ps.setString(1,challan);
            rs=ps.executeQuery() ;
            if(rs.next()){
                genrbean=new GenericBean();
            genrbean.setDlrname( rs.getString("DLRNAME"));
            genrbean.setAddress( rs.getString("ADDRESS"));
            genrbean.setCity( rs.getString("CITY"));
            genrbean.setState( rs.getString("STATE"));
            genrbean.setMobile(rs.getString("MOBILE"));
            genrbean.setEmail(rs.getString("EMAIL"));
            genrbean.setChallanno(rs.getString("CHALLAN_NO"));
            genrbean.setAmount(rs.getDouble("AMOUNT"));
            genrbean.setDepartmentname(rs.getString("DEPT_NAME"));
            genrbean.setDepartmentid(rs.getString("DEPARTMENT"));
            genrbean.setPeriod_from(rs.getDate("PERIOD_FROM"));
            genrbean.setPeriod_to(rs.getDate("PERIOD_TO"));
            genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
            genrbean.setPurpose(rs.getString("PURPOSE"));
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
            if(rs!=null) { rs.close();}
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        return genrbean;
    }
    
    
    
    public GenericBean getDetailsByChallanNoAndEmail(Connection con,String  challan, String email) throws Exception{
      ResultSet rs=null ; GenericBean genrbean=null ; String sql="" ;
        PreparedStatement ps=null ;
      String status=getRegistrationStatusByChallan(con,challan)!=null?getRegistrationStatusByChallan(con,challan) : "";
      if(status.equalsIgnoreCase("Y")){
          sql="select gup.DLRNAME,gup.ADDRESS,gup.MOBILE,gup.CITY,gup.STATE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID join GENERIC_USER_PROFILE gup on gp.email=gup.email  where gp.CHALLAN_NO=? and gp.EMAIL=? " ;
      }
      else{
         sql="select gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.MOBILE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID where gp.CHALLAN_NO=? and gp.EMAIL=? " ;
      }
        try{  
            ps=con.prepareStatement(sql);
            ps.setString(1,challan);
            ps.setString(2,email);
            rs=ps.executeQuery() ;
            if(rs.next()){
                genrbean=new GenericBean();
            genrbean.setDlrname( rs.getString("DLRNAME"));
            genrbean.setAddress( rs.getString("ADDRESS"));
            genrbean.setCity( rs.getString("CITY"));
            genrbean.setState( rs.getString("STATE"));
            genrbean.setMobile(rs.getString("MOBILE"));
            genrbean.setEmail(rs.getString("EMAIL"));
            genrbean.setChallanno(rs.getString("CHALLAN_NO"));
            genrbean.setAmount(rs.getDouble("AMOUNT"));
            genrbean.setDepartmentname(rs.getString("DEPT_NAME"));
            genrbean.setDepartmentid(rs.getString("DEPARTMENT"));
            genrbean.setPeriod_from(rs.getDate("PERIOD_FROM"));
            genrbean.setPeriod_to(rs.getDate("PERIOD_TO"));
            genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
            genrbean.setPurpose(rs.getString("PURPOSE"));
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            throw e ;            
        }
        finally{
        try{
            if(rs!=null) { rs.close();}
        }catch(Exception e){
        System.out.println(e.getMessage());
        }
        }
        return genrbean;
    }
    
    
    
    
    public ArrayList doQueryForTransactionHistory(Connection con,String email) throws Exception{
            ResultSet rs=null;   PreparedStatement ps=null ;
            ArrayList al=new ArrayList();
            try{
                String sql="select gp.DLRNAME,gp.ADDRESS,gp.MOBILE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID where gp.EMAIL=? " ;
                ps=con.prepareStatement(sql);
                ps.setString(1,email);
                rs=ps.executeQuery() ; 
            while(rs.next()){
                GenericBean genrbean=new GenericBean();
                genrbean.setDlrname( rs.getString("DLRNAME"));
                genrbean.setAddress( rs.getString("ADDRESS"));
                genrbean.setMobile(rs.getString("MOBILE"));
                genrbean.setEmail(rs.getString("EMAIL"));
                genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                genrbean.setAmount(rs.getDouble("AMOUNT"));
                genrbean.setDepartmentname(rs.getString("DEPT_NAME"));
                genrbean.setDepartmentid(rs.getString("DEPARTMENT"));
                genrbean.setPeriod_from(rs.getDate("PERIOD_FROM"));
                genrbean.setPeriod_to(rs.getDate("PERIOD_TO"));
                genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                genrbean.setPurpose(rs.getString("PURPOSE"));
                al.add(genrbean);
            }
               
                return al;
            }catch(Exception sqe){
                System.out.println(sqe.getMessage());
                throw sqe;
           }
            finally{
               rs.close();
              
            }
            
        }
        
        
        
        
    public ArrayList doQueryForTransactionHistoryWithPagination(Connection con,String email) throws Exception{
            ResultSet rs=null;
            ArrayList al=new ArrayList();
            GenericBean genrbean=null ;
            PreparedStatement ps=null ;
                         
               
                 String sql="select gp.DLRNAME,gp.ADDRESS,gp.MOBILE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID where gp.EMAIL=? and  gp.cin is not null";
                try {
                    ps=con.prepareStatement(sql);
                    ps.setString(1,email);
                    rs=ps.executeQuery() ; 
                        while(rs.next()){
                            genrbean=new GenericBean();
                            genrbean.setDlrname( rs.getString("DLRNAME"));
                            genrbean.setAddress( rs.getString("ADDRESS"));
                            genrbean.setMobile(rs.getString("MOBILE"));
                            genrbean.setEmail(rs.getString("EMAIL"));
                            genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                            genrbean.setAmount(rs.getDouble("AMOUNT"));
                            genrbean.setDepartmentname(rs.getString("DEPT_NAME"));
                            genrbean.setDepartmentid(rs.getString("DEPARTMENT"));
                            genrbean.setPeriod_from(rs.getDate("PERIOD_FROM"));
                            genrbean.setPeriod_to(rs.getDate("PERIOD_TO"));
                            genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                            genrbean.setPurpose(rs.getString("PURPOSE"));
                            al.add(genrbean);
                        }
                    rs.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    throw e;
                }
                return al;
        }
        
    public static ArrayList getStateList(Connection conn, 
                                         boolean ex_jharkhand) {
        ArrayList ar = new ArrayList();
        try {
            Statement st = conn.createStatement();
            String sql = "select * from states";
            if (ex_jharkhand)
                sql += " where trim(state_code)<>'34'";
            sql += " order by STATE_NAME asc";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                State s = new State();
                s.STATE_CODE = rs.getString("STATE_CODE");
                s.STATE_NAME = rs.getString("STATE_NAME");
                ar.add(s);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return ar;
    }
        
        
    public static String getState(Connection conn, String state_code) {
        String name = null; PreparedStatement ps=null ;
        try {
            Statement st = conn.createStatement();
            String sql ="select * from states where STATE_CODE=? ";
            ps=conn.prepareStatement(sql);
            ps.setString(1,state_code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("STATE_NAME");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return name;
    }
        
    public static String getCity(Connection conn, String city_code) {
        String name = null; PreparedStatement ps=null ;
        try {
            String sql ="select DISTRICT_NAME from  districts where DISTRICT_CODE=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1,city_code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("DISTRICT_NAME");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return name;
    }
        
        
    public ArrayList getTaxTypeByDeptid(Connection con,String dept) throws Exception{
        PreparedStatement ps=null; ResultSet rs=null ; ArrayList al=new ArrayList();
        try{
            String sql="select initcap(MAJOR_TAX) as MAJOR_TAX from generic_major_tax where DEPT_ID=? and status='A' and MAJOR_TAX is not null group by MAJOR_TAX " ;
            ps=con.prepareStatement(sql);
            ps.setString(1,dept);
            rs=ps.executeQuery();
            while(rs.next()){
                GenericBean gab=new GenericBean();
                gab.setMajortax(rs.getString("MAJOR_TAX"));
                al.add(gab);
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    return al;
    }
    
    
    public ArrayList getSubTaxTypeByDeptid(Connection con,String tax,String dept) throws Exception{
        PreparedStatement ps=null; ResultSet rs=null ; ArrayList al=new ArrayList();
        try{
            String sql="select initcap(TAX_PURPOSE) as TAX_PURPOSE from echallan_tax_purposes where upper(MAJOR_TAX)=? and DEPT_ID=? and status='A'" ;
            ps=con.prepareStatement(sql);
            ps.setString(1,tax.toUpperCase());
            ps.setString(2,dept);
            rs=ps.executeQuery();
            while(rs.next()){
                GenericBean gab=new GenericBean();
                gab.setTaxtype(rs.getString("TAX_PURPOSE"));
                al.add(gab);
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    return al;
    }
    
    
    
    public String getAmountByDeptid(Connection con,int dept) throws Exception{
        PreparedStatement ps=null; ResultSet rs=null ;
        String deptname="" ;
        try{
            String sql="select initcap(DEPT_NAME) as DEPT_NAME from generic_dept where upper(MAJOR_TAX)=? and DEPT_ID=?" ;
            ps=con.prepareStatement(sql);
            ps.setInt(1,dept);
            ps.setString(2,"A");
            rs=ps.executeQuery();
            if(rs.next()){
                deptname=rs.getString("DEPT_NAME");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    return deptname;
    }
    
    public String getIsFixedByDeptid(Connection con,String tax,String dept) throws Exception{
        PreparedStatement ps=null; ResultSet rs=null ;
        String status="" ;
        try{
            String sql="select ISFIXED from echallan_tax_purposes where upper(MAJOR_TAX)=? and DEPT_ID=?" ;
            ps=con.prepareStatement(sql);
            ps.setString(1,tax.toUpperCase());
            ps.setString(2,dept);
            rs=ps.executeQuery();
            if(rs.next()){
                status=rs.getString("ISFIXED");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    return status;
    }
    
    public String getDeptNameByDeptid(Connection con,int dept) throws Exception{
        PreparedStatement ps=null; ResultSet rs=null ;
        String deptname="" ;
        try{
            String sql="select initcap(DEPT_NAME) as DEPT_NAME from generic_dept where DEPT_ID=? and STATUS=?" ;
            ps=con.prepareStatement(sql);
            ps.setInt(1,dept);
            ps.setString(2,"A");
            rs=ps.executeQuery();
            if(rs.next()){
                deptname=rs.getString("DEPT_NAME");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    return deptname;
    }
    
    
    public String getDeptIdByDeptName(Connection con,String deptnm) throws Exception{
        PreparedStatement ps=null; ResultSet rs=null ;
        String deptid="" ;
        try{
            String sql="select DEPT_ID from generic_dept where  UPPER(DEPT_NAME)=? and STATUS=?" ;
            ps=con.prepareStatement(sql);
            ps.setString(1,deptnm.toUpperCase());
            ps.setString(2,"A");
            rs=ps.executeQuery();
            if(rs.next()){
                deptid=rs.getString("DEPT_ID");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    return deptid;
    }
    
    
    
    
   public static String checkSumSHA256(String plaintext)  {
           MessageDigest md = null;
           try {
                   md = MessageDigest.getInstance("SHA-256"); //step 2
                   md.update(plaintext.getBytes("UTF-8")); //step 3
           } catch (Exception e) {
                   md=null;
           }
           StringBuffer ls_sb=new StringBuffer();
           byte raw[] = md.digest(); //step 4
           for(int i=0;i<raw.length;i++)
                   ls_sb.append(char2hex(raw[i]));
           return ls_sb.toString(); //step 6
           }

   public static String char2hex(byte x)
   {
           char arr[]={

           '0','1','2','3',
           '4','5','6','7',
           '8','9','A','B',
           'C','D','E','F'
           };

           char c[] = {arr[(x & 0xF0)>>4],arr[x & 0x0F]};
           return (new String(c));
   }



 /*  public static String HmacSHA256(String message,String secret)  {
   MessageDigest md = null;
           try {

                   Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
                    SecretKeySpec secret_key = new SecretKeySpec(secret.getBytes(), "HmacSHA256");
                    sha256_HMAC.init(secret_key);

                   byte raw[] = sha256_HMAC.doFinal(message.getBytes());

                   StringBuffer ls_sb=new StringBuffer();
                   for(int i=0;i<raw.length;i++)
                           ls_sb.append(char2hex(raw[i]));
                           return ls_sb.toString(); //step 6
           }catch(Exception e){
                   e.printStackTrace();
                   return null;
           }
   }

    public static String char2hex(byte x)

   {
       char arr[]={
                     '0','1','2','3',
                     '4','5','6','7',
                     '8','9','A','B',
                     'C','D','E','F'
                };

       char c[] = {arr[(x & 0xF0)>>4],arr[x & 0x0F]};
       return (new String(c));
     }
*/

    public void setAdmit(double admit) {
        this.admit = admit;
    }

    public double getAdmit() {
        return admit;
    }

    public void setAsses(double asses) {
        this.asses = asses;
    }

    public double getAsses() {
        return asses;
    }

    public void setAdvn(double advn) {
        this.advn = advn;
    }

    public double getAdvn() {
        return advn;
    }
    public String getCircleNoByCirName(Connection con,String  cir) throws Exception{
          PreparedStatement ps=null; GenericBean genrbean=null ; ResultSet rs=null; String stats=null ;
          String sql="select CIR_NCODE from t_circle where CIR_NAME=? ";
          try{  
             ps=con.prepareStatement(sql);
             ps.setString(1,cir);
             rs=ps.executeQuery() ;
              if(rs.next()){
              genrbean=new GenericBean();
              stats=rs.getString("CIR_NCODE");
              }
              //else{
              //    stats="N" ;
             // }
          }catch(Exception e){
              System.out.println(e.getMessage());
              throw e ;          
          }
          finally{
          if(rs!=null) rs.close();
          if(ps!=null) ps.close();
          }
          return stats;
      }
    public ArrayList getIdProofByDeptidRegistered(Connection con, 
                                        String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = 
                        "select initcap(IDPROOF) as IDPROOF from generic_idproof where DEPARTMENT=? and STATUS=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, "A");
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setIdproof(rs.getString("IDPROOF"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }
    
    
    public ArrayList getIdProofByDeptidUnRegistered(Connection con, 
                                        String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql ="select initcap(IDPROOF) as IDPROOF from generic_idproof where trim(DEPARTMENT)=? and STATUS=?";
            ps = con.prepareStatement(sql);
            System.out.println("DEP "+dept);
            ps.setString(1, dept.trim());
            ps.setString(2, "A");
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericBean gab = new GenericBean();
                gab.setIdproof(rs.getString("IDPROOF"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }
    
    public ArrayList getBranchLocationByDepartment(Connection con,int dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql ="select address,state,city,pincode from generic_department_location where dept_id=? and STATUS=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, dept);
            ps.setString(2, "A");
            rs = ps.executeQuery();
            while (rs.next()){
                GenericBean gab = new GenericBean();
                gab.setBranchaddress(rs.getString("address"));
                gab.setBranchdistrict(rs.getString("city"));
                gab.setBranchstate(rs.getString("state"));
                gab.setBranchpincode(rs.getString("pincode"));
                al.add(gab);
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return al;
    }
    
    
    
   /* public boolean doFindByUserHeader(Connection conn, String username, String pasword) throws NullPointerException{
               boolean flag=false;
           try{
               String sql="select EMAIL, PASSWORD from generic_user_profile where EMAIL=? ";
               PreparedStatement ps=conn.prepareStatement(sql);
               ps.setString(1,username);
               ResultSet rs=ps.executeQuery();
               if(rs.next()){
                   String pwd=rs.getString("PASSWORD");
                    // MD5 m = new MD5();
                   //String mf = m.calcMD5(pwd);
                   if (pwd.equals(pasword)){
                       flag=true;
                   }
                   else{
                       flag=false;
                   }
                 }
               rs.close();
               ps.close();
             //  conn.close();
               }catch(SQLException e){
                 System.out.println("erro at do query in User "+e.getMessage());
               }catch(NullPointerException e){
                  throw new NullPointerException(); 
               }
               return flag;
       }*/
    
    
      public boolean doFindByUserHeader(Connection conn, String username, String pasword,String rnd) throws NullPointerException{
               boolean flag=false;
           try{
               String sql="select EMAIL, PASSWORD from generic_user_profile where EMAIL=? ";
               PreparedStatement ps=conn.prepareStatement(sql);
               ps.setString(1,username);
               ResultSet rs=ps.executeQuery();
               if(rs.next()){
                   String pwd=rs.getString("PASSWORD");
                     MD5 m = new MD5();
                   String mf = m.calcMD5(pwd+rnd);
                   
                   
                  //  String pwd1 = m.calcMD5(rs.getString("password")+ rnd) ;
                   if (mf.equals(pasword)){
                       flag=true;
                   }
                   else{
                       flag=false;
                   }
                 }
               rs.close();
               ps.close();
             //  conn.close();
               }catch(SQLException e){
                 System.out.println("erro at do query in User "+e.getMessage());
               }catch(NullPointerException e){
                  throw new NullPointerException(); 
               }
               return flag;
       }


    public void setGrandtotal(double grandtotal) {
        this.grandtotal = grandtotal;
    }

    public double getGrandtotal() {
        return grandtotal;
    }
    
    
    
    public String getSecurityQuestionByEmail(Connection con,String  email) throws Exception{
          PreparedStatement ps=null;  ResultSet rs=null; 
          String securityquestion="" ; String emil="" ;
         String sql="select EMAIL, SECURITY_QUESTION from generic_user_profile where EMAIL=? ";
          try{  
             ps=con.prepareStatement(sql);
             ps.setString(1,email);
             rs=ps.executeQuery();
             if(rs.next()){
                securityquestion=rs.getString("SECURITY_QUESTION");
                emil=rs.getString("EMAIL");
             } 
          }catch(Exception e){
              System.out.println(e.getMessage());
              throw e ;          
          }
          finally{
            try{
                if(ps!=null)ps.close();
                if(rs!=null)rs.close();
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
          }
          return securityquestion;
      }
    
     public void doInsertContact(Connection con, GenericBean gb) throws Exception {
        PreparedStatement ps = null;
        String sql = "INSERT INTO genericc_contact_info(id, snam, deptid, isue_sbject, email, mesg) values(upper(uuid()),?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, gb.getContnam());
            ps.setString(2, gb.getDepartmentid());
            ps.setString(3, gb.getContissue());
            ps.setString(4, gb.getContmail());
            ps.setString(5, gb.getConmsg());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }
     
      public ArrayList getFinclYr(Connection con) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = "select cdate from generic_anual_date order by cdate";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericBean tbean = new GenericBean();
                tbean.setQuarter(rs.getString("cdate"));
                //tbean.setTinp(rs.getString("id"));
               
                //  rs = ps.executeQuery();
                al.add(tbean);
               
            }  rs.close();
            ps.close();
            //con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }
public ArrayList getqrtYr(Connection con) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = "SELECT qurt_mnth_yr FROM generic_month_date order by qurt_mnth_yr";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericBean tbean = new GenericBean();
                tbean.setQuarter(rs.getString("qurt_mnth_yr"));
                //tbean.setTinp(rs.getString("id"));
               
                //  rs = ps.executeQuery();
                al.add(tbean);
               
            }  rs.close();
            ps.close();
            //con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }


public ArrayList getdepartmnt(Connection con) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = "select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS='A'";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericBean tbean = new GenericBean();
                tbean.setDepartmentname(rs.getString("DEPT_NAME"));
                tbean.setDepartmentid(rs.getString("DEPT_ID"));
                //tbean.setTinp(rs.getString("id"));
               
                //  rs = ps.executeQuery();
                al.add(tbean);
               
            }  rs.close();
            ps.close();
            //con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }


    /**
     * @return the contnam
     */
    public String getContnam() {
        return contnam;
    }

    /**
     * @param contnam the contnam to set
     */
    public void setContnam(String contnam) {
        this.contnam = contnam;
    }

    /**
     * @return the contissue
     */
    public String getContissue() {
        return contissue;
    }

    /**
     * @param contissue the contissue to set
     */
    public void setContissue(String contissue) {
        this.contissue = contissue;
    }

    /**
     * @return the contmail
     */
    public String getContmail() {
        return contmail;
    }

    /**
     * @param contmail the contmail to set
     */
    public void setContmail(String contmail) {
        this.contmail = contmail;
    }

    /**
     * @return the conmsg
     */
    public String getConmsg() {
        return conmsg;
    }

    /**
     * @param conmsg the conmsg to set
     */
    public void setConmsg(String conmsg) {
        this.conmsg = conmsg;
    }
}
