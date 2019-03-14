package com.ted.model;

import org.springframework.web.multipart.MultipartFile;

public class FormAuction {
	
	Auction auction;
	
	MultipartFile[] files;
	
	String categoryName;

	String el1;

	String el2;

	String el3;

	String el4;

	String el5;

	String el6;

	String el7;

	String el8;

	String el9;

	String el10;

	String el11;

	String el12;

	String el13;

	private String powerSteering;

	String climateControl;

	boolean controlOnWheel;

	boolean leatherWheel;

	boolean backCamera;

	String heatedSeats;

	boolean heatedMirrors;

	boolean heatedWheel;

	String powerWindows;

	boolean powerSeatsFront;

	boolean powerMirrors;

	boolean lightSensor;

	boolean rainSensor;

	boolean frontParkingSensors;

	boolean rearParkingSensors;

	String cruiseControl;

	String alarm;

	String audioSystem;

	boolean airbags;

	boolean abs;

	boolean antiSlip;

	boolean directionalStability;

	boolean gps;

	String carStereo;

	boolean subwoofer;

	String headlights;

	boolean wheels;

	boolean winterTires;

	boolean vehicleLogBook;

	boolean warrantyOn;

	boolean onBoardComputer;

	public Auction getAuction() {
		return auction;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getEl1() {
		return el1;
	}

	public void setEl1(String el1) {
		this.el1 = el1;
	}

	public String getEl2() {
		return el2;
	}

	public void setEl2(String el2) {
		this.el2 = el2;
	}

	public String getEl3() {
		return el3;
	}

	public void setEl3(String el3) {
		this.el3 = el3;
	}

	public String getEl4() {
		return el4;
	}

	public void setEl4(String el4) {
		this.el4 = el4;
	}

	public String getEl5() {
		return el5;
	}

	public void setEl5(String el5) {
		this.el5 = el5;
	}

	public String getEl6() {
		return el6;
	}

	public void setEl6(String el6) {
		this.el6 = el6;
	}

	public String getEl7() {
		return el7;
	}

	public void setEl7(String el7) {
		this.el7 = el7;
	}

	public String getEl8() {
		return el8;
	}

	public void setEl8(String el8) {
		this.el8 = el8;
	}

	public String getEl9() {
		return el9;
	}

	public void setEl9(String el9) {
		this.el9 = el9;
	}

	public String getEl10() {
		return el10;
	}

	public void setEl10(String el10) {
		this.el10 = el10;
	}

	public String getEl11() {
		return el11;
	}

	public void setEl11(String el11) {
		this.el11 = el11;
	}

	public String getEl12() {
		return el12;
	}

	public void setEl12(String el12) {
		this.el12 = el12;
	}

	public String getEl13() {
		return el13;
	}

	public void setEl13(String el13) {
		this.el13 = el13;
	}

	public String getPowerSteering() {
		return powerSteering;
	}

	public void setPowerSteering(String powerSteering) {
		this.powerSteering = powerSteering;
	}

	public String getClimateControl() {
		return climateControl;
	}

	public void setClimateControl(String climateControl) {
		this.climateControl = climateControl;
	}

	public String getHeatedSeats() {
		return heatedSeats;
	}

	public void setHeatedSeats(String heatedSeats) {
		this.heatedSeats = heatedSeats;
	}

	public boolean isControlOnWheel() {
		return controlOnWheel;
	}

	public void setControlOnWheel(boolean controlOnWheel) {
		this.controlOnWheel = controlOnWheel;
	}

	public boolean isLeatherWheel() {
		return leatherWheel;
	}

	public void setLeatherWheel(boolean leatherWheel) {
		this.leatherWheel = leatherWheel;
	}

	public boolean isBackCamera() {
		return backCamera;
	}

	public void setBackCamera(boolean backCamera) {
		this.backCamera = backCamera;
	}

	public boolean isHeatedMirrors() {
		return heatedMirrors;
	}

	public void setHeatedMirrors(boolean heatedMirrors) {
		this.heatedMirrors = heatedMirrors;
	}

	public boolean isHeatedWheel() {
		return heatedWheel;
	}

	public void setHeatedWheel(boolean heatedWheel) {
		this.heatedWheel = heatedWheel;
	}

	public String getPowerWindows() {
		return powerWindows;
	}

	public void setPowerWindows(String powerWindows) {
		this.powerWindows = powerWindows;
	}

	public boolean isPowerSeatsFront() {
		return powerSeatsFront;
	}

	public void setPowerSeatsFront(boolean powerSeatsFront) {
		this.powerSeatsFront = powerSeatsFront;
	}

	public boolean isPowerMirrors() {
		return powerMirrors;
	}

	public void setPowerMirrors(boolean powerMirrors) {
		this.powerMirrors = powerMirrors;
	}

	public boolean isLightSensor() {
		return lightSensor;
	}

	public void setLightSensor(boolean lightSensor) {
		this.lightSensor = lightSensor;
	}

	public boolean isRainSensor() {
		return rainSensor;
	}

	public void setRainSensor(boolean rainSensor) {
		this.rainSensor = rainSensor;
	}

	public boolean isFrontParkingSensors() {
		return frontParkingSensors;
	}

	public void setFrontParkingSensors(boolean frontParkingSensors) {
		this.frontParkingSensors = frontParkingSensors;
	}

	public boolean isRearParkingSensors() {
		return rearParkingSensors;
	}

	public void setRearParkingSensors(boolean rearParkingSensors) {
		this.rearParkingSensors = rearParkingSensors;
	}

	public String getCruiseControl() {
		return cruiseControl;
	}

	public void setCruiseControl(String cruiseControl) {
		this.cruiseControl = cruiseControl;
	}

	public String getAlarm() {
		return alarm;
	}

	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}

