package com.ted.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * The persistent class for the auctions database table.
 * 
 */
@Entity
@Table(name = "auctions")
@NamedQuery(name = "Auction.findAll", query = "SELECT a FROM Auction a")
@XmlType(propOrder = {"name", "categories", "currentlyString", "buyPriceString", "firstBidString", "numberOfBids", 
		"auctionBiddings", "location", "country", "xmlStarted", "xmlEnds", "xmlSeller", "description"})
@XmlRootElement(name = "Item")
public class Auction implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int auctionid;

	@Column(name="buy_price", columnDefinition="Decimal(15,2)")
	private BigDecimal buyPrice;

	@NotEmpty
	@Column(nullable = false, length = 45)
	private String country;

	@NotNull
	@Column(name="currently", columnDefinition="Decimal(15,2)")
	private BigDecimal currently;

	@NotNull
	@Lob
	@Column(nullable = false)
	private String description;

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Date ends;

	@NotNull
	@Column(name="first_bid", columnDefinition="Decimal(15,2)")
	private BigDecimal firstBid;

	@NotEmpty
	@Column(nullable = false, length = 45)
	private String name;

	@Column(name = "number_of_bids", nullable = false)
	private int numberOfBids;

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Date started;

	// bi-directional many-to-one association to AuctionBidding
	@OneToMany( mappedBy = "auction")
	private List<AuctionBidding> auctionBiddings;
	
	// bi-directional many-to-one association to Recommendation
	@OneToMany(mappedBy = "auction")
	private List<Recommendation> recommendations;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "seller_userid", nullable = false)
	private User user;
	
	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "buyer_id", nullable = true)
	private User buyer;

	// bi-directional many-to-many association to Category
	@ManyToMany()
	@JoinTable(name = "auction_categories", joinColumns = {
			@JoinColumn(name = "auction_id", nullable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "category_id", nullable = false) })
	private List<Category> categories;

	// bi-directional many-to-one association to Location
	@NotNull
	@ManyToOne
	@JoinColumn(name = "location_id", nullable = false)
	private Location location;
	
	@Column(name="isBought")
	boolean isBought;
	
	@Column(name="buyer_notified")
	boolean buyerNotified;
	
	//bi-directional many-to-one association to AuctionPictures
	@Transient
	@OneToMany(mappedBy="auction")
	private List<AuctionPicture> auctionPictures;

	@Transient
	private XmlSeller xmlSeller;

	@Transient
	private String xmlStarted;
	
	@Transient
	private String xmlEnds;
	
	@Transient
	private String buyPriceString;
	
	@Transient
	private String currentlyString;
	
	@Transient
	private String firstBidString;
	
	@Transient
	private String primaryImage;
	
	public Auction() {
	}
	
	public AuctionBidding addAuctionBidding(AuctionBidding auctionBidding) {
		getAuctionBiddings().add(auctionBidding);
		auctionBidding.setAuction(this);

		return auctionBidding;
	}


	@XmlElementWrapper(name = "Bids", required = true)
	@XmlElement(name = "Bid")
	public List<AuctionBidding> getAuctionBiddings() {
		return this.auctionBiddings;
	}

	@XmlAttribute(name = "ItemID")
	public int getAuctionid() {
		return this.auctionid;
	}

	@XmlTransient
	public List<AuctionPicture> getAuctionPictures() {
		return auctionPictures;
	}

	@XmlTransient
	public User getBuyer() {
		return buyer;
	}

	@XmlTransient
	public BigDecimal getBuyPrice() {
		return this.buyPrice;
	}

	@XmlElement(name = "Buy_Price")
	public String getBuyPriceString() {
		return buyPriceString;
	}

	@XmlElement(name = "Category")
	public List<Category> getCategories() {
		return this.categories;
	}

	@XmlElement(name = "Country")
	public String getCountry() {
		return this.country;
	}

	@XmlTransient
	public BigDecimal getCurrently() {
		return this.currently;
	}

	@XmlElement(name = "Currently")
	public String getCurrentlyString() {
		return currentlyString;
	}

	@XmlElement(name = "Description")
	public String getDescription() {
		return this.description;
	}

	@XmlTransient
	public Date getEnds() {
		return this.ends;
	}

	@XmlTransient
	public BigDecimal getFirstBid() {
		return this.firstBid;
	}

	@XmlElement(name = "First_Bid")
	public String getFirstBidString() {
		return firstBidString;
	}

	@XmlElement(name = "Location")
	public Location getLocation() {
		return this.location;
	}

	@XmlElement(name = "Name")
	public String getName() {
		return this.name;
	}

	@XmlElement(name = "Number_of_Bids")
	public int getNumberOfBids() {
		return this.numberOfBids;
	}

	@XmlTransient
	public String getPrimaryImage() {
		return primaryImage;
	}

	@XmlTransient
	public List<Recommendation> getRecommendations() {
		return recommendations;
	}

	@XmlTransient
	public Date getStarted() {
		return this.started;
	}

	@XmlTransient
	public User getUser() {
		return this.user;
	}

	@XmlElement(name = "Ends")
	public String getXmlEnds() {
		return xmlEnds;
	}

	@XmlElement(name = "Seller")
	public XmlSeller getXmlSeller() {
		return xmlSeller;
	}

	@XmlElement(name = "Started")
	public String getXmlStarted() {
		return xmlStarted;
	}
	
	@XmlTransient
	public boolean isBought() {
		return isBought;
	}

	@XmlTransient
	public boolean isBuyerNotified() {
		return buyerNotified;
	}

	public AuctionBidding removeAuctionBidding(AuctionBidding auctionBidding) {
		getAuctionBiddings().remove(auctionBidding);
		auctionBidding.setAuction(null);

		return auctionBidding;
	}

	public void setAuctionBiddings(List<AuctionBidding> auctionBiddings) {
		this.auctionBiddings = auctionBiddings;
	}

	public void setAuctionid(int auctionid) {
		this.auctionid = auctionid;
	}

	public void setAuctionPictures(List<AuctionPicture> auctionPicture) {
		this.auctionPictures = auctionPicture;
	}

	public void setBought(boolean isBought) {
		this.isBought = isBought;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public void setBuyerNotified(boolean buyerNotified) {
		this.buyerNotified = buyerNotified;
	}

	public void setBuyPrice(BigDecimal buyPrice) {
		this.buyPrice = buyPrice;
	}

	public void setBuyPriceString(String buyPriceString) {
		this.buyPriceString = buyPriceString;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setCurrently(BigDecimal currently) {
		this.currently = currently;
	}

	public void setCurrentlyString(String currentlyString) {
		this.currentlyString = currentlyString;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setEnds(Date ends) {
		this.ends = ends;
	}

	public void setFirstBid(BigDecimal firstBid) {
		this.firstBid = firstBid;
	}

	public void setFirstBidString(String firstBidString) {
		this.firstBidString = firstBidString;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNumberOfBids(int numberOfBids) {
		this.numberOfBids = numberOfBids;
	}

	public void setPrimaryImage(String primaryImage) {
		this.primaryImage = primaryImage;
	}

	public void setRecommendations(List<Recommendation> recommendations) {
		this.recommendations = recommendations;
	}

	public void setStarted(Date started) {
		this.started = started;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setXmlEnds(String xmlEnds) {
		this.xmlEnds = xmlEnds;
	}

	public void setXmlSeller(XmlSeller xmlSeller) {
		this.xmlSeller = xmlSeller;
	}

	public void setXmlStarted(String xmlStarted) {
		this.xmlStarted = xmlStarted;
	}

}