package com.ted.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * The persistent class for the auction_bidding database table.
 * 
 */

@SqlResultSetMapping(
    name = "CommonBidMapping",
	classes={
        @ConstructorResult(targetClass=CommonBid.class,
        columns={
            @ColumnResult(name="userid", type=Integer.class),
            @ColumnResult(name="count", type=Long.class)
        })
    }
)

@Entity
@Table(name = "auction_bidding")
@NamedQuery(name = "AuctionBidding.findAll", query = "SELECT a FROM AuctionBidding a")
@NamedNativeQueries({
//@NamedNativeQuery(name = "AuctionBidding.getAllBidsCount", 
//	query = "SELECT bidder_userid, COUNT(*) FROM auction_bidding GROUP BY bidder_userid", resultSetMapping = "CommonBidMapping"),
@NamedNativeQuery(name = "AuctionBidding.getCommonBidsCount", 
		query = "select similar.bidder_userid as userid, count(*) as count from auction_bidding target "
		+ "join auction_bidding similar on target.auctionid = similar.auctionid and target.bidder_userid != similar.bidder_userid "
		+ "where (target.bidder_userid = :userid)"
		+ "group by similar.bidder_userid", resultSetMapping = "CommonBidMapping")
})
@XmlType(propOrder = {"user", "xmlTime", "amountString"})
@XmlRootElement(name = "bid")
public class AuctionBidding implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private AuctionBiddingPK id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false)
	private Date time;

	// bi-directional many-to-one association to Auction
	@ManyToOne
	@JoinColumn(name = "auctionid", nullable = false, insertable = false, updatable = false)
	private Auction auction;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "bidder_userid", nullable = false, insertable = false, updatable = false)
	private User user;
	
	@Transient
	private String xmlTime;
	
	@Transient
	private String amountString;

	public AuctionBidding() {
	}

	@XmlElement(name = "Amount")
	public String getAmountString() {
		return amountString;
	}

	@XmlTransient
	public Auction getAuction() {
		return this.auction;
	}

	@XmlTransient
	public AuctionBiddingPK getId() {
		return this.id;
	}

	@XmlTransient
	public Date getTime() {
		return time;
	}

	@XmlElement(name = "Bidder")
	public User getUser() {
		return this.user;
	}

	@XmlElement(name = "Time")
	public String getXmlTime() {
		return xmlTime;
	}

	public void setAmountString(String amountString) {
		this.amountString = amountString;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	public void setId(AuctionBiddingPK id) {
		this.id = id;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setXmlTime(String xmlTime) {
		this.xmlTime = xmlTime;
	}

}