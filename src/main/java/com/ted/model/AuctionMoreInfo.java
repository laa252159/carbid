package com.ted.model;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 * The persistent class for the auction_more_info database table.
 */
@Entity
@Table(name = "auction_more_info")
@XmlRootElement(name = "Item")
public class AuctionMoreInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(unique = true, nullable = false)
    private int auctionid;

    @OneToOne(mappedBy = "auctionMoreInfo", cascade = CascadeType.ALL)
    private Auction auction;

    @Column(name = "power_steering", nullable = true)
    private String powerSteering;

    @Column(name = "climate_control")
    private String climateControl;

    @Column(name = "control_on_wheel")
    boolean controlOnWheel;

    @Column(name = "leather_wheel")
    boolean leatherWheel;

    @Column(name = "back_camera")
    boolean backCamera;

    @Column(name = "heated_seats")
    String heatedSeats;

    @Column(name = "heated_mirrors")
    boolean heatedMirrors;

    @Column(name = "heated_wheel")
    boolean heatedWheel;

    @Column(name = "power_windows")
    String powerWindows;

    @Column(name = "power_seats_front")
    boolean powerSeatsFront;

    @Column(name = "light_sensor")
    boolean lightSensor;

    @Column(name = "rain_sensor")
    boolean rainSensor;

    @Column(name = "front_parking_sensors")
    boolean frontParkingSensors;

    @Column(name = "rear_parking_sensors")
    boolean rearParkingSensors;

    @Column(name = "cruise_control")
    String cruiseControl;

    @Column(name = "alarm")
    String alarm;

    @Column(name = "audioSystem")
    String audioSystem;

    @Column(name = "airbags")
    boolean airbags;

    @Column(name = "abs")
    boolean abs;

    @Column(name = "anti_slip")
    boolean antiSlip;

    @Column(name = "directional_stability")
    boolean directionalStability;

    @Column(name = "car_stereo")
    String carStereo;

    @Column(name = "headlights")
    String headlights;

    @Column(name = "wheels")
    boolean wheels;

    @Column(name = "winter_tires")
    boolean winterTires;

    @Column(name = "vehicle_log_book")
    boolean vehicleLogBook;

    @Column(name = "warranty_on")
    boolean warrantyOn;

    @Column(name = "on_board_computer")
    boolean onBoardComputer;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getAuctionid() {
        return auctionid;
    }

    public void setAuctionid(int auctionid) {
        this.auctionid = auctionid;
    }

    public Auction getAuction() {
        return auction;
    }

    public void setAuction(Auction auction) {
        this.auction = auction;
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

    public String getHeatedSeats() {
        return heatedSeats;
    }

    public void setHeatedSeats(String heatedSeats) {
        this.heatedSeats = heatedSeats;
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

    public String getCarStereo() {
        return carStereo;
    }

    public void setCarStereo(String carStereo) {
        this.carStereo = carStereo;
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