/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.config;

import com.ci2.ppw.services.MyDBAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
/**
 *
 * @author wilderlizama
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    
    @Autowired
    private StandardPasswordEncoder standardPasswordEncoder;
    
    @Autowired
    MyDBAuthenticationService myDBAauthenticationService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

        // Users in memory.
        auth.inMemoryAuthentication().withUser("user1").password("{noop}12345").roles("USER");
        auth.inMemoryAuthentication().withUser("admin1").password("{noop}12345").roles("USER, ADMIN");

        // For User in database.
        auth.userDetailsService(myDBAauthenticationService).passwordEncoder(standardPasswordEncoder);

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable();

        // The pages does not require login
        http.authorizeRequests().antMatchers("/", "/intranet/login", "/intranet/logout").permitAll();

        // /userInfo page requires login as USER or ADMIN.
        // If no login, it will redirect to /login page.
//        http.authorizeRequests().antMatchers("/intranet/**").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");

        // For ADMIN only.
        http.authorizeRequests().antMatchers("/intranet/**").access("hasRole('ROLE_USER')");

        // When the user has logged in as XX.
        // But access a page that requires role YY,
        // AccessDeniedException will throw.
        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/intranet/403");

        // Config for Login Form
        http.authorizeRequests().and().formLogin()
            // Submit URL of login page.
            .loginProcessingUrl("/j_spring_security_check") // Submit URL
            .loginPage("/intranet/login")//
            .defaultSuccessUrl("/intranet")//
            .failureUrl("/intranet/login?error=true")//
            .usernameParameter("username")//
            .passwordParameter("password")
            // Config for Logout Page
            .and().logout().logoutUrl("/intranet/logout").logoutSuccessUrl("/intranet/logoutSuccessful");

    }
}
