package com.ASC.POM

class POUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [POUserInstanceList: POUser.list(params), POUserInstanceTotal: POUser.count()]
    }

    def create = {
        def POUserInstance = new POUser()
        POUserInstance.properties = params
        return [POUserInstance: POUserInstance]
    }

    def save = {
        def POUserInstance = new POUser(params)
        if (POUserInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'POUser.label', default: 'POUser'), POUserInstance.id])}"
            redirect(action: "show", id: POUserInstance.id)
        }
        else {
            render(view: "create", model: [POUserInstance: POUserInstance])
        }
    }

    def show = {
        def POUserInstance = POUser.get(params.id)
        if (!POUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POUser.label', default: 'POUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            [POUserInstance: POUserInstance]
        }
    }

    def edit = {
        def POUserInstance = POUser.get(params.id)
        if (!POUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POUser.label', default: 'POUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [POUserInstance: POUserInstance]
        }
    }

    def update = {
        def POUserInstance = POUser.get(params.id)
        if (POUserInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (POUserInstance.version > version) {
                    
                    POUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'POUser.label', default: 'POUser')] as Object[], "Another user has updated this POUser while you were editing")
                    render(view: "edit", model: [POUserInstance: POUserInstance])
                    return
                }
            }
            POUserInstance.properties = params
            if (!POUserInstance.hasErrors() && POUserInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'POUser.label', default: 'POUser'), POUserInstance.id])}"
                redirect(action: "show", id: POUserInstance.id)
            }
            else {
                render(view: "edit", model: [POUserInstance: POUserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POUser.label', default: 'POUser'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def POUserInstance = POUser.get(params.id)
        if (POUserInstance) {
            try {
                POUserInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'POUser.label', default: 'POUser'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'POUser.label', default: 'POUser'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'POUser.label', default: 'POUser'), params.id])}"
            redirect(action: "list")
        }
    }
}
