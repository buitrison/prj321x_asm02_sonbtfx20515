package com.example.demo.service;

import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDAO;
import com.example.demo.entity.User;
import com.example.demo.security.CustomUserDetailsService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private CustomUserDetailsService userDetailsService;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private JavaMailSender mailSender;

	/**
	 * Send mail to user's mail
	 */
	@Override
	public void sendEmail(String to, String activeLink) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(to);
		message.setSubject("Xac nhan tai khoan!");
		message.setText("Click vao duong link de xac nhan tai khoan cua ban: " + activeLink);
		mailSender.send(message);
	}

	@Override
	@Transactional
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		// TODO Auto-generated method stub
		userDAO.saveUser(theUser);
	}

	@Override
	@Transactional
	public User getUser(int theId) {
		// TODO Auto-generated method stub
		return userDAO.getUser(theId);
	}

	@Override
	@Transactional
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userDAO.getUserByEmail(email);
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		// TODO Auto-generated method stub
		userDAO.deleteUser(theId);

	}

	// keep session no invalidate() when update email or pass or authorities
	@Override
	@Transactional
	public void updateUser(User user) {
		// current auth
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// update user
		userDAO.saveUser(user);

		System.out.println("[ Authentication 1]\nUserService: current session is " + authentication);

		if (authentication != null && authentication.isAuthenticated()) {
			UserDetails userDetails = userDetailsService.loadUserByUsername(user.getEmail());
			Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

			// new auth
			UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
					userDetails, authentication.getCredentials(), authorities);

//            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails, user.getPassword(), authorities);

			// set same session
			authenticationToken.setDetails(authentication.getDetails());

			SecurityContextHolder.getContext().setAuthentication(authenticationToken);
			System.out.println("[ Authentication 2]\nUserService: New session is:"
					+ SecurityContextHolder.getContext().getAuthentication());

		}
	}

	// dem so ung cu vien
	@Override
	@Transactional
	public int coutOfUser() {
		int count = 0;
		for (User user : getUsers()) {
			if (user.getRole().getId() == 1) {
				count++;
			}
		}
		return count;
	}

}
