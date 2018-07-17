package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the seller_rating database table.
 * 
 */
@Embeddable
public class SellerRatingPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="rated_seller_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int ratedSellerId;

	@Column(name="rater_seller_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int raterSellerId;

	public SellerRatingPK() {
	}
	public int getRatedSellerId() {
		return this.ratedSellerId;
	}
	public void setRatedSellerId(int ratedSellerId) {
		this.ratedSellerId = ratedSellerId;
	}
	public int getRaterSellerId() {
		return this.raterSellerId;
	}
	public void setRaterSellerId(int raterSellerId) {
		this.raterSellerId = raterSellerId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof SellerRatingPK)) {
			return false;
		}
		SellerRatingPK castOther = (SellerRatingPK)other;
		return 
			(this.ratedSellerId == castOther.ratedSellerId)
			&& (this.raterSellerId == castOther.raterSellerId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.ratedSellerId;
		hash = hash * prime + this.raterSellerId;
		
		return hash;
	}
}