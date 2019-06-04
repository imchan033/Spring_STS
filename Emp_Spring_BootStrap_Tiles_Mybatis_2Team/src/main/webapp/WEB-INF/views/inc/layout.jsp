<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<tiles:insertAttribute name="head" />
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <tiles:insertAttribute name="top" />
  </nav>
  <div>
  <tiles:insertAttribute name="content" />
  </div>
</body>
</html>