	public String getAudioSystem() {
		return audioSystem;
	}

	public void setAudioSystem(String audioSystem) {
		this.audioSystem = audioSystem;
	}

	public boolean isAirbags() {
		return airbags;
	}

	public void setAirbags(boolean airbags) {
		this.airbags = airbags;
	}

	public boolean isAbs() {
		return abs;
	}

	public void setAbs(boolean abs) {
		this.abs = abs;
	}

	public boolean isAntiSlip() {
		return antiSlip;
	}

	public void setAntiSlip(boolean antiSlip) {
		this.antiSlip = antiSlip;
	}

	public boolean isDirectionalStability() {
		return directionalStability;
	}

	public void setDirectionalStability(boolean directionalStability) {
		this.directionalStability = directionalStability;
	}

	public boolean isGps() {
		return gps;
	}

	public void setGps(boolean gps) {
		this.gps = gps;
	}

	public String getCarStereo() {
		return carStereo;
	}

	public void setCarStereo(String carStereo) {
		this.carStereo = carStereo;
	}

	public boolean isSubwoofer() {
		return subwoofer;
	}

	public void setSubwoofer(boolean subwoofer) {
		this.subwoofer = subwoofer;
	}

	public String getHeadlights() {
		return headlights;
	}

	public void setHeadlights(String headlights) {
		this.headlights = headlights;
	}

	public boolean isWheels() {
		return wheels;
	}

	public void setWheels(boolean wheels) {
		this.wheels = wheels;
	}

	public boolean isWinterTires() {
		return winterTires;
	}

	public void setWinterTires(boolean winterTires) {
		this.winterTires = winterTires;
	}

	public boolean isVehicleLogBook() {
		return vehicleLogBook;
	}

	public void setVehicleLogBook(boolean vehicleLogBook) {
		this.vehicleLogBook = vehicleLogBook;
	}

	public boolean isWarrantyOn() {
		return warrantyOn;
	}

	public void setWarrantyOn(boolean warrantyOn) {
		this.warrantyOn = warrantyOn;
	}

	public boolean isOnBoardComputer() {
		return onBoardComputer;
	}

	public void setOnBoardComputer(boolean onBoardComputer) {
		this.onBoardComputer = onBoardComputer;
	}
}
