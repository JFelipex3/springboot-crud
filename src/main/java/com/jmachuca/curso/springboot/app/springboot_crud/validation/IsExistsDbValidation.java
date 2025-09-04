package com.jmachuca.curso.springboot.app.springboot_crud.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jmachuca.curso.springboot.app.springboot_crud.services.ProductService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Component
public class IsExistsDbValidation implements ConstraintValidator<IsExistsDb, String> {

    @Autowired
    private ProductService productService;
    // No usar inyección por constructor en validadores personalizados

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if(productService != null) {
            return !productService.existsBySku(value);
        }

        return true;
    }

}
