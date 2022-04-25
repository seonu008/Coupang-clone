package com.simjh96.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.simjh96.filter.CustomAuthenticationFilter;
import com.simjh96.filter.JwtRequestFilter;
import com.simjh96.security.CustomLoginSuccessHandler;
import com.simjh96.security.CustomUserDetailsService;

import lombok.Setter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;

	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}

	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	// userPasswordAuthentication(userDetails) 에 들어가서 userDetails.password 가 encoding 됨
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

   @Bean
   @Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		System.out.println("authenticationmanager in security config made");
		return super.authenticationManagerBean();
	}
	
	@Autowired
	private JwtRequestFilter jwtRequestFilter;
	
	@Autowired
	private CustomAuthenticationFilter customAuthenticationFilter;
	
	
	// STATELESS가 핵심
	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests()
		.antMatchers("/authentication").permitAll()
		.antMatchers("/others").hasAnyAuthority("ROLE_MEMBER")
		.anyRequest().authenticated()
		.and().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
		http.addFilter(customAuthenticationFilter);
		http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
		http.formLogin().successHandler(loginSuccessHandler());
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());

	}

}
