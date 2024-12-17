package com.customer.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Cart
{
 @Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", cid=" + cid + ", productId=" + productId + "]";
	}
private int cartId;
 private int cid;
 private int productId;
}
