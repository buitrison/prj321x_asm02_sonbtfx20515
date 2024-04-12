package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Entity
@Table(name="user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="address")
	private String address;
	
	@Column(name="description")
	private String description;
	
	@Column(name="email")
	@Email(regexp = "^[\\w-\\.]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$", message = "Email không hợp lệ! Vd: sonbtfx20515@funix.edu.vn")
	@NotEmpty(message = "Email không được trống!")
	private String email;
	
	@Column(name="full_name")
	@NotEmpty(message = "Tên không được trống!")
	private String fullName;
	
	@Column(name="image")
	private String image;
	
	@Size(min = 3, max = 100, message = "Password lớn hơn 3 và bé hơn 100 kí tự!")
	@NotEmpty(message = "Password không được trống!")
	@Column(name="password")
	private String password;
	
	@Transient
	private String confirmPassword;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	@Column(name="status")
	private int status;
	
	@OneToOne
	@JoinColumn(name = "role_id")
	private Role role;
	
	@OneToOne
	@JoinColumn(name="cv_id")
	private Cv cv;
	
	
	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Cv getCv() {
		return cv;
	}

	public void setCv(Cv cv) {
		this.cv = cv;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
}
