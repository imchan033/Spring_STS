<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="table">
  <!-- 회원검색 -->
  <div id="controllselect">
    <select class="form-control" id=searchType style="float: left"
      onchange="myFunction()">
      <option value="#">선택해주세요</option>
      <option value="empno">사원번호</option>
      <option value="deptno">부서번호</option>
    </select>
    <div style="display: block" id="one">
      <form action="searchEmpByEmpno.do" method="post">
        <input type="text" name="empno" id="empno" class="form-control"
          placeholder="사원번호를 입력하세요" /> <input type="submit" value="검색"
          id="searchbtn" class="btn btn-primary btn-lg" />
      </form>
    </div>

    <div style="display: none" id="two">
      <form action="searchEmpByDeptno.do" method="post">
        <input type="text" name="deptno" id="deptno"
          placeholder="부서번호를 입력하세요" /> <input type="submit" value="검색"
          id="searchbtn" class="btn btn-primary btn-lg" />
      </form>
    </div>
  </div>
</div>
<hr>

<div id="four">
  <div id="tablediv">
    <table class="table table-hover">

      <tr class="table-primary">
        <td><b>사원번호</b></td>
        <td><b>사원이름</b></td>
        <td><b>직업</b></td>
        <td><b>관리자</b></td>
        <td><b>입사일</b></td>
        <td><b>연봉</b></td>
        <td><b>수당</b></td>
        <td><b>부서명</b></td>
      </tr>

      <c:set var="emp" value="${requestScope.EmpListByEmpno}"></c:set>
      <tr class="table-primary">
        <td>${emp.empno}</td>
        <td>${emp.ename}</td>
        <td>${emp.job}</td>
        <td>${emp.mgr}</td>
        <td>${emp.hiredate}</td>
        <td>${emp.sal}</td>
        <td>${emp.comm}</td>
        <td>${emp.deptno}</td>
      </tr>

      <c:forEach items="${requestScope.EmplistByDeptno}" var="list">

        <tr class="table-primary">
          <td>${list.empno}</td>
          <td>${list.ename}</td>
          <td>${list.job}</td>
          <td>${list.mgr}</td>
          <td>${list.hiredate}</td>
          <td>${list.sal}</td>
          <td>${list.comm}</td>
          <td>${list.deptno}</td>
        </tr>
      </c:forEach>
    </table>
    <script type="text/javascript">
          function myFunction() {

            var type = document.getElementById("searchType").value;

            if (type == "empno") {
              document.getElementById("one").style.display = "block";
              document.getElementById("two").style.display = "none";
              document.getElementById("three").style.display = "block";
              document.getElementById("four").style.display = "none";
            } else if (type == "deptno") {
              document.getElementById("two").style.display = "block";
              document.getElementById("one").style.display = "none";
              document.getElementById("four").style.display = "block";
              document.getElementById("three").style.display = "none";
            }

          }
        </script>