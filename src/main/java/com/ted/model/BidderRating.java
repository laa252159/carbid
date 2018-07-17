package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the bidder_rating database table.
 * 
 */
@Entity
@Table(name="bidder_rating")
@NamedQuery(name="BidderRating.findAll", query="SELECT b FROM BidderRating b")
public class BidderRating implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private BidderRatingPK id;

	@Column(nullable=false)
	private float rating;

	private Timestamp time;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="rated_bidder_id", nullable=false, insertable=false, updatable=false)
	private User rated;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="rater_bidder_id", nullable=false, insertable=false, updatable=false)
	private User rater;

	public BidderRating() {
	}

	public BidderRatingPK getId() {
		return this.id;
	}

	public void setId(BidderRatingPK id) {
		this.id = id;
	}

	public float getRating() {
		return this.rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public User getUser1() {
		return this.rated;
	}

	public void setUser1(User user1) {
		this.rated = user1;
	}

	public User getUser2() {
		return this.rater;
	}

	public void setUser2(User user2) {
		this.rater = user2;
	}

}