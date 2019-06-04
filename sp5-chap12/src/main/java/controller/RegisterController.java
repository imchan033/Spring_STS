package controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.DuplicateMemberException;
import spring.MemberRegisterService;
import spring.RegisterRequest;

@Controller
public class RegisterController {
  private MemberRegisterService memberRegisterService;
  
  public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
    this.memberRegisterService = memberRegisterService;
  }
  
  @RequestMapping("/register/step1")
  public String handleStep1() {
    return "register/step1";
  }
  
  @PostMapping("/register/step2")
  public String handleStep2(@RequestParam(value = "agree", defaultValue = "false") boolean agree, Model model) {
    if (!agree) {
      return "/register/step1";
    }
    model.addAttribute("registerRequest", new RegisterRequest());
    return "register/step2";
  }
  
  @GetMapping("/register/step2")
  public String handleStep2Get() {
    return "redirect:/register/step1";
  }
  
  @PostMapping("/register/step3")
  public String handleStep3(@Valid RegisterRequest regReq, Errors errors) { // !중요: errors는 반드시 커맨드 객체 뒤에 위치, 앞에 있으면 에러
    if (errors.hasErrors()) { // hasErrors(): 객체에 에러가 있는지(=rejectValue()가 실행되었는지) 검사
      return "register/step2"; // 에러가 있으면 이전 페이지로 다시
    }
    
    try {
      memberRegisterService.regist(regReq);
      return "register/step3";
    } catch (DuplicateMemberException e) {
      errors.rejectValue("email", "duplicate");
      return "register/step2"; 
    }
  }
}
