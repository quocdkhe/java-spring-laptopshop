package vn.quocdk.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Service;
import vn.quocdk.laptopshop.domain.dto.RegisterDTO;
import vn.quocdk.laptopshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;
    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Mật khẩu không khớp, vui lòng kiểm tra lại")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        if(this.userService.checkExistedEmail(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
