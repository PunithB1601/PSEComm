package com.emp.DTO;

public class Location {
    String Location; // Changed from City to Location
    String City;     // Changed from Pincode to City
    String State;
    int lid;
    
    

    public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	// Getter and Setter for Location
    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        Location = location;
    }

    // Getter and Setter for City
    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    // Getter and Setter for State
    public String getState() {
        return State;
    }

    public void setState(String state) {
        State = state;
    }

    @Override
    public String toString() {
        return "Location [Location=" + Location + ", City=" + City + ", State=" + State + "]";
    }
}
