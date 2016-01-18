<!--- 
 *
 * Copyright (c) 2014, the Railo Company Ltd. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either 
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public 
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 * 
 ---><cfcomponent extends="types.Driver" implements="types.IDatasource">
	<cfset fields=array(
		field("Class","class","",true,"The class that implement the Driver"),
		field("Bundle name","bundleName","",false,"The OSGi bundle name of the Driver, only necessary if the jar is OSGi based."),
		field("Bundle version","bundleVersion","",false,"The OSGi bundle version of the Driver, only necessary if the driver is OSGi based."),
		field("Connection String","dsn","",true,"The Datasource Connection String")
	)>
	
	<cfset this.className="">
	<cfset this.type.port=this.TYPE_HIDDEN>
	<cfset this.type.host=this.TYPE_HIDDEN>
	<cfset this.type.database=this.TYPE_HIDDEN>
	<cfset this.data.classname="">
	<cfset this.data.dsn="ddd">
	
	<cffunction name="onBeforeUpdate" returntype="void" output="no">
		<cfset this.class=form.custom_class>
		<cfset StructDelete(form,'custom_class')>
		<cfset this.dsn=form.custom_dsn>
		<cfset StructDelete(form,'custom_dsn')>
	</cffunction>

	<cffunction name="init" returntype="void" output="no">
		<cfargument name="data" required="yes" type="struct">
		<cfif not structKeyExists(data,"classname")>
			<cfset data.classname="">
		</cfif>
		<cfif not structKeyExists(data,"dsn")>
			<cfset data.dsn="">
		</cfif>
		<cfset fields=array(
			field("Class","class",data.classname,true,"The class that implement the Driver"),
			field("Connection String","dsn",data.dsn,true,"The Datasource Connection String")
		)>
		
	</cffunction>
		
	<cffunction name="getName" returntype="string" output="no"
		hint="returns display name of the driver">
		<cfreturn "Other - JDBC Driver">
	</cffunction>
	
	<cffunction name="getDescription" returntype="string" output="no"
		hint="returns description for the driver">
		<cfreturn "Connect with a user supplied JDBC Driver available on the system.">
	</cffunction>
	
	<cffunction name="getFields" returntype="array" output="no"
		hint="returns array of fields">
		<cfreturn fields>
	</cffunction>
	
	
	<cffunction name="equals" returntype="boolean" output="false"
		hint="always returns false">
		
		<cfargument name="className"	required="true">
		<cfargument name="dsn"			required="true">
		
		<cfreturn false>
	</cffunction>
	
</cfcomponent>