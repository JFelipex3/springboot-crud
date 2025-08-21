package com.jmachuca.curso.springboot.app.springboot_crud.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.jmachuca.curso.springboot.app.springboot_crud.entities.Product;

@Component
public class ProductValidation implements Validator {

    @Autowired
    private MessageSource messageSource;

    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        
        Product product = (Product) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", null, "es requerido para operación");
        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotBlank.product.description"); // Corresponde a una forma de validar

        // Validacion personalizada
        if (product.getDescription() == null || product.getDescription().isBlank()) {
            errors.rejectValue("description", null, messageSource.getMessage("NotBlank.product.description", null, null));
        }

        if (product.getPrice() == null) {
            errors.rejectValue("price", null, messageSource.getMessage("NotNull.product.price", null, null));
        } else if (product.getPrice() < 500) {
            errors.rejectValue("price", null, messageSource.getMessage("Min.product.price", null, null));
        }

    }

}
