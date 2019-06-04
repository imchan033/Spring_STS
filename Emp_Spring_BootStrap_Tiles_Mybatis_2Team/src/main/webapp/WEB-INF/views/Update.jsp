<%@page import="kr.or.bit.vo.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper fadeInDown" style="height: 1114px;">
  <div id="formContent">
    <br> <br>
    <div class="fadeIn first">
      <div style="column-count: 2">
        <h3 style="position: relative; left: 580px;">사원 수정</h3>
      </div>
      <form method="post" enctype="multipart/form-data" id="insertform" name="insertform">
        <table class="table"
          style="width: 400px; margin-left: auto; margin-right: auto;">
          <tr>
            <th></th>
            <td><input type="file" id="file" name="file"></td>
          </tr>
          <tr>
            <th></th>
            <td><img
              src="
              <c:choose>
		 	    <c:when test="${empno.filepath != null }"><%=request.getContextPath()%>/img/${empno.filepath}</c:when>
		 	    <c:when test="${empno.filepath == '/img/'}"><%=request.getContextPath()%>/img/${empno.filepath}</c:when>
		 	    <c:otherwise>img/default.jpg</c:otherwise>
		      </c:choose>"
              style="width: 110px; height: 112px;"></td>
          </tr>
          <tr>
            <th>사원번호:</th>
            <td><input type="text" name="empno" id="empno"
              style="width: 280px; background-color: white;"
              value="${empno.empno}" readonly="readonly"></td>
          </tr>
          <tr>
            <th>사원이름:</th>
            <td><input type="text" name="ename" id="ename"
              style="width: 280px;" value="${empno.ename}"
              autofocus="autofocus"></td>
          </tr>
          <tr>
            <th>직책:</th>
            <td><input type="text" name="job" id="job"
              style="width: 280px;" value="${empno.job}"></td>
          </tr>
          <tr>
            <th>담당자(사원번호):</th>
            <td><input type="text" name="mgr" id="mgr"
              style="width: 280px;" value="${empno.mgr}"></td>
          </tr>
          <tr>
            <th>입사일:</th>
            <td><input type="text" name="hiredate" id="hiredate"
              style="width: 280px; background-color: white"
              value="${empno.hiredate}" readonly></td>
          </tr>
          <tr>
            <th>급여:</th>
            <td><input type="text" name="sal" id="sal"
              style="width: 280px;" value="${empno.sal}"></td>
          </tr>
          <tr>
            <th>수당:</th>
            <td><input type="text" name="comm" id="comm"
              style="width: 280px;" value="${empno.comm}"></td>
          </tr>
          <tr>
            <th>부서번호:</th>
            <td><input type="text" name="deptno" id="deptno"
              style="width: 280px;" value="${empno.deptno}"></td>
          </tr>
          <tr>
            <td colspan="2">
              <p style="column-count: 2; text-align: center">
                <input type="submit" class="btn btn-primary btn-lg"
                  value="수정완료" id="insertbtn"
                  style="width: 100px; float: left;" /> <input
                  type="reset" class="btn btn-primary btn-lg"
                  value="입력취소" id="cancle" style="width: 100px;" />
              </p>
            </td>

          </tr>
        </table>

      </form>
    </div>
  </div>
</div>