/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.config;

import com.ci2.ppw.utils.DBAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


/**
 *
 * @author wilderlizama
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    
    @Autowired
    DBAuthenticationService myDBAauthenticationService;
    
    @Autowired
    PasswordEncoder passwordEncoder;
    
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

        // Users in memory.
        auth.inMemoryAuthentication()
            .passwordEncoder(passwordEncoder)
            .withUser("user1").password(passwordEncoder.encode("12345")).roles("USER")
            .and()
            .withUser("admin1").password(passwordEncoder.encode("12345")).roles("USER, ADMIN");
            
        // For User in database.
        auth.userDetailsService(myDBAauthenticationService)
            .passwordEncoder(passwordEncoder);
        
        /*
        https://bcrypt-generator.com/
        
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
        String result = encoder.encode("myPassword");
        assertTrue(encoder.matches("myPassword", result));
        */
    }
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable();

        // The pages does not require login
        http.authorizeRequests().antMatchers("/", "/intranet/login", "/intranet/logout").permitAll();

        // For ADMIN only.
        http.authorizeRequests().antMatchers("/intranet/**").hasAuthority("ROLE_USER");

        // When the user has logged in as XX.
        // But access a page that requires role YY,
        // AccessDeniedException will throw.
        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/intranet/403");

        // Config for Login Form
        http.authorizeRequests().and().formLogin()
            // Submit URL of login page.
            .loginProcessingUrl("/intranet/j_spring_security_check") // Submit URL
            .loginPage("/intranet/login")//
            .defaultSuccessUrl("/intranet")//
            .failureUrl("/intranet/login?error=true")//
            .usernameParameter("username")//
            .passwordParameter("password")
            // Config for Logout Page
            .and().logout().logoutUrl("/intranet/logout")
            .and().exceptionHandling().authenticationEntryPoint(new LoginAuthenticationEntryPoint("/intranet/login"));

    }
}
