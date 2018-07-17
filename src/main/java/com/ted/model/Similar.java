package com.ted.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the similar database table.
 * 
 */
@Entity
@Table(name="similar")
@NamedNativeQuery(name = "Similar.truncate", query = "TRUNCATE similar")
@NamedQuery(name="Similar.findAll", query="SELECT s FROM Similar s")
public class Similar implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private SimilarPK id;

	@Column(nullable=false)
	private double similarity;
	
	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user1_id", nullable=false, insertable=false, updatable=false)
	private User user1;
	
	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user2_id", nullable=false, insertable=false, updatable=false)
	private User user2;

	public Similar() {
	}

	public SimilarPK getId() {
		return this.id;
	}

	public double getSimilarity() {
		return this.similarity;
	}

	public User getUser1() {
		return user1;
	}

	public User getUser2() {
		return user2;
	}

	public void setId(SimilarPK id) {
		this.id = id;
	}

	public void setSimilarity(double similarity) {
		this.similarity = similarity;
	}

	public void setUser1(User user1) {
		this.user1 = user1;
	}

	public void setUser2(User user2) {
		this.user2 = user2;
	}
	

}