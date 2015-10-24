function submitSetting(step, ccp) {
    var smsprovidername = "", smssenderid = "", smshosturl = "", smsport = "", smsusername = "", smspassword = "";
    var emailadds = "", mailserver = "", emailusername = "", emailpassword = "", mailsmtpport = "";
    if(step === "sms"){
        var smsprovidername = document.smssetting.smsprovidername.value;
        var smssenderid = document.smssetting.smssenderid.value;
        var smshosturl = document.smssetting.smshosturl.value;
        var smsport = document.smssetting.smsport.value;
        var smsusername = document.smssetting.smsusername.value;
        var smspassword = document.smssetting.smspassword.value;
        if(smsprovidername === ""){
            alert("Please!Enter Your Sms Provider Name.");
            document.smssetting.smsprovidername.focus();            
        }else if (smssenderid === ""){
            alert("Please! Enter Your Sms Sender Id.");
            document.smssetting.smssenderid.focus(); //,,,,,
        }else if (smshosturl === "") {
            alert("Please! Enter Your Sms Host Url.");
            document.smssetting.smshosturl.focus();
        }else if (smsport === "") {
            alert("Please! Enter Your Sms Port.");
            document.smssetting.smsport.focus();
        }else if(smsusername === ""){
            alert("Please! Enter Your Sms UserName.");
            document.smssetting.smsusername.focus();
        }else if (smspassword === "") {
            alert("Please! Enter Your Sms Password.");
            document.smssetting.smspassword.focus();
        }else{
            var userdata={step: step, smsprovidername:smsprovidername, smssenderid:smssenderid, smshosturl:smshosturl, smsport:smsport, smsusername:smsusername, smspassword:smspassword};
            $.ajax({
                type: "POST",
                url: ccp+"/genericsettings",
                data: userdata
            }).done(function(data){                
                if(data==="success"){
                    $("#settingmsg").css("display", "none");//msgupld
                    $("#msgupld").css("display", "none");
                    $("#settingsuccessmsg").css("display", "block");
                    $("#settingsuccessmsg").text('SMS Setting Process Completed Successfully');
                }else{
                    $("#settingsuccessmsg").css("display", "none");
                    $("#msgupld").css("display", "none");
                    $("#settingmsg").css("display", "block");
                    $("#settingmsg").text(data);
                }
            });
        }
    }else if (step === "email"){/*Email Setting starts*/
        emailadds = document.mailsetting.emailadds.value;
        mailserver = document.mailsetting.mailserver.value;
        emailusername = document.mailsetting.emailusername.value;
        emailpassword = document.mailsetting.emailpassword.value;
        mailsmtpport = document.mailsetting.mailsmtpport.value;
        if (emailadds === "") {
            document.mailsetting.emailadds.focus();
            alert("Please!Enter Your EMail Address.");
        } else if (mailserver === "") {
            alert("Please! Enter Your Mal Server.");
            document.mailsetting.mailserver.focus();
        }else if (emailusername === "") {
            alert("Please! Enter Your User Name.");
            document.mailsetting.emailusername.focus();
        }else if (emailpassword === "") {
            alert("Please! Enter Your Passwword.");
            document.mailsetting.emailpassword.focus();
        }else if (mailsmtpport === "") {
            alert("Please! Enter Your SMTP Port.");
            document.mailsetting.mailsmtpport.focus();
        }else{
            $.ajax({
                type: "POST",
                url: ccp+"/genericsettings",
                data:{
                    step:step, emailadds:emailadds, mailserver:mailserver, emailusername:emailusername,
                        emailpassword:emailpassword, mailsmtpport:mailsmtpport }
                }).done(function(data){
                  
                    if(data==='success'){
                       $("#settingmsg").css("display", "none");
                       $("#msgupld").css("display", "none");
                        $("#settingsuccessmsg").css("display", "block");
                        $("#settingsuccessmsg").text('Email Setting Process Completed Successfully');
                    }else{
                      $("#settingsuccessmsg").css("display", "none");
                      $("#msgupld").css("display", "none");
                        $("#settingmsg").css("display", "block");
                        $("#settingmsg").text(data);
                    }
                });
        }
    } else if (step === "upload") {
        var logo = document.generalsetting.logo.value;
        var banner = document.generalsetting.banner.value;
        if (logo === "") {
            document.generalsetting.logo.focus();
            alert("Please!Upload Your Logo.");
        }else if (banner === ""){
            alert("Please! Upload Your Banner.");
            document.generalsetting.bannner.focus();
        }else{            
            document.generalsetting.step.value = step;
            document.generalsetting.method = 'POST';
            document.generalsetting.enctype = "multipart/form-data",
            document.generalsetting.action =  ccp+"/genericsettings",
            document.generalsetting.submit();
        }
    }else if (step === "banner"){
        var banner1 = document.bannersetting.banner1.value;
        var banner2 = document.bannersetting.banner2.value;
        var copyright = document.bannersetting.copyright.value;
        var version = document.bannersetting.version.value;
        var terms = document.bannersetting.terms.value;
        var contact = document.bannersetting.contact.value;
        if (banner1 === "") {
            document.bannersetting.banner1.focus();
            alert("Please!Enter Your Banner1.");
        }else if (banner2 === ""){
            alert("Please! Enter Your Banner2.");
            document.bannersetting.banner2.focus();
        }else if (copyright === "") {
            alert("Please! Enter Your Copyright.");
            document.bannersetting.copyright.focus();
        }else if (version === "") {
            alert("Please! Enter Your Version.");
            document.bannersetting.version.focus();
        }else if (terms === "") {
            alert("Please! Enter Your Terms.");
            document.bannersetting.terms.focus();
        }else if (contact === "") {
            alert("Please! Enter Your Contact US.");
            document.bannersetting.contact.focus();
        }else{
            $.ajax({
                type: "POST",
                url: ccp+"/genericsettings",
                data: {
                step:step, banner1:banner1, banner2:banner2, copyright:copyright,
                    version:version, terms:terms, contact:contact }
            }).done(function(data){
                if(data==='success'){
                       $("#settingmsg").css("display", "none");
                       $("#msgupld").css("display", "none");
                        $("#settingsuccessmsg").css("display", "block");
                        $("#settingsuccessmsg").text('Banner Setting Process Completed Successfully');
                    }else{
                      $("#settingsuccessmsg").css("display", "none");
                      $("#msgupld").css("display", "none");
                        $("#settingmsg").css("display", "block");
                        $("#settingmsg").text(data);
                    }
            });
        }
    }else if (step === "billdesk") {
        var chksum = document.billdesksetting.chksum.value;
        var url = document.billdesksetting.url.value;
        var merchantid = document.billdesksetting.merchantid.value;
        var securityid = document.billdesksetting.securityid.value;
        var responseurl = document.billdesksetting.responseurl.value;
        if(chksum === ""){
            document.billdesksetting.chksum.focus();
            alert("Please!Enter Your CheckSum.");
        }else if(url === ""){
            alert("Please! Enter Your URL.");
            document.billdesksetting.url.focus();
        }else if (merchantid === ""){
            alert("Please! Enter Your Merchant Id.");
            document.billdesksetting.merchantid.focus();
        }else if (securityid === "") {
            alert("Please! Enter Your Security Id.");
            document.billdesksetting.securityid.focus();
        }else if (responseurl === "") {
            alert("Please! Enter Your Response Url.");
            document.billdesksetting.responseurl.focus();
        }else{
            $.ajax({
                type: "POST",
                url: ccp+"/genericsettings",
                data:{ step:step, chksum:chksum, url:url, merchantid:merchantid, securityid:securityid,
                    responseurl:responseurl }
            }).done(function(data){
                if(data==='success'){
                        
                        $("#settingmsg").css("display", "none");
                        $("#msgupld").css("display", "none");
                        $("#settingsuccessmsg").css("display", "block");
                        $("#settingsuccessmsg").text('BillDesk Setting Process Completed Successfully');
                    }else{
                       $("#settingsuccessmsg").css("display", "none");
                       $("#msgupld").css("display", "none");
                        $("#settingmsg").css("display", "block");
                        $("#settingmsg").text(data);
                    }
            });
        }
    } else if (step === "mesages") {
        var mesages = document.mesageSeting.mesages.value;
        var emlmesages = document.mesageSeting.emlmesages.value;
        if (mesages === "") {
            document.mesageSeting.mesages.focus();
            alert("Please!Enter your Sms Template.");
        }else if (emlmesages === ""){
            alert("Please! Enter a Mail Template.");
            document.mesageSeting.emlmesages.focus();
        }else{
            
            $.ajax({
                type: "POST",
                url: ccp+"/genericsettings",
                data:{ step:step, mesages:mesages, emlmesages:emlmesages }
            }).done(function(data){
                if(data==='success'){
                        
                        $("#settingmsg").css("display", "none");
                        $("#msgupld").css("display", "none");
                        $("#settingsuccessmsg").css("display", "block");
                        
                        $("#settingsuccessmsg").text('Message Setting Process Completed Successfully');
                    }else{
                        $("#settingsuccessmsg").css("display", "none");
                        $("#msgupld").css("display", "none");
                        $("#settingmsg").css("display", "block");
                        $("#settingmsg").text(data);
                    }
            });
        }

    }
   
}

        