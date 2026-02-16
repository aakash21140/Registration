

<cfif structKeyExists(form, "terms")>
    <cfparam name="form.Email" default="">
    <cfparam name="form.first_name" default="">
    <cfparam name="form.last_name" default="">
    <cfparam name="form.Password" default="">
    
    <cfparam name="emailError" default="">
    <cfparam name="successMessage" default="">
    <cfparam name="imagePath" default="">


    <cfset destinationPath = "C:/ColdFusion2018/cfusion/wwwroot/Ak/upload">
   <cffile 
    action="upload"
    fileField="myFile"
    destination="#destinationPath#"
    nameConflict="overwrite"
    result="uploadResult">

    
    
        <!--- Check if email already exists --->
        <cfquery name="checkEmail" datasource="registrationDS">
            SELECT email 
            FROM users 
            WHERE email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
        </cfquery>


        
        <!--- Email already exists --->
        <cfset emailError = "Email is already registered">

        
        <!--- Your existing upload + insert code here --->
        <cfset hashedPassword = hash(form.Password, "SHA-256")>
        

       <cfquery datasource="registrationDS">
        INSERT INTO users (
            title, first_name, last_name, position, company, 
            image_path, registration_date, phone, email, password
        )
        VALUES (
            <cfqueryparam value="#form.Title#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.last_name#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.Position#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.company#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#uploadResult.serverfile#" cfsqltype="cf_sql_varchar" >,
            <cfqueryparam value="#form.mydate#" cfsqltype="cf_sql_date">,
            <cfqueryparam value="#form.Number#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar">
        )
         </cfquery> 
        <h2>Registration Successful!</h2>

    

</cfif>
