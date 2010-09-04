package com.ASC.POM

class POItem {
  POHeader poheader
  String poitem_description
  Integer qty
  Float cost_per_unit
  Float extended_cost
  String recipient

  static belongsTo = POHeader



  
    static constraints = {

    }
}
