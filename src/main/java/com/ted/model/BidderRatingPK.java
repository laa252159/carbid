package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the bidder_rating database table.
 * 
 */
@Embeddable
public class BidderRatingPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="rated_bidder_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int ratedBidderId;

	@Column(name="rater_bidder_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int raterBidderId;

	public BidderRatingPK() {
	}
	public int getRatedBidderId() {
		return this.ratedBidderId;
	}
	public void setRatedBidderId(int ratedBidderId) {
		this.ratedBidderId = ratedBidderId;
	}
	public int getRaterBidderId() {
		return this.raterBidderId;
	}
	public void setRaterBidderId(int raterBidderId) {
		this.raterBidderId = raterBidderId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof BidderRatingPK)) {
			return false;
		}
		BidderRatingPK castOther = (BidderRatingPK)other;
		return 
			(this.ratedBidderId == castOther.ratedBidderId)
			&& (this.raterBidderId == castOther.raterBidderId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.ratedBidderId;
		hash = hash * prime + this.raterBidderId;
		
		return hash;
	}
}