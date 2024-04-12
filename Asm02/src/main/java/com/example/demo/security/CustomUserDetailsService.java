package com.example.demo.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDAO;
import com.example.demo.entity.User;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	
	@Autowired
	private UserDAO userDAO;
	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    User user = userDAO.getUserByEmail(username);
	    if (user == null) {
	        System.out.println("user " + username + " null");
	        throw new UsernameNotFoundException("User not found!");
	    }
	    System.out.println("UserDetailService: load user {" + username + "} ... OK");
	    System.out.println(user.getRole().getRoleName());

	    return org.springframework.security.core.userdetails.User.builder()
	    		.username(user.getEmail())
	    		.password(user.getPassword())
	    		.roles(user.getRole().getRoleName())
	    		.build();
	}


}
