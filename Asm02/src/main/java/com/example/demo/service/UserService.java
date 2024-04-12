package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.User;

public interface UserService {
	
	public void sendEmail(String to, String activeLink);
	
	public List<User> getUsers();

	public void saveUser(User theUser);

	public User getUser(int theId);

	public void deleteUser(int theId);

	public User getUserByEmail(String email);
	
	public void updateUser(User user);
	
	public int coutOfUser();
	
	
}
