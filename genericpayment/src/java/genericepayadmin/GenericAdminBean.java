package genericepayadmin;

import java.sql.Connection;
import java.sql.Date;

public class GenericAdminBean {
    private String deptid;
    private int taxid;
    private String tax;
    private String department;
    private String treasury_head_code;
    private String description;
    private String dlrname;
    private String address;
    private String city;
    private String state;
    private String challanno;
    private Double amount;
    private Date periodfrom;
    private Date periodto;
    private Date transactiondate;
    private Date paymentdate;
    private String statecode;
    private String districtcode;
    private String districtname;
    private String divisioncode;
    private String divisionname;
    private String username;
    private String fullname;
    private String userrole;
    private String scope;
    private String password;
    private int cirncode;
    private String cirname;
    private Date created_dt;
    private String email;
    private String mobile;
    private String purpose;
    private String challanstatus;
    private String isfixed;
    public static int totalrecords;
    private String treasuryheadvarchar;
    private String isregistered;
    private String majortax;
    private String majortaxcode;
    private String taxpurposecode;
    private String majortaxid="" ;
    private String Sl_no;
    private String idproof;
    private String locations;    
    private String branch_name;
    private String anual_id;    
    private String anual_yr;
    private String qrtrmnth_yer;

    public GenericAdminBean(){  
        qrtrmnth_yer="";
        anual_id="";
        anual_yr="";
        idproof="" ;
        Sl_no="" ;
        majortaxid="" ;
        taxpurposecode="" ;
        majortax="" ;
        majortaxcode="" ;
        isregistered="" ;
        treasuryheadvarchar="" ;
        isfixed = "";
        challanstatus = "";
        cirncode = 0;
        cirname = "";
        deptid = "";
        taxid = 0;
        tax = "";
        department = "";
        treasury_head_code = "";
        description = "";
        dlrname = "";
        address = "";
        city = "";
        state = "";
        challanno = "";
        amount = 0.0;
        periodfrom = null;
        periodto = null;
        transactiondate = null;
        paymentdate = null;
        statecode = "";
        districtcode = "";
        districtname = "";
        divisioncode = "";
        divisionname = "";
        scope = "";
        username = "";
        fullname = "";
        userrole = "";
        password = "";
        cirncode = 0;
        cirname = "";
        created_dt = null;
        email = "";
        mobile = "";
        purpose = "";
        locations="";
        branch_name="";
    }

    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }

    public String getDeptid() {
        return deptid;
    }

    public void setTaxid(int taxid) {
        this.taxid = taxid;
    }

    public int getTaxid() {
        return taxid;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public String getTax() {
        return tax;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDepartment() {
        return department;
    }

    public void setTreasury_head_code(String treasury_head_code) {
        this.treasury_head_code = treasury_head_code;
    }

    public String getTreasury_head_code() {
        return treasury_head_code;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
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

    public void setChallanno(String challanno) {
        this.challanno = challanno;
    }

    public String getChallanno() {
        return challanno;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getAmount() {
        return amount;
    }

    public void setPeriodfrom(Date periodfrom) {
        this.periodfrom = periodfrom;
    }

    public Date getPeriodfrom() {
        return periodfrom;
    }

    public void setPeriodto(Date periodto) {
        this.periodto = periodto;
    }

    public Date getPeriodto() {
        return periodto;
    }

    public void setTransactiondate(Date transactiondate) {
        this.transactiondate = transactiondate;
    }

    public Date getTransactiondate() {
        return transactiondate;
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

    public void setDistrictcode(String districtcode) {
        this.districtcode = districtcode;
    }

    public String getDistrictcode() {
        return districtcode;
    }

    public void setDistrictname(String districtname) {
        this.districtname = districtname;
    }

    public String getDistrictname() {
        return districtname;
    }

    public void setDivisioncode(String divisioncode) {
        this.divisioncode = divisioncode;
    }

    public String getDivisioncode() {
        return divisioncode;
    }

    public void setDivisionname(String divisionname) {
        this.divisionname = divisionname;
    }

    public String getDivisionname() {
        return divisionname;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getFullname() {
        return fullname;
    }


    public void setUserrole(String userrole) {
        this.userrole = userrole;
    }

    public String getUserrole() {
        return userrole;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getScope() {
        return scope;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setCirncode(int cirncode) {
        this.cirncode = cirncode;
    }

    public int getCirncode() {
        return cirncode;
    }

    public void setCirname(String cirname) {
        this.cirname = cirname;
    }

    public String getCirname() {
        return cirname;
    }

    public void setCreated_dt(Date created_dt) {
        this.created_dt = created_dt;
    }

    public Date getCreated_dt() {
        return created_dt;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setChallanstatus(String challanstatus) {
        this.challanstatus = challanstatus;
    }

    public String getChallanstatus() {
        return challanstatus;
    }

    public void setIsfixed(String isfixed) {
        this.isfixed = isfixed;
    }

    public String getIsfixed() {
        return isfixed;
    }

    public int getTotalrecords() {
        return totalrecords;
    }

    public void setTreasuryheadvarchar(String treasuryheadvarchar) {
        this.treasuryheadvarchar = treasuryheadvarchar;
    }

    public String getTreasuryheadvarchar() {
        return treasuryheadvarchar;
    }

    public void setIsregistered(String isregistered) {
        this.isregistered = isregistered;
    }

    public String getIsregistered() {
        return isregistered;
    }

    public void setMajortax(String majortax) {
        this.majortax = majortax;
    }

    public String getMajortax() {
        return majortax;
    }

    public void setMajortaxcode(String majortaxcode) {
        this.majortaxcode = majortaxcode;
    }

    public String getMajortaxcode() {
        return majortaxcode;
    }

    public void setTaxpurposecode(String taxpurposecode) {
        this.taxpurposecode = taxpurposecode;
    }

    public String getTaxpurposecode() {
        return taxpurposecode;
    }

    public void setMajortaxid(String majortaxid) {
        this.majortaxid = majortaxid;
    }

    public String getMajortaxid() {
        return majortaxid;
    }

    public void setSl_no(String sl_no) {
        this.Sl_no = sl_no;
    }

    public String getSl_no() {
        return Sl_no;
    }

    public void setIdproof(String idproof) {
        this.idproof = idproof;
    }

    public String getIdproof() {
        return idproof;
    }

    public String getLocations() {
        return locations;
    }

    public void setLocations(String locations) {
        this.locations = locations;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
    }
    
    public String deptValidation(Connection con, GenericAdminBean tbeans) throws Exception {
        Boolean b = false;

        String deptname = tbeans.getDepartment();
        String deptid = tbeans.getDeptid();
        String mtax = tbeans.getMajortax();
        String mtaxcod = tbeans.getMajortaxcode();
        String txtyp = tbeans.getTax();
        String thedcod = tbeans.getTreasury_head_code();
        String idprof = tbeans.getIdproof();

         String nameEx = "^[a-zA-Z ]+$";
        String nameEx11 = "^[a-zA-Z0-9]+$";
        //b = !deptname.matches(nameEx);
        //System.out.println("boolean value is...." + b);
        String msg1 = "Please Fill The Appropriate";
        if ((!deptname.matches(nameEx)) || (deptname == null) || (deptname.equalsIgnoreCase("")) || (deptname.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " Department Name\n";
        }
        return msg1;

    }
    
   public String deptValidationmax(Connection con, GenericAdminBean tbeans) throws Exception {
        Boolean depnm = false;
        Boolean dmaxcd = false;
        Boolean dsrtcd = false;
        String deptname = tbeans.getDepartment();
        String deptid = tbeans.getDeptid();
        String mtax = tbeans.getMajortax();
        String mtaxcod = tbeans.getMajortaxcode();
        String nameEx = "^[a-zA-Z0-9 ]+$";
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        
        depnm = !deptname.matches(nameEx);
        dmaxcd = !mtax.matches(nameEx);
        dsrtcd = !mtaxcod.matches(nameEx);
        System.out.println("boolean value is....");
        String msg1 = "Please Fill The Appropriate";
        if ((!deptname.matches(nameEx11)) || (deptname == null) || (deptname.equalsIgnoreCase("")) || (deptname.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " Department Name \n";
        }

        if ((!mtax.matches(nameEx)) || (mtax == null) || (mtax.equalsIgnoreCase("")) || (mtax.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " MajorTax \n";
        }

        if ((!mtaxcod.matches(nameEx11)) || (mtaxcod == null) || (mtaxcod.equalsIgnoreCase("")) || (mtaxcod.equalsIgnoreCase("#"))) {
            msg1 = msg1 + " MajorTax Code \n";
        }

        return msg1;

    }
   public String deptValidationmaxunlock(Connection con, GenericAdminBean tbeans) throws Exception {
        Boolean depnm = false;
        Boolean dmaxcd = false;
        Boolean dsrtcd = false;
        String deptname = tbeans.getDepartment();
        String deptid = tbeans.getDeptid();
        String mtax = tbeans.getMajortax();
        String mtaxcod = tbeans.getMajortaxcode();
        String nameEx = "^[a-zA-Z ]+$";
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        
        depnm = !deptname.matches(nameEx);
        dmaxcd = !mtax.matches(nameEx);
        dsrtcd = !mtaxcod.matches(nameEx);
        System.out.println("boolean value is....");
        String msg1 = "Please Fill The Appropriate";
        if ((!deptname.matches(nameEx11)) || (deptname == null) || (deptname.equalsIgnoreCase("")) || (deptname.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " Department Name \n";
        }

        if ((!mtax.matches(nameEx)) || (mtax == null) || (mtax.equalsIgnoreCase("")) || (mtax.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " MajorTax \n";
        }

     

        return msg1;

    }
    
      public String deptValidationSubTax(Connection con, GenericAdminBean tbeans) throws Exception {
        String deptname = tbeans.getDepartment();
       // String deptid = tbeans.getDeptid();
        String mtax = tbeans.getMajortaxid();
       // String mtaxcod = tbeans.getMajortaxcode();
        String txtyp = tbeans.getTax();
        String thedcod = tbeans.getTreasury_head_code();
      //  String shcod=tbeans.getTaxpurposecode();
      //  String desc=tbeans.getDescription();
        String nameEx = "^[a-zA-Z0-9 ]+$";
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        String descrpsn = "^[a-zA-Z0-9,.- ]+$";
         String numbr = "^[0-9]+$";
        String msg1 = "Please Fill The Appropriate";
        if (!deptname.matches(nameEx11)) {
            msg1 = msg1 + " Department Name\n";
        }
            
        if (!txtyp.matches(nameEx)) {
            msg1 = msg1 + "  Tax Type\n";
        } 
      
        if (!thedcod.matches(numbr)) {
            msg1 = msg1 + "  Treasury Head Code\n";
        } 
       
        return msg1;

    }//deptValidationModAskAdmin
      
       public String deptValidationAskAdmin(Connection con, GenericAdminBean tbeans) throws Exception {
        String uname = tbeans.getUsername();
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        String msg1 = "Please Fill The Appropriate";
        if (!uname.matches(nameEx11)) {
            msg1 = msg1 + " UserName\n";
        }
          
        return msg1;

    } 
       public String deptValidationModAskAdmin(Connection con, GenericAdminBean tbeans) throws Exception {
        String fnam = tbeans.getFullname();
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        String msg1 = "Please Fill The Appropriate";
        if (!fnam.matches(nameEx11)) {
            msg1 = msg1 + " FullName\n";
        }
        return msg1;

    }
      
       public String deptValidationAdmin(Connection con, GenericAdminBean tbeans) throws Exception {
        String uname = tbeans.getUsername();
        String fulnm = tbeans.getFullname();
         String urol = tbeans.getUserrole();
        String depid = tbeans.getDeptid();
        String bnchlcsn=tbeans.getLocations();
     
        String nameEx = "^[a-zA-Z ]+$";
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        String descrpsn = "^[a-zA-Z0-9,.- ]+$";
         String numbr = "^[0-9]+$";
        String msg1 = "Please Fill The Appropriate";
        if (!uname.matches(nameEx)) {
            msg1 = msg1 + " UserName\n";
        }
           if (!fulnm.matches(nameEx)) {
            msg1 = msg1 + " FullName\n";
        }
            if (!depid.matches(nameEx11)) {
            msg1 = msg1 + "  Department Name\n";
        } 
      
        if (!urol.matches(nameEx11)) {
            msg1 = msg1 + "  Role TO Grant\n";
        }
       
       
        return msg1;

    }
     
     
     public String deptValidationEditSubTax(Connection con, GenericAdminBean tbeans) throws Exception {
        String deptname = tbeans.getDepartment();
        String txtyp = tbeans.getTax();
        String thedcod = tbeans.getTreasury_head_code();
        String nameEx = "^[a-zA-Z ]+$";
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        String descrpsn = "^[a-zA-Z0-9,.- ]+$";
         String numbr = "^[0-9]+$";
        String msg1 = "Please Fill The Appropriate";
        if (!deptname.matches(nameEx11)) {
            msg1 = msg1 + " Department Name\n";
        }
            
        if (!txtyp.matches(nameEx)) {
            msg1 = msg1 + "  Tax Type\n";
        } 
      
        if (!thedcod.matches(numbr)) {
            msg1 = msg1 + "  Treasury Head Code\n";
        }
        return msg1;
            }
      public String deptValidationIdProve(Connection con, GenericAdminBean tbeans) throws Exception {
       
        String deptname = tbeans.getDepartment();
        String deptid = tbeans.getDeptid();
        String idprof = tbeans.getIdproof();

        String nameEx = "^[a-zA-Z ]+$";
        String nameEx11 = "^[a-zA-Z0-9 ]+$";
        String msg1 = "Please Fill The Appropriate";
        if (!deptname.matches(nameEx11)) {
            // b=true;
            msg1 = msg1 + " Department Name \n";
        }

        if (!idprof.matches(nameEx11)) {
            msg1 = msg1 + "  Id Proof \n";
        }

        return msg1;

    }

      public String deptValidatioAdmin(Connection con, GenericAdminBean tbeans, String capcha) throws Exception {

        String uname = tbeans.getUsername();
        String paswword = tbeans.getPassword();
        String nameEx = "^[a-zA-Z ]+$";
       String pwdRegex="^[0-9A-Za-z!@#$%&* ]+$" ;
        String cpcha = "^[a-zA-Z0-9]+$";
         String msg1 = "Please Fill The Appropriate";
        if (!uname.matches(nameEx)) {
            msg1 ="Invalid username or password";
        }

        if (!paswword.matches(pwdRegex)) {
            msg1 ="Invalid username or password";
        }
        if (!capcha.matches(cpcha)) {
            // b=true;
            msg1 = msg1 + " or Captcha \n";
        }
        return msg1;

    }
      
       public String deptValidatioDept(Connection con, GenericAdminBean tbeans, String capcha) throws Exception {
         String uname = tbeans.getUsername();
        String paswword = tbeans.getPassword();
        String depname = tbeans.getDepartment();
         String nameEx = "^[a-zA-Z ]+$";
       String pwdRegex="^[0-9A-Za-z!@#$%&* ]+$" ;
        String cpcha = "^[a-zA-Z0-9]+$";
        
        String msg1 = "Please Fill The Appropriate";
      //  if ((!depname.matches(nameEx))) {
          //  msg1 = msg1 + " Department Name \n";
     //   }

        if ((!uname.matches(nameEx))) {
            msg1 ="Invalid username or password";
        }

        if ((!paswword.matches(pwdRegex))) {
            msg1 ="Invalid username or password";
        }
        if ((!capcha.matches(cpcha))) {
            // b=true;
            msg1 = msg1 + " or Captcha \n";
        }
        return msg1;
    }
public String anualyr(Connection con, GenericAdminBean tbeans) throws Exception {
        Boolean b = false;

        String anualyr = tbeans.getAnual_yr();
       
        // String nameEx = "^[a-zA-Z ]+$";
        String nameEx = "^[0-9-]+$";
        //b = !deptname.matches(nameEx);
        //System.out.println("boolean value is...." + b);
        String msg1 = "Please Fill The Appropriate";
        if ((!anualyr.matches(nameEx)) || (anualyr == null) || (anualyr.equalsIgnoreCase("")) || (anualyr.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " Financial Year\n";
        }
        return msg1;

    }
public String qrtmnthyr(Connection con, GenericAdminBean tbeans) throws Exception {
        Boolean b = false;

        String qrtmnth = tbeans.getQrtrmnth_yer();
       
        // String nameEx = "^[a-zA-Z ]+$";
        String nameEx = "^[0-9]+$";
        //b = !deptname.matches(nameEx);
        //System.out.println("boolean value is...." + b);
        String msg1 = "Please Fill The Appropriate";
        if ((!qrtmnth.matches(nameEx)) || (qrtmnth == null) || (qrtmnth.equalsIgnoreCase("")) || (qrtmnth.equalsIgnoreCase("#"))) {
            // b=true;
            msg1 = msg1 + " Annual Year\n";
        }
        return msg1;

    }
    /**
     * @return the anual_id
     */
    public String getAnual_id() {
        return anual_id;
    }

    /**
     * @param anual_id the anual_id to set
     */
    public void setAnual_id(String anual_id) {
        this.anual_id = anual_id;
    }

    /**
     * @return the anual_yr
     */
    public String getAnual_yr() {
        return anual_yr;
    }

    /**
     * @param anual_yr the anual_yr to set
     */
    public void setAnual_yr(String anual_yr) {
        this.anual_yr = anual_yr;
    }

    /**
     * @return the qrtrmnth_yer
     */
    public String getQrtrmnth_yer() {
        return qrtrmnth_yer;
    }

    /**
     * @param qrtrmnth_yer the qrtrmnth_yer to set
     */
    public void setQrtrmnth_yer(String qrtrmnth_yer) {
        this.qrtrmnth_yer = qrtrmnth_yer;
    }
 
}