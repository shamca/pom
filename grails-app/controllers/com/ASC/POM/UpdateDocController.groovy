package com.ASC.POM

class UpdateDocController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [updateDocInstanceList: UpdateDoc.list(params), updateDocInstanceTotal: UpdateDoc.count()]
    }

    def create = {
        def updateDocInstance = new UpdateDoc()
        updateDocInstance.properties = params
        return [updateDocInstance: updateDocInstance]
    }

    def save = {
        def updateDocInstance = new UpdateDoc(params)
        if (updateDocInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), updateDocInstance.id])}"
            redirect(action: "show", id: updateDocInstance.id)
        }
        else {
            render(view: "create", model: [updateDocInstance: updateDocInstance])
        }
    }

    def show = {
        def updateDocInstance = UpdateDoc.get(params.id)
        if (!updateDocInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), params.id])}"
            redirect(action: "list")
        }
        else {
            [updateDocInstance: updateDocInstance]
        }
    }

    def edit = {
        def updateDocInstance = UpdateDoc.get(params.id)
        if (!updateDocInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [updateDocInstance: updateDocInstance]
        }
    }

    def update = {
        def updateDocInstance = UpdateDoc.get(params.id)
        if (updateDocInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (updateDocInstance.version > version) {
                    
                    updateDocInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'updateDoc.label', default: 'UpdateDoc')] as Object[], "Another user has updated this UpdateDoc while you were editing")
                    render(view: "edit", model: [updateDocInstance: updateDocInstance])
                    return
                }
            }
            updateDocInstance.properties = params
            if (!updateDocInstance.hasErrors() && updateDocInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), updateDocInstance.id])}"
                redirect(action: "show", id: updateDocInstance.id)
            }
            else {
                render(view: "edit", model: [updateDocInstance: updateDocInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def updateDocInstance = UpdateDoc.get(params.id)
        if (updateDocInstance) {
            try {
                updateDocInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'updateDoc.label', default: 'UpdateDoc'), params.id])}"
            redirect(action: "list")
        }
    }
}
