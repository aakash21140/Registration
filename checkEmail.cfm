<cfsetting enablecfoutputonly="true">

<cfparam name="form.Email" default="">

<cfquery name="checkEmail" datasource="registrationDS">
    SELECT email
    FROM users
    WHERE email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfset result = {
    "exists" = (checkEmail.recordCount GT 0)
}>

<cfcontent type="application/json" reset="true">
<cfoutput>#serializeJSON(result)#</cfoutput>
