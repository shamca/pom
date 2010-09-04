package com.ASC.POM

import com.ASC.POM.POItem

class MyUtilsService {

    boolean transactional = true
    

    def updateExtended(myID) {

      String myStr
      String idStr = String.valueOf(myID)
      myStr = "update POItem set extended_cost = (qty * cost_per_unit) where id = " + idStr
      return POItem.executeUpdate(myStr)

    }
}
