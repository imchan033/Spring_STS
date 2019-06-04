package kr.or.bit.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.bit.dao.EmpDao;
import kr.or.bit.vo.Emp;

@Controller
public class EmpController {
  private SqlSession sqlSession;

  @Autowired
  public void setSqlSession(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
  }

  @RequestMapping("index.do")
  public String index() {
    return "index.do";
  }

  @RequestMapping("loginOk.do")
  public String checkLogin(String id, String pwd) {
    if (id.equals("admin") && pwd.equals("1004")) {
      return "redirect:main.do";
    } else {
      return "redirect:index.do";
    }
  }

  @RequestMapping("main.do")
  public String showMainPage(Model model) {
    EmpDao empDao = sqlSession.getMapper(EmpDao.class);
    List<Emp> emplist = empDao.selectAllList();
    model.addAttribute("emplist", emplist);

    return "main.do";
  }

  @RequestMapping("search.do")
  public String showSearchPage() {
    return "Select.do";
  }

  @RequestMapping(value="add.do", method = RequestMethod.GET)
  public String showInsertPage() {
    return "Insert.do";
  }
  
  @RequestMapping(value="add.do", method = RequestMethod.POST)
  public String insertEmp(Emp emp) {
    EmpDao empDao= sqlSession.getMapper(EmpDao.class);
    
    empDao.insertEmp(emp);
    
    return "redirect:main.do";
  }

  @RequestMapping("chart.do")
  public String showChartPage() {
    return "Chart.do";
  }

  @RequestMapping(value="updateEmp.do", method=RequestMethod.GET)
  public String showUpdatePage(int editno, Model model) {
    EmpDao empDao = sqlSession.getMapper(EmpDao.class);
    Emp emp = empDao.selectByEmpno(editno);
    
    model.addAttribute("empno", emp);
    
    return "Update.do";
  }
  
  @RequestMapping(value="updateEmp.do", method=RequestMethod.POST)
  public String updateEmp(Emp emp, HttpServletRequest request) {
    EmpDao empDao = sqlSession.getMapper(EmpDao.class);
    CommonsMultipartFile file = emp.getFile();
    
    String fileName = file.getOriginalFilename();
    
    String path = request.getServletContext().getRealPath("img");

    String uploadPath= path+"\\"+fileName;
    FileOutputStream fos=null;
    try {
      fos = new FileOutputStream(uploadPath);
      fos.write(file.getBytes());
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      try {
        fos.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
      
    }
    emp.setFilepath(fileName);
    empDao.updateEmp(emp);
    return "redirect:main.do";
  }
  
  @RequestMapping("searchEmpByEmpno.do")
  public String searchByEmpno(int empno, Model model) {
    EmpDao empDao = sqlSession.getMapper(EmpDao.class);
    Emp emp = empDao.selectByEmpno(empno);
    
    model.addAttribute("EmpListByEmpno", emp);
    return "Select.do";
  }
  
  @RequestMapping("searchEmpByDeptno.do")
  public String searchByDeptno(int deptno, Model model) {
    EmpDao empDao = sqlSession.getMapper(EmpDao.class);
    List<Emp> emplist = empDao.selectByDeptno(deptno);
    
    model.addAttribute("EmplistByDeptno", emplist);
    return "Select.do";
  }
  @RequestMapping("DeleteEmp.do")
  public String deleteEmp(int empno) {
    EmpDao empDao = sqlSession.getMapper(EmpDao.class);
    empDao.deleteEmp(empno);
    return "redirect:main.do";
  }
  
 
}
