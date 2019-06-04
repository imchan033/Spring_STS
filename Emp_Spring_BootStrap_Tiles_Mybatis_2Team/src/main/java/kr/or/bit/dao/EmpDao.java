package kr.or.bit.dao;

import java.util.List;

import kr.or.bit.vo.Emp;

public interface EmpDao {
  List<Emp> selectAllList();
  
  Emp selectByEmpno(int empno);
  
  List<Emp> selectByDeptno(int deptno);
  
  int insertEmp(Emp emp);
 
  int updateEmp(Emp emp);
  
  int deleteEmp(int empno);
}
