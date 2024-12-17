package com.customer.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Customer
{
  private int cid;
  private String firstName;
  private String lastName;
  private int lid;
  private String email;
  private String password;
  private long phone;
@Override
public String toString() {
	return "Customer [cid=" + cid + ", firstName=" + firstName + ", lastName=" + lastName + ", lid=" + lid + ", email="
			+ email + ", password=" + password + ", phone=" + phone + "]";
}
  
}

