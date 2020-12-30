<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			th {
				background-color: #A52A2A
			}
			body {
				background: #cde3e4;
			}
		</style>
	</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
// String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "magazin";
	String userId = "root";
	String password = "";
/*
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
*/
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
/*
	2	id	int(10)
	3	preke	varchar(256)
	4	id_grupes	int(10)
	5	barkodas	varchar(20)
	6	data	date	
	7	kiekis	decimal(10,2)	
	8	id_rinkos 	int(10)
	9	vnt_kaina 	decimal(10,2)
	10	id_prekes  	int(10)
	11	id_tiekejo  	int(10)
	12	nuo_datos  	date
	13	iki_datos  	date
	14	grupe  	varchar(32)
	15	reiksme 	varchar(64)
	16	tiekejas 	varchar(256)
	17	kontaktai 	varchar(1024)

*/
%>
<form method="post" action="">
<table>
<tr>
<th>Vvedite mesiac</th>
<tr>

		<td>
			<label for="men"><b>2013-</label>
			<input type="number" id = "men" name="mesiac" value="">
		</td>
		<td>
			<input type="submit" name="search" value="search">
		</td>
</tr>
</table>
</form>
<h2 align="center"><strong>Retrieve data from database in jsp</strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
	<th>preke</th>
	<th>prekiu grupe</th>
	<th>kiekis gauta</th>
	<th>suma gauta</th>
	<th>kiekis parduota</th>
	<th>suma parduota</th>
</tr>

<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		String rez_vvoda = request.getParameter("search");
		if ( rez_vvoda != null) {
		
			String	mesiac = 	request.getParameter("mesiac");
		
		statement=connection.createStatement();		
		String sql = " SELECT `preke`, `reiksme`, SUM( DISTINCT `prekes_gavimai`.`kiekis`), SUM( DISTINCT `prekes_gavimai`.`kiekis` * `prekes_gavimai`.`vnt_kaina`), SUM(`prekes_pardavimai`.`kiekis`), SUM(`prekes_pardavimai`.`kiekis` * `prekes_pardavimai`.`vnt_kaina`)" 
		+ " FROM `prekes_tiekejai`" 
		+ " LEFT JOIN `prekes`" + " ON `prekes`.`id` = `prekes_tiekejai`.`id_prekes`" 
		+ " LEFT JOIN `selektoriai`" + " ON `prekes`.`id_grupes` = `selektoriai`.`id`" 
		+ " LEFT JOIN `prekes_gavimai`" + " ON `prekes_tiekejai`.`barkodas` = `prekes_gavimai`.`barkodas`" 
		+ " LEFT JOIN `prekes_pardavimai`" + " ON `prekes_pardavimai`.`id_prekes_gavimo` = `prekes_gavimai`.`id`" 
		+ " WHERE month(`prekes_gavimai`.`data`) = '" + mesiac + "'" 
		+ " GROUP BY `id_prekes`";

		resultSet = statement.executeQuery(sql);
		}

		while( resultSet.next() ){
%>
<tr style="background-color: #DEB887">
	<td><%= resultSet.getString ( "preke" ) %></td>
	<td><%= resultSet.getString ( "reiksme" ) %></td>
	<td><%= resultSet.getString ( "SUM( DISTINCT `prekes_gavimai`.`kiekis`)" ) %></td>
	<td><%= resultSet.getString ( "SUM( DISTINCT `prekes_gavimai`.`kiekis` * `prekes_gavimai`.`vnt_kaina`)" ) %></td>
	<td><%= resultSet.getString ( "SUM(`prekes_pardavimai`.`kiekis`)" ) %></td>
	<td><%= resultSet.getString ( "SUM(`prekes_pardavimai`.`kiekis` * `prekes_pardavimai`.`vnt_kaina`)" ) %></td>
<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>
</body>