package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the similar database table.
 * 
 */
@Embeddable
public class SimilarPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="user1_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int user1Id;

	@Column(name="user2_id", insertable=false, updatable=false, unique=true, nullable=false)
	private int user2Id;

	public SimilarPK() {
	}
	public int getUser1Id() {
		return this.user1Id;
	}
	public void setUser1Id(int user1Id) {
		this.user1Id = user1Id;
	}
	public int getUser2Id() {
		return this.user2Id;
	}
	public void setUser2Id(int user2Id) {
		this.user2Id = user2Id;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof SimilarPK)) {
			return false;
		}
		SimilarPK castOther = (SimilarPK)other;
		return 
			(this.user1Id == castOther.user1Id)
			&& (this.user2Id == castOther.user2Id);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.user1Id;
		hash = hash * prime + this.user2Id;
		
		return hash;
	}
}