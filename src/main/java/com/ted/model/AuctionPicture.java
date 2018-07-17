package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the auction_pictures database table.
 * 
 */
@Entity
@Table(name="auction_pictures")
@NamedQuery(name="AuctionPicture.findAll", query="SELECT a FROM AuctionPicture a")
public class AuctionPicture implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="pic_id", unique=true, nullable=false)
	private int picId;

	// bi-directional many-to-one association to Auction
	@ManyToOne
	@JoinColumn(name = "auction_id", nullable = false)
	private Auction auction;

	@Lob
	@Column(name="auction_picturescol", nullable=false)
	private byte[] auctionPicturescol;

	public AuctionPicture() {
	}

	public Auction getAuction() {
		return auction;
	}

	public byte[] getAuctionPicturescol() {
		return this.auctionPicturescol;
	}

	public int getPicId() {
		return this.picId;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	public void setAuctionPicturescol(byte[] auctionPicturescol) {
		this.auctionPicturescol = auctionPicturescol;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

}