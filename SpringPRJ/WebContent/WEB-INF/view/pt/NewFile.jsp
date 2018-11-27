<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
  <style>
.pdfobject-container { height: 500px;}
.pdfobject { border: 1px solid #666; }
</style>
</head>
<body>
		
<div id="embed">pdf</div>

	 <script src="/js/pdfobject.js"></script>

	
<script>PDFObject.embed("C:/Users/data12/git/SpringPRJ/WebContent/presentationPDF/LAN.pdf","#embed");</script>
</body>
</html>