<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function() {
    //유효성 검사

    $('#exit').click(function() {
      $("#formContent").remove();
    });
    $('#exit').mouseout(function() {
      $('#exit').css("color", "black");
    });
    $("#exit").mouseover(function() {
      $("#exit").css("color", "#B24BE5");
    })

    $("#insertbtn").click(function() {
      if ($("#empno").val() == "") {
        alert("사원번호 입력");
        $("#empno").focus();
        return false;
      } else if ($("#ename").val() == "") {
        alert("사원이름 입력");
        $("#ename").focus();
        return false;
      } else if ($("#job").val() == "") {
        alert("job입력");
        $("#job").focus();
        return false;
      } else if ($("#mgr").val() == "") {
        alert("mgr입력");
        $("#mgr").focus();
        return false;
      } else if ($("#hiredate").val() == "") {
        alert("hiredate입력");
        $("#hiredate").focus();
        return false;
      } else if ($("#sal").val() == "") {
        alert("sal입력");
        $("#sal").focus();
        return false;
      } else if ($("#comm").val() == "") {
        alert("comm입력");
        $("#comm").focus();
        return false;
      } else if ($("#deptno").val() == "") {
        alert("deptno입력");
        $("#deptno").focus();
        return false;
      } else {
        $('#insertform').submit();
      }

    });

  });
</script>

<%-- <jsp:include page="/common/header.jsp"></jsp:include> --%>
<br>
<br>
<br>
<div class="wrapper fadeInDown" style="height: 857px;">
  <div id="formContent">

    <div class="fadeIn first">
      <br> <br>
      <div style="column-count: 2">
        <h3 style="position: relative; left: 580px;">사원 등록</h3>
      </div>
      <form id="insertform" name="insertform" method="post">
        <table class="table"
          style="width: 400px; margin-left: auto; margin-right: auto;">

          <tr>
            <th>사번</th>
            <td><input type="text" class="form-control"
              name="empno" id="empno" style="width: 280px;"></td>
          </tr>
          <tr>
            <th>이름</th>
            <td><input type="text" class="form-control"
              name="ename" id="ename" style="width: 280px;"></td>
          </tr>
          <tr>
            <th>직책</th>
            <td><input type="text" class="form-control" name="job"
              id="job" style="width: 280px;"></td>
          </tr>
          <tr>
            <th>담당자</th>
            <td><input type="text" class="form-control" name="mgr"
              id="mgr" style="width: 280px;"></td>
          </tr>
          <tr>
            <th>입사일</th>
            <td><input type="text" class="form-control"
              name="hiredate" id="hiredate" style="width: 280px;"></td>
          </tr>
          <tr>
            <th>급여</th>
            <td><input type="text" class="form-control" name="sal"
              id="sal" style="width: 280px;"></td>
          </tr>
          <tr>
            <th>수당</th>
            <td><input type="text" class="form-control" name="comm"
              id="comm" style="width: 280px;"></td>
          </tr>
          <tr>
            <th>부서번호</th>
            <td><input type="text" class="form-control"
              name="deptno" id="deptno" style="width: 280px;"></td>
          </tr>
          <tr>
            <td colspan="2">
              <p style="column-count: 2; text-align: center">
                <input type="button" value="사원등록" id="insertbtn"
                  class="btn btn-primary btn-lg"
                  style="width: 100px;" />
              </p>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>