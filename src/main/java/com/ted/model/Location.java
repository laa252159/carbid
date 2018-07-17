package com.ted.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlValue;


/**
 * The persistent class for the location database table.
 * 
 */
@Entity
@Table(name="location")
@NamedQuery(name="Location.findAll", query="SELECT l FROM Location l")
@XmlRootElement
public class Location implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="location_id", unique=true, nullable=false)
	private int locationId;

	@Column(precision=10, scale=8)
	private BigDecimal latitude;

	@Column(precision=10, scale=8)
	private BigDecimal longitude;

	@Column(nullable=false, length=100)
	private String name;

	//bi-directional many-to-one association to Auction
	@OneToMany(mappedBy="location")
	private List<Auction> auctions;

	public Location() {
	}

	public Auction addAuction(Auction auction) {
		getAuctions().add(auction);
		auction.setLocation(this);

		return auction;
	}

	@XmlTransient
	public List<Auction> getAuctions() {
		return this.auctions;
	}

	@XmlAttribute(name = "Latitude")
	public BigDecimal getLatitude() {
		return this.latitude;
	}

	@XmlTransient
	public int getLocationId() {
		return this.locationId;
	}

	@XmlAttribute(name = "Longitude")
	public BigDecimal getLongitude() {
		return this.longitude;
	}

	@XmlValue
	public String getName() {
		return this.name;
	}

	public Auction removeAuction(Auction auction) {
		getAuctions().remove(auction);
		auction.setLocation(null);

		return auction;
	}

	public void setAuctions(List<Auction> auctions) {
		this.auctions = auctions;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public void setName(String name) {
		this.name = name;
	}

}