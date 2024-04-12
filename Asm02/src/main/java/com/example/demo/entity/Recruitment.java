package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;

@Entity
@Table(name = "recruitment")
public class Recruitment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "address")
	@NotBlank(message = "Trường này không được để trống!")
	private String address;

	@Column(name = "created_at")
	private String createdAt;

	@Column(name = "description")
	@NotBlank(message = "Trường này không được để trống!")
	private String description;

	@Column(name = "experience")
	@NotBlank(message = "Trường này không được để trống!")
	private String experience;

	@Column(name = "quantity")
	@Positive(message = "Số người cần tuyển phải là số!")
	@NotNull(message = "Trường này không được để trống!")
	private int quantity;

	@Column(name = "xh")
	private String xh;

	@Column(name = "salary")
	@NotBlank(message = "Trường này không được để trống!")
	private String salary;

	@Column(name = "status")
	private int status;

	@Column(name = "title")
	@NotBlank(message = "Trường này không được để trống!")
	private String title;

	@Column(name = "type")
	private String type;

	@Column(name = "view")
	private int view;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@ManyToOne
	@JoinColumn(name = "company_id")
	private Company company;

	@Column(name = "deadline")
	@Pattern(regexp = "\\d{4}-\\d{2}-\\d{2}", message = "Hãy nhập ngày tháng theo định dạng yyyy-MM-dd")
	@NotBlank(message = "Trường này không được để trống!")
	private String deadline;

	public Recruitment() {

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

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

}
