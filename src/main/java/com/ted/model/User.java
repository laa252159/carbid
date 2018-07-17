package com.ted.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * The persistent class for the users database table.
 *
 */
@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
@XmlRootElement
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int userid;

	@Column(nullable = false, length = 45)
	private String address;

	@Column(nullable = false, length = 45)
	private String afm;

	@Column(nullable = false)
	private byte approved;

	@Column(name="bidder_rating")
	private float bidderRating;

	@NotEmpty
	@Column(nullable = false, length = 100)
	private String city;

	@NotEmpty
	@Column(nullable = false, length = 45)
	private String country;

	@NotEmpty
	@Column(nullable = false, length = 55)
	private String email;

	@Column(nullable = false)
	private byte enabled;

	@NotEmpty
	@Column(name = "first_name", nullable = false, length = 45)
	private String firstName;

	@NotEmpty
	@Column(name = "last_name", nullable = false, length = 45)
	private String lastName;

	@NotEmpty
	@Column(nullable = false, length = 60)
	private String password;

	@NotEmpty
	@Column(nullable = false, length = 45)
	private String phone;

	@Column(name = "postal_code", nullable = false, length = 45)
	private String postalCode;

	@Column(name="seller_rating")
	private float sellerRating;

	@Column(name="number_of_bidder_ratings")
	private int numberOfBidderRatings;

	@Column(name="number_of_seller_ratings")
	private int numberOfSellerRatings;

	@NotEmpty
	@Column(nullable = false, length = 45)
	private String username;

	// bi-directional many-to-one association to AuctionBidding
	@OneToMany(mappedBy = "user")
	private List<AuctionBidding> auctionBiddings;
	
	// bi-directional many-to-one association to AuctionBidding
	@OneToMany(mappedBy = "user")
	private List<Recommendation> recommendations;

	// bi-directional many-to-one association to Auction
	@OneToMany(mappedBy = "user")
	private List<Auction> auctions;

	// bi-directional many-to-one association to Authority
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private List<Authority> authorities;

	//bi-directional many-to-one association to AuctionPictures
	@Transient
	@OneToMany(mappedBy="user")
	private List<UserPicture> userPictures;

	public User() {
	}

	public Auction addAuction(Auction auction) {
		getAuctions().add(auction);
		auction.setUser(this);

		return auction;
	}

	public AuctionBidding addAuctionBidding(AuctionBidding auctionBidding) {
		getAuctionBiddings().add(auctionBidding);
		auctionBidding.setUser(this);

		return auctionBidding;
	}

	public Authority addAuthority(Authority authority) {
		getAuthorities().add(authority);
		authority.setUser(this);

		return authority;
	}

	@XmlTransient
	public String getAddress() {
		return this.address;
	}

	@XmlTransient
	public String getAfm() {
		return this.afm;
	}

	@XmlTransient
	public byte getApproved() {
		return this.approved;
	}

	@XmlTransient
	public List<AuctionBidding> getAuctionBiddings() {
		return this.auctionBiddings;
	}

	@XmlTransient
	public List<Auction> getAuctions() {
		return this.auctions;
	}

	@XmlTransient
	public List<Authority> getAuthorities() {
		return this.authorities;
	}

	@XmlAttribute(name = "Rating")
	public float getBidderRating() {
		return this.bidderRating;
	}

	@XmlElement(name = "Location")
	public String getCity() {
		return this.city;
	}

	@XmlElement(name = "Country")
	public String getCountry() {
		return this.country;
	}

	@XmlTransient
	public String getEmail() {
		return this.email;
	}

	@XmlTransient
	public byte getEnabled() {
		return this.enabled;
	}

	@XmlTransient
	public String getFirstName() {
		return this.firstName;
	}

	@XmlTransient
	public String getLastName() {
		return this.lastName;
	}

	@XmlTransient
	public int getNumberOfBidderRatings() {
		return this.numberOfBidderRatings;
	}

	@XmlTransient
	public int getNumberOfSellerRatings() {
		return this.numberOfSellerRatings;
	}

	@XmlTransient
	public String getPassword() {
		return this.password;
	}

	@XmlTransient
	public String getPhone() {
		return this.phone;
	}

	@XmlTransient
	public String getPostalCode() {
		return this.postalCode;
	}

	@XmlTransient
	public List<Recommendation> getRecommendations() {
		return recommendations;
	}

	@XmlTransient
	public float getSellerRating() {
		return this.sellerRating;
	}

	@XmlTransient
	public int getUserid() {
		return this.userid;
	}

	@XmlAttribute(name = "UserID")
	public String getUsername() {
		return this.username;
	}

	@XmlTransient
	public List<UserPicture> getUserPictures() {
		return userPictures;
	}

	public Auction removeAuction(Auction auction) {
		getAuctions().remove(auction);
		auction.setUser(null);

		return auction;
	}

	public AuctionBidding removeAuctionBidding(AuctionBidding auctionBidding) {
		getAuctionBiddings().remove(auctionBidding);
		auctionBidding.setUser(null);

		return auctionBidding;
	}

	public Authority removeAuthority(Authority authority) {
		getAuthorities().remove(authority);
		authority.setUser(null);

		return authority;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setAfm(String afm) {
		this.afm = afm;
	}

	public void setApproved(byte approved) {
		this.approved = approved;
	}

	public void setAuctionBiddings(List<AuctionBidding> auctionBiddings) {
		this.auctionBiddings = auctionBiddings;
	}

	public void setAuctions(List<Auction> auctions) {
		this.auctions = auctions;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}

	public void setBidderRating(float bidderRating) {
		this.bidderRating = bidderRating;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setNumberOfBidderRatings(int numberOfBidderRatings) {
		this.numberOfBidderRatings = numberOfBidderRatings;
	}

	public void setNumberOfSellerRatings(int numberOfSellerRatings) {
		this.numberOfSellerRatings = numberOfSellerRatings;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public void setRecommendations(List<Recommendation> recommendations) {
		this.recommendations = recommendations;
	}

	public void setSellerRating(float sellerRating) {
		this.sellerRating = sellerRating;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserPictures(List<UserPicture> userPictures) {
		this.userPictures = userPictures;
	}
	
	

}
