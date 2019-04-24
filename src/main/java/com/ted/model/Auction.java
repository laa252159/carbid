package com.ted.model;

import java.io.Serializable;
import java.util.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * The persistent class for the auctions database table.
 * 
 */
@Entity
@Table(name = "auctions")
@NamedQuery(name = "Auction.findAll", query = "SELECT a FROM Auction a")
@XmlType(propOrder = {"name", "categories", "currentlyString", "buyPriceString", "firstBidString", "numberOfBids", 
		"auctionBiddings", "location", "xmlStarted", "xmlEnds", "xmlSeller", "description", "brand", "model",
		"released", "run", "engineType", "power", "transmission", "body", "drive", "color", "doors", "bodyState",
		"owners", "vin", "gibdd", "fssp", "engineState", "damagedElements","city","additionalInfo",
		"driveState", "engineCapacity", "ownersDB", "numberAccidentsDB", "wantedDB", "taxiDB", "mileageDB", "restrictionsDB"})
@XmlRootElement(name = "Item")
public class Auction implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int auctionid;

	@Column(name="buy_price")
	private Integer buyPrice;

	@NotNull
	@Column(name="currently")
	private Integer currently;

	@Lob
	@Column(nullable = true)
	private String description;

	
	@Column(name="brand", nullable = true)
	private String brand;

	
	@Column(name="model", nullable = true)
	private String model;

	
	@Column(name="released", nullable = true)
	private String released;

	
	@Column(name="run", nullable = true)
	private String run;

	
	@Column(name="engine_type", nullable = true)
	private String engineType;

	
	@Column(name="power", nullable = true)
	private String power;


    @Column(name="engine_capacity", nullable = true)
	private String engineCapacity;


	@Column(name="transmission", nullable = true)
	private String transmission;

	
	@Column(name="body", nullable = true)
	private String body;

	
	@Column(name="drive", nullable = true)
	private String drive;

	
	@Column(name="color", nullable = true)
	private String color;

	
	@Column(name="doors", nullable = true)
	private String doors;

	
	@Column(name="body_state", nullable = true)
	private String bodyState;

	
	@Column(name="owners", nullable = true)
	private String owners;

	
	@Column(name="vin", nullable = true)
	private String vin;

	
	@Column(name="gibdd", nullable = true)
	private String gibdd;

	@Column(name="youtube", nullable = true)
	private String youtube;

	
	@Column(name="fssp", nullable = true)
	private String fssp;

	
	@Column(name="drive_state", nullable = true)
	private String driveState;

	
	@Column(name="engine_state", nullable = true)
	private String engineState;

	
	@Column(name="damaged_elements", nullable = true)
	private String damagedElements;

	@Column(name="city", nullable = true)
	private String city;

    public void setOwnersDB(String ownersDB) {
        this.ownersDB = ownersDB;
    }

    @Column(name="owners_db", nullable = true)
    private String ownersDB;

    @Column(name="numberAccidents_db", nullable = true)
    private String numberAccidentsDB;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    @Column(name = "wanted_db")
    boolean wantedDB;

    @Column(name = "taxi_db")
    boolean taxiDB;

    @Column(name = "mileage_db", nullable = true)
    private String mileageDB;

    @Column(name = "restrictions_db")
    boolean restrictionsDB;

	@Column(name="additional_info", nullable = true)
	private String additionalInfo;

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Date ends;

	@NotNull
	@Column(name="first_bid")
	private Integer firstBid;

	
	@Column(nullable = true, length = 45)
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

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "auctionid", referencedColumnName = "auctionid")
	private AuctionMoreInfo auctionMoreInfo;
	
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

	@Transient
	private List<String> imagesForGallery;

    @Transient
    public String numberPaintedElements;

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

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public AuctionMoreInfo getAuctionMoreInfo() {
		return auctionMoreInfo;
	}

	public void setAuctionMoreInfo(AuctionMoreInfo auctionMoreInfo) {
		this.auctionMoreInfo = auctionMoreInfo;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getReleased() {
		return released;
	}

	public void setReleased(String released) {
		this.released = released;
	}

	public String getRun() {
		return run;
	}

	public void setRun(String run) {
		this.run = run;
	}

	public String getEngineType() {
		return engineType;
	}

	public void setEngineType(String engineType) {
		this.engineType = engineType;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getTransmission() {
		return transmission;
	}

	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getDrive() {
		return drive;
	}

	public void setDrive(String drive) {
		this.drive = drive;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDoors() {
		return doors;
	}

	public void setDoors(String doors) {
		this.doors = doors;
	}

	public String getBodyState() {
		return bodyState;
	}

	public void setBodyState(String bodyState) {
		this.bodyState = bodyState;
	}

	public String getOwners() {
		return owners;
	}

	public void setOwners(String owners) {
		this.owners = owners;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getGibdd() {
		return gibdd;
	}

	public void setGibdd(String gibdd) {
		this.gibdd = gibdd;
	}

	public String getYoutube() {
		return youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	public String getFssp() {
		return fssp;
	}

	public void setFssp(String fssp) {
		this.fssp = fssp;
	}

	public String getDriveState() {
		return driveState;
	}

	public void setDriveState(String drive_state) {
		this.driveState = drive_state;
	}

	public String getEngineState() {
		return engineState;
	}

	public void setEngineState(String engine_state) {
		this.engineState = engine_state;
	}

	public String getDamagedElements() {
		return this.damagedElements;
	}

	public List<String> getListOfDamagedElements() {
		return Arrays.asList(this.damagedElements.split(":"));
	}

    public int getNumberPaintedElements() {
        int nums = 0;
        List<String> elements = Arrays.asList(this.damagedElements.split(":"));
        for(String el : elements){
            String result[] = el.split("_");
            if (result.length > 1 && !result[0].equals("12") && !result[0].equals("13")){
                if (result[1].equals("c")){
                    nums++;
                }
            }
        }
        return nums;
    }

	public String getCity() {
		return this.city;
	}

	public String getAdditionalInfo() {
		return this.additionalInfo;
	}

	public void setDamagedElements(String damagedElements) {
		this.damagedElements = damagedElements;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	@XmlTransient
	public User getBuyer() {
		return buyer;
	}

	@XmlTransient
	public Integer getBuyPrice() {
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

	@XmlTransient
	public Integer getCurrently() {
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
	public Integer getFirstBid() {
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

	public void setBuyPrice(Integer buyPrice) {
		this.buyPrice = buyPrice;
	}

	public void setBuyPriceString(String buyPriceString) {
		this.buyPriceString = buyPriceString;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public void setCurrently(Integer currently) {
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

	public void setFirstBid(Integer firstBid) {
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


	public List<String> getImagesForGallery() {
		return imagesForGallery;
	}

	public void setImagesForGallery(List<String> imagesForGallery) {
		this.imagesForGallery = imagesForGallery;
	}

    public String getEngineCapacity() {
        return engineCapacity;
    }

    public void setEngineCapacity(String engineCapacity) {
        this.engineCapacity = engineCapacity;
    }

    public String getOwnersDB() {
        return ownersDB;
    }

    public String getNumberAccidentsDB() {
        return numberAccidentsDB;
    }

    public void setNumberAccidentsDB(String numberAccidentsDB) {
        this.numberAccidentsDB = numberAccidentsDB;
    }

    public boolean isWantedDB() {
        return wantedDB;
    }

    public void setWantedDB(boolean wantedDB) {
        this.wantedDB = wantedDB;
    }

    public boolean isTaxiDB() {
        return taxiDB;
    }

    public void setTaxiDB(boolean taxiDB) {
        this.taxiDB = taxiDB;
    }

    public String getMileageDB() {
        return mileageDB;
    }

    public void setMileageDB(String mileageDB) {
        this.mileageDB = mileageDB;
    }

    public boolean isRestrictionsDB() {
        return restrictionsDB;
    }

    public void setRestrictionsDB(boolean restrictionsDB) {
        this.restrictionsDB = restrictionsDB;
    }
}