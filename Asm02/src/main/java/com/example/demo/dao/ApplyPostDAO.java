package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.ApplyPost;

public interface ApplyPostDAO {
	public List<ApplyPost> getApplyPosts();
	public void saveApplyPost(ApplyPost applyPost);
	public ApplyPost getApplyPost(int theId);
	public void deleteApplyPost(int theId);
	
	public List<ApplyPost> getListByUserId(int userId);

}
