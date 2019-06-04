<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="listtable">
  <br>
  <div id="tablediv">
    <table class="table table-hover" border="1">
      <thead>
        <tr>
          <th>사원 번호</th>
          <th>사원 이름</th>
          <th>사원 직책</th>
          <th>담당 선임</th>
          <th>입사일</th>
          <th>월급</th>
          <th>추가급여</th>
          <th>부서번호</th>
          <th>수정</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="list" items="${requestScope.emplist}">
          <tr class="table-primary" id="row">
            <td>${list.empno }</td>
            <td><a href="img/${list.filepath}" id="namephoto">${list.ename }</a></td>
            <td>${list.job }</td>
            <td>${list.mgr }</td>
            <td>${list.hiredate}</td>
            <td>${list.sal }</td>
            <td>${list.comm }</td>
            <td>${list.deptno }</td>
            <td>
              <form action="updateEmp.do" method="get" id="editform">
                <input type="submit" class="btn btn-outline-primary"
                  name="edit" id="edit" value="수정"> <input
                  type="hidden" name="editno" id="editno"
                  value="${list.empno}">
              </form>
            </td>
            <td>
              <form action="DeleteEmp.do?empno=${list.empno}" method="get"
                id="deleteform">
                <input type="submit" class="btn btn-outline-primary"
                  name="delete" id="delete" value="삭제"> <input
                  type="hidden" name="delno${var.index}"
                  id="delno${var.index }" value="${list.empno }">
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>