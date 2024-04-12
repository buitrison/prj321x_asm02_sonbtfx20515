package com.example.demo.Base;

import com.example.demo.entity.Recruitment;

/**
 *  Using JOIN to get Recruitment has the most ApplyPosts
 */
public class BestRecruitment {
	
	private int recruitmentId;
	
	private long num;
	
	private Recruitment recruitment;
	
	public BestRecruitment(int reId, long num) {
		super();
		this.recruitmentId = reId;
		this.num = num;
	}


	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}


	public int getRecruitmentId() {
		return recruitmentId;
	}


	public void setRecruitmentId(int recruitmentId) {
		this.recruitmentId = recruitmentId;
	}


	public Recruitment getRecruitment() {
		return recruitment;
	}


	public void setRecruitment(Recruitment recruitment) {
		this.recruitment = recruitment;
	}
	
	

}
