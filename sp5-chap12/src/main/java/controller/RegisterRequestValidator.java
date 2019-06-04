package controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import spring.RegisterRequest;

public class RegisterRequestValidator implements Validator {
  private static final String emailRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
      + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
  private Pattern pattern;
  
  public RegisterRequestValidator() {
    pattern = Pattern.compile(emailRegExp);
  }

  @Override
  // supports(): Validator가 확인 가능한 객체 타입인지 확인하는 함수
  public boolean supports(Class<?> clazz) {
    // parameter clazz 객체가 RegisterRequest 객체로 변환이 가능한지 체크
    return RegisterRequest.class.isAssignableFrom(clazz);
  }

  @Override
  // validate(): 전달받은 객체를 검증하고 오류 결과를 Errors에 담는 함수
  public void validate(Object target, Errors errors) {
    // target: 검사 대상 객체, errors: 에러 코드 설정을 위한 객체
    RegisterRequest regReq = (RegisterRequest) target;
    
    if (regReq.getEmail() == null || regReq.getEmail().trim().isEmpty()) { // 이메일 입력값이 입력이 되었는지 체크
      errors.rejectValue("email", "required"); // email: 에러 코드가 적용되는 프로퍼티, required: 에러 코드의 이름(JSP에서 이용)
    } else {
      Matcher matcher = pattern.matcher(regReq.getEmail());
      if (!matcher.matches()) { // 이메일 입력값이 정규표현식에 일치하는지 체크
        errors.rejectValue("email", "bad");
      }
    }
    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
    /*
     * 위의 ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required")는 아래 코드와 같은 의미
     * 
     * String name = regReq.getName();
     * if (name == null || name.trim().isEmpty()) {
     *   errors.rejectValue("name", "required");
     * }
     */
    ValidationUtils.rejectIfEmpty(errors, "password", "required");
    ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
    if (!regReq.getPassword().isEmpty()) {
      if (!regReq.isPasswordEqualToConfirmPassword()) {
        errors.rejectValue("confirmPassword", "nomatch");
      }
    }
  } 
}
