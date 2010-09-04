package com.ASC.POM

class POHeaderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [POHeaderInstanceList: POHeader.list(params), POHeaderInstanceTotal: POHeader.count()]
    }

    def create = {
        def POHeaderInstance = new POHeader()
        POHeaderInstance.properties = params
        return [POHeaderInstance: POHeaderInstance]
    }

    def save = {
        def POHeaderInstance = new POHeader(params)
        if (POHeaderInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'POHeader.label', default: 'POHeader'), POHeaderInstance.id])}"
            redirect(action: "show", id: POHeaderInstance.id)
        }
        else {
            render(view: "create", model: [POHeaderInstance: POHeaderInstance])
        }
    }

    def show = {
        def POHeaderInstance = POHeader.get(params.id)
          if (!POHeaderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POHeader.label', default: 'POHeader'), params.id])}"
            redirect(action: "list")
        }
        else {
            [POHeaderInstance: POHeaderInstance]
        }
    }

    def edit = {
        def POHeaderInstance = POHeader.get(params.id)
        if (!POHeaderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POHeader.label', default: 'POHeader'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [POHeaderInstance: POHeaderInstance]
        }
    }

    def update = {
        def POHeaderInstance = POHeader.get(params.id)
        if (POHeaderInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (POHeaderInstance.version > version) {
                    
                    POHeaderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'POHeader.label', default: 'POHeader')] as Object[], "Another user has updated this POHeader while you were editing")
                    render(view: "edit", model: [POHeaderInstance: POHeaderInstance])
                    return
                }
            }
            POHeaderInstance.properties = params
            if (!POHeaderInstance.hasErrors() && POHeaderInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'POHeader.label', default: 'POHeader'), POHeaderInstance.id])}"
                redirect(action: "show", id: POHeaderInstance.id)
            }
            else {
                render(view: "edit", model: [POHeaderInstance: POHeaderInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POHeader.label', default: 'POHeader'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def POHeaderInstance = POHeader.get(params.id)
        if (POHeaderInstance) {
            try {
                POHeaderInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'POHeader.label', default: 'POHeader'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'POHeader.label', default: 'POHeader'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POHeader.label', default: 'POHeader'), params.id])}"
            redirect(action: "list")
        }
    }
}
