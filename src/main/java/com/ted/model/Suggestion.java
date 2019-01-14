package com.ted.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * The persistent class for the users database table.
 *
 */
@Entity
@Table(name = "suggestions")
@NamedQuery(name = "Suggestion.findAll", query = "SELECT s FROM Suggestion s")
@XmlRootElement
public class Suggestion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false, name = "suggestionid")
	private Long suggestionId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false, name = "suggestion_date")
	private Date suggestionDate;

	@Column(nullable = false, length = 45, name = "brand_and_model")
	private String brandAndModel;

	@Column(nullable = false, length = 45, name = "release_date")
	private String releaseDate;

	@Column(nullable = false, length = 45, name = "name")
	private String name;

	@Column(nullable = false, length = 15, name = "phone_number")
	private String phoneNumber;

	@Column(nullable = false, length = 200, name = "description")
	private String description;

	@Column(nullable = false, name = "sent_to_admin")
	private byte sentToAdmin;


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Long getSuggestionId() {
		return suggestionId;
	}

	public void setSuggestionId(Long suggestionId) {
		this.suggestionId = suggestionId;
	}

	public Date getSuggestionDate() {
		return suggestionDate;
	}

	public void setSuggestionDate(Date suggestionDate) {
		this.suggestionDate = suggestionDate;
	}

	public String getBrandAndModel() {
		return brandAndModel;
	}

	public void setBrandAndModel(String brandAndModel) {
		this.brandAndModel = brandAndModel;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte getSentToAdmin() {
		return sentToAdmin;
	}

	public void setSentToAdmin(byte sentToAdmin) {
		this.sentToAdmin = sentToAdmin;
	}

	@Override
	public String toString() {
		return "Предложенное авто: \n" +
				"Имя - " + name + '\n' +
				"Бренд и модель - '" + brandAndModel +  '\n' +
				"Год выпуска - '" + releaseDate + '\n' +
				"Телефон - " + phoneNumber + '\n';
	}
}
