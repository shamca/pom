package com.ASC.POM

class POItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

   

    def MyUtilsService


    def testURL = {
      def POItemInstance = new POItem(params)
      MyUtilsService.updateExtended(POItemInstance.id)
      redirect(action: "list", params: params)
  }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [POItemInstanceList: POItem.list(params), POItemInstanceTotal: POItem.count()]
    }

    def create = {
        def POItemInstance = new POItem()
        POItemInstance.properties = params
        return [POItemInstance: POItemInstance]
    }

    def save = {
        def POItemInstance = new POItem(params)
        MyUtilsService.updateExtended(POItemInstance.id)
        if (POItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'POItem.label', default: 'POItem'), POItemInstance.id])}"
            redirect(action: "show", id: POItemInstance.id)
        }
        else {
            render(view: "create", model: [POItemInstance: POItemInstance])
        }
    }

    def show = {
        def POItemInstance = POItem.get(params.id)
        if (!POItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POItem.label', default: 'POItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [POItemInstance: POItemInstance]
        }
    }

    def edit = {
        def POItemInstance = POItem.get(params.id)
        if (!POItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POItem.label', default: 'POItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [POItemInstance: POItemInstance]
        }
    }

    def update = {
        def POItemInstance = POItem.get(params.id)
        MyUtilsService.updateExtended(POItemInstance.id)
        if (POItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (POItemInstance.version > version) {
                    
                    POItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'POItem.label', default: 'POItem')] as Object[], "Another user has updated this POItem while you were editing")
                    render(view: "edit", model: [POItemInstance: POItemInstance])
                    return
                }
            }
            POItemInstance.properties = params
            if (!POItemInstance.hasErrors() && POItemInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'POItem.label', default: 'POItem'), POItemInstance.id])}"
                redirect(action: "show", id: POItemInstance.id)
            }
            else {
                render(view: "edit", model: [POItemInstance: POItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POItem.label', default: 'POItem'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def POItemInstance = POItem.get(params.id)
        if (POItemInstance) {
            try {
                POItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'POItem.label', default: 'POItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'POItem.label', default: 'POItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POItem.label', default: 'POItem'), params.id])}"
            redirect(action: "list")
        }
    }
}
