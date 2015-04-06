<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<title> <tiles:getAsString name="title" /> </title>
</head>
<body role="document">
	
	<div class="container" style="padding-top: 70px; text-align: center;" >
		<tiles:insertAttribute name="header" />
	
		<div class="jumbotron" >			
			<tiles:insertAttribute name="content" />
		</div>
		
		<tiles:insertAttribute name="footer" />
			
	</div>
</body>
</html>