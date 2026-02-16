<cfparam name="form.Email" default="">
<cfparam name="form.Password" default="">
<cfparam name="form.remember" default="0">

<cfset loginError = "">

<cfif structKeyExists(form, "Email") AND structKeyExists(form, "Password")>

    <cfquery name="getUserByEmail" datasource="registrationDS">
        SELECT id, first_name, last_name, email, password
        FROM users
        WHERE email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <cfif getUserByEmail.recordCount EQ 0>

        <cfset loginError = "Invalid email or password">

    <cfelse>

        <cfset hashedPassword = hash(form.Password, "SHA-256")>

        <cfif hashedPassword EQ getUserByEmail.password>

            <!--- Login successful --->
            <cfset session.userID = getUserByEmail.id>
            <cfset session.userName = getUserByEmail.first_name & " " & getUserByEmail.last_name>
            <cfset session.email = getUserByEmail.email>

            <!--- Remember Me --->
            <cfif form.remember EQ "1">
                <cfcookie name="rememberMe" value="#session.userID#" expires="30">
            </cfif>

            <cflocation url="dashboard.cfm">

        <cfelse>

            <cfset loginError = "Invalid email or password">

        </cfif>

    </cfif>

</cfif>
