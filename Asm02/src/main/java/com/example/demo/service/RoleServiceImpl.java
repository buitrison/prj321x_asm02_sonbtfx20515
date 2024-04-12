package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.RoleDAO;
import com.example.demo.entity.Role;
@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDAO roleDAO;

	@Override
	@Transactional
	public List<Role> getRoles() {
		// TODO Auto-generated method stub
		return roleDAO.getRoles();
	}

}
