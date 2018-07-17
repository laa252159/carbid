package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the recommendations database table.
 * 
 */
@Entity
@Table(name="recommendations")
@NamedQuery(name="Recommendation.findAll", query="SELECT r FROM Recommendation r")
public class Recommendation implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RecommendationPK id;

	@Column(nullable=false)
	private double prediction;
	
	// bi-directional many-to-one association to Auction
	@ManyToOne
	@JoinColumn(name = "auction_id", nullable = false, insertable = false, updatable = false)
	private Auction auction;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
	private User user;

	public Recommendation() {
	}

	public RecommendationPK getId() {
		return this.id;
	}

	public void setId(RecommendationPK id) {
		this.id = id;
	}

	public double getPrediction() {
		return this.prediction;
	}

	public void setPrediction(double prediction) {
		this.prediction = prediction;
	}

	public Auction getAuction() {
		return auction;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

}