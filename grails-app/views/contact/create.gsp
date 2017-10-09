<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-contact" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.contact}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.contact}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.contact}" method="POST">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label >name</label>
                                <input type="text" class="form-control" name="name" placeholder="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="form-group">
                                <label >address</label>
                                <input type="text" class="form-control" name="address" placeholder="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="form-group">
                                <label >email</label>
                                <input type="email" class="form-control" name="email" placeholder="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="form-group">
                                <label >phone</label>
                                <input type="text" class="form-control" name="phone" placeholder="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="form-group">
                                <label >phone</label>
                                <label >male</label>
                                <input type="radio" name="gender" value="0">
                                <label >female</label>
                                <input type="radio" name="gender" value="1">
                            </div>
                            <div class="form-group">
                                <label >age</label>
                                <input type="text" class="form-control" name="age" placeholder="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="form-group">
                                <label for="sel1">Status:</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="active">active</option>
                                    <option value="inactive">inactive</option>
                                </select>
                            </div>

                            <div class="input-group">
                                <button class="btn-success" type="submit">create</button>
                            </div>

                        </div>
                    </div>
                </div>

            </g:form>
        </div>
    </body>
</html>
