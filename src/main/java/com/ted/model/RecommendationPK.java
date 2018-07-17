package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the recommendations database table.
 * 
 */
@Embeddable
public class RecommendationPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="user_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int userId;

	@Column(name="auction_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int auctionId;

	public RecommendationPK() {
	}
	public int getUserId() {
		return this.userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAuctionId() {
		return this.auctionId;
	}
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof RecommendationPK)) {
			return false;
		}
		RecommendationPK castOther = (RecommendationPK)other;
		return 
			(this.userId == castOther.userId)
			&& (this.auctionId == castOther.auctionId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.userId;
		hash = hash * prime + this.auctionId;
		
		return hash;
	}
}