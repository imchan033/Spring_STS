<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>


<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function() {

    var ename = new Array();
    var sal = new Array();

    $.getJSON("ChartEmp.do", function(data) {
      console.log("자테스트해보자!");

      var deptno = data.emplist;

      console.log(deptno);

      $.each(deptno, function(key, val) {
        ename[key] = val.ename;
        sal[key] = val.sal;
      });

      Highcharts.chart('container', {
        chart : {
          type : 'column',
          options3d : {
            enabled : true,
            alpha : 10,
            beta : 25,
            depth : 70
          }
        },
        title : {
          text : '사원별 급여 차트'
        },
        subtitle : {
          text : 'Team 2'
        },
        plotOptions : {
          column : {
            depth : 25
          }
        },
        xAxis : {
          categories : ename,
          labels : {
            skew3d : true,
            style : {
              fontSize : '16px'
            }
          }
        },
        yAxis : {
          title : {
            text : null
          }
        },
        series : [ {
          name : '연봉',
          data : sal
        } ]
      });
    });
  });
</script>
<style type="text/css">
#container {
  height: 400px;
  min-width: 310px;
  max-width: 800px;
  margin: 0 auto;
}
</style>
</head>
<body>
  <div id="container" style="height: 400px"></div>
</body>
</html>
