package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.User;

public interface UserDAO {
	public List<User> getUsers();

	public void saveUser(User theUser);

	public User getUser(int theId);

	public void deleteUser(int theId);

	public User getUserByEmail(String email);
	
	

}
