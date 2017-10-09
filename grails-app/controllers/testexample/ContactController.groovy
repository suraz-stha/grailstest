package testexample

import grails.validation.ValidationException
import org.springframework.transaction.annotation.Transactional

import static org.springframework.http.HttpStatus.*

class ContactController {

    ContactService contactService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def all= Contact.list()
        [ all : all]
        params.max = Math.min(max ?: 10, 100)
        respond contactService.list(params), model:[contactCount: contactService.count()]
    }

    def show(Long id) {
        respond contactService.get(id)
    }

    def listAll(){
        def allContact = Contact.list();
        //[ listcontact : allContact]
        render allContact
    }

    def hello(){
        def allContact = Contact.list();
       // respond model: [allContact: allContact]
        render (view: 'list',model: [
                allContact: allContact
        ])
    }

    def del(Long id){
        print(params)
        def contact = Contact.findById(id)
        contact.delete(flush:true)
        redirect(action: listAll())
    }

    def create() {
        respond new Contact(params)
    }

    def save(Contact contact) {
        if (contact == null) {
            notFound()
            return
        }

        try {
            contactService.save(contact)
        } catch (ValidationException e) {
            respond contact.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contact.id])
                redirect contact
            }
            '*' { respond contact, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond contactService.get(id)
    }

    def update(Contact contact) {
        if (contact == null) {
            notFound()
            return
        }

        try {
            contactService.save(contact)
        } catch (ValidationException e) {
            respond contact.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contact.label', default: 'Contact'), contact.id])
                redirect contact
            }
            '*'{ respond contact, [status: OK] }
        }
    }

    def delete(Long id) {
        print params
        if (id == null) {
            notFound()
            return
        }

        contactService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
