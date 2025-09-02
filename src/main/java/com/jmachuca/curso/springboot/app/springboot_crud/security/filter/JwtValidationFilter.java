package com.jmachuca.curso.springboot.app.springboot_crud.security.filter;

import static com.jmachuca.curso.springboot.app.springboot_crud.utils.AppConstants.ERROR;
import static com.jmachuca.curso.springboot.app.springboot_crud.utils.AppConstants.HEADER_AUTHORIZATION;
import static com.jmachuca.curso.springboot.app.springboot_crud.utils.AppConstants.MESSAGE;
import static com.jmachuca.curso.springboot.app.springboot_crud.utils.AppConstants.PREFIX_BEARER;
import static com.jmachuca.curso.springboot.app.springboot_crud.utils.AppConstants.SECRET_KEY;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmachuca.curso.springboot.app.springboot_crud.security.SimpleGrantedAuthorityJsonCreator;
import com.jmachuca.curso.springboot.app.springboot_crud.utils.AppConstants.ContentType;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JwtValidationFilter extends BasicAuthenticationFilter {

    public JwtValidationFilter(AuthenticationManager authenticationManager) {
        super(authenticationManager);
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        String header = request.getHeader(HEADER_AUTHORIZATION);

        if (header == null || !header.startsWith(PREFIX_BEARER)){
            chain.doFilter(request, response);
            return;
        }

        String token = header.replace(PREFIX_BEARER, "");

        try {
            Claims claims = Jwts.parser().verifyWith(SECRET_KEY).build().parseSignedClaims(token).getPayload();
            String username = claims.getSubject();
            //String username2 = (String) claims.get("username"); // Versión 2 para obtener el nombre de usuario
            Object authoritiesClaims = claims.get("authorities");

            Collection<? extends GrantedAuthority> authorities = Arrays.asList(
                new ObjectMapper()
                    .addMixIn(SimpleGrantedAuthority.class, SimpleGrantedAuthorityJsonCreator.class)
                    .readValue(authoritiesClaims.toString().getBytes(), SimpleGrantedAuthority[].class)
            );

            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, null, authorities);
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);
            chain.doFilter(request, response);

        } catch (JwtException e) {
            Map<String, String> body = new HashMap<>();
            body.put(ERROR, e.getMessage());
            body.put(MESSAGE, "El token JWT es invalido!");

            response.getWriter().write(new ObjectMapper().writeValueAsString(body));
            response.setStatus(401);
            response.setContentType(ContentType.JSON.getValue());
        }


    }

    
}
