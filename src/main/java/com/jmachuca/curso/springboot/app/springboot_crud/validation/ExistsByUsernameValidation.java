package com.jmachuca.curso.springboot.app.springboot_crud.validation;

import org.springframework.stereotype.Component;

import com.jmachuca.curso.springboot.app.springboot_crud.services.UserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Component
public class ExistsByUsernameValidation implements ConstraintValidator<ExistsByUsername, String>{

    private UserService userService;

    public ExistsByUsernameValidation(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(String username, ConstraintValidatorContext context) {
        return !userService.existsByUsername(username);
    }

}
