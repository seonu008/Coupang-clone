package com.simjh96.filter;

import java.io.IOException;
import java.security.AlgorithmConstraints;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Component;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.simjh96.model.CustomUser;
import com.simjh96.security.CustomUserDetailsService;
import com.simjh96.util.JwtUtil;

@Component
public class CustomAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	private AuthenticationManager authenticationManager;
	@Autowired
	private JwtUtil jwtTokenUtil;
	
	@Autowired
	CustomUserDetailsService userDetailsService;
	
	@Autowired
	@Override
	public void setAuthenticationManager(AuthenticationManager authenticationManager) {
		System.out.println("customauthenticationfilter being set of authentication manager");
		super.setAuthenticationManager(authenticationManager);
		this.authenticationManager = this.getAuthenticationManager();
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		String id = request.getParameter("username"); // default login이 username이네 ...
		String password = request.getParameter("password");
		System.out.println("attempt Authentication");
		System.out.println("id :" + id);
		System.out.println("password :" + password);
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(id, password);
		return this.getAuthenticationManager().authenticate(authenticationToken);
	}

	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {
		CustomUser customUser = (CustomUser) authResult.getPrincipal();

		final UserDetails userDetails = userDetailsService.loadUserByUsername(authResult.getName());
		final String access_token = jwtTokenUtil.generateToken(userDetails,request.getRequestURL().toString(), true);
		final String refresh_token = jwtTokenUtil.generateToken(userDetails,request.getRequestURL().toString(), false);
		
		Map<String, String> tokens = new HashMap<>();
		tokens.put("access_token", access_token);
		tokens.put("refresh_token", refresh_token);
		response.setContentType("application/json");
		new ObjectMapper().writeValue(response.getOutputStream(), tokens);
	}
}
