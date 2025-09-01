package com.jmachuca.curso.springboot.app.springboot_crud.utils;

import javax.crypto.SecretKey;

import io.jsonwebtoken.Jwts;

public class AppConstants {

    public static final SecretKey SECRET_KEY = Jwts.SIG.HS256.key().build();

    public static final String ROLE_USER = "ROLE_USER";
    public static final String ROLE_ADMIN = "ROLE_ADMIN";

    public static final String HEADER_AUTHORIZATION = "Authorization";
    public static final String PREFIX_BEARER = "Bearer ";
    public static final String TOKEN = "token";
    public static final String USERNAME = "username";
    public static final String MESSAGE = "message";
    public static final String ERROR = "error";
    
    public enum ContentType {
        JSON("application/json"),
        XML("application/xml"),
        HTML("text/html"),
        TEXT("text/plain"),
        JAVASCRIPT("application/javascript"),
        CSS("text/css"),
        FORM_URLENCODED("application/x-www-form-urlencoded"),
        MULTIPART("multipart/form-data"),
        CSV("text/csv");

        private final String value;

        ContentType(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

}
