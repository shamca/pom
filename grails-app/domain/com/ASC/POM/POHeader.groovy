package com.ASC.POM

class POHeader {
  Date fiscalYear
  String vendor
  Integer po_number
  String justification
  String title

  static hasMany = [poitems:POItem]

    static constraints = {
      
    }
}
