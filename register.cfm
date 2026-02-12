

<cfif structKeyExists(form, "submit") and structKeyExists(form, "terms")>

        <!--- Upload Image --->
        <cfset imagePath = "">

        <cfif structKeyExists(form, "myfile") AND len(form.myfile)>
            <cfset path ="C:\ColdFusion2018\cfusion\wwwroot\Ak\upload">
            <cffile 
                action="upload"
                filefield="myfile"
                destination="#path#"
                nameconflict="makeunique"
                result="fileUpload">

            <cfset imagePath = "C:/ColdFusion2018/cfusion/wwwroot/Ak/upload/#fileUpload.clientFile#">
        </cfif>
        
        <!--- Hash Password --->
        <cfset hashedPassword = hash(form.Password, "SHA-256")>

        <!--- Insert into MySQL --->
        <cfquery datasource="registrationDS">
            INSERT INTO users (
                title,
                first_name,
                last_name,
                position,
                company,
                image_path,
                registration_date,
                phone,
                email,
                password
                
            )
            VALUES (
                <cfqueryparam value="#form.Title#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.last_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.Position#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.company#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#imagePath#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.mydate#" cfsqltype="cf_sql_date">,
                <cfqueryparam value="#form.Number#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>

        <h2>Registration Successful!</h2> 
   
<cfelse>
    not clicked submit
</cfif>
