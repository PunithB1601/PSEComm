package com.customer.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Order
{
  private int orderId;
  private int productId;
  private Timestamp orderDate;
  private Timestamp deliveryDate;
  private int eid;
  private int cid;
}
