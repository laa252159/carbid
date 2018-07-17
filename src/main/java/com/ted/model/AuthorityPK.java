package com.ted.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * The primary key class for the authorities database table.
 * 
 */
@Embeddable
public class AuthorityPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false, unique=true, nullable=false)
	private int userid;

	@Column(unique=true, nullable=false, length=45)
	private String role;

	public AuthorityPK() {
	}
	public int getUserid() {
		return this.userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getRole() {
		return this.role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof AuthorityPK)) {
			return false;
		}
		AuthorityPK castOther = (AuthorityPK)other;
		return 
			(this.userid == castOther.userid)
			&& this.role.equals(castOther.role);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.userid;
		hash = hash * prime + this.role.hashCode();
		
		return hash;
	}
}