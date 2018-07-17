package com.ted.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlValue;

/**
 * The persistent class for the categories database table.
 *
 */
@Entity
@Table(name = "categories")
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
@XmlRootElement
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id", unique = true, nullable = false)
	private int categoryId;

	@Column(nullable = false, length = 45, unique = true)
	private String name;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="parent_id")
	private Category category;

	//bi-directional many-to-one association to Category
	@OneToMany(mappedBy="category", fetch=FetchType.EAGER)
	private List<Category> categories;

	// bi-directional many-to-many association to Auction
	@ManyToMany(mappedBy = "categories")
	private List<Auction> auctions;

	public Category() {
	}

	public Category addCategory(Category category) {
		getCategories().add(category);
		category.setCategory(this);

		return category;
	}

	@XmlTransient
	public List<Auction> getAuctions() {
		return this.auctions;
	}

	@XmlTransient
	public List<Category> getCategories() {
		return this.categories;
	}
	
	@XmlTransient
	public Category getCategory() {
		return this.category;
	}

	@XmlTransient
	public int getCategoryId() {
		return this.categoryId;
	}

	@XmlValue
	public String getName() {
		return this.name;
	}

	public Category removeCategory(Category category) {
		getCategories().remove(category);
		category.setCategory(null);

		return category;
	}

	public void setAuctions(List<Auction> auctions) {
		this.auctions = auctions;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setName(String name) {
		this.name = name;
	}

}
