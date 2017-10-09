<!DOCTYPE html>
<html>
<head>
    <title>hello</title>
</head>
<body>

<div class="container">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>edit</th>
            <th>delete</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${allContact}" var="thisContact">

            <tr>
                <td>${thisContact.name}</td>
                <td>${thisContact.age}</td>
                <td>${thisContact.address}</td>
                <td><g:link action="edit" id="${thisContact.id}">edit</g:link></td>
                <td><g:link action="del" id="${thisContact.id}">delete</g:link></td>


            </tr>


        </g:each>
        </tbody>
    </table>
</div>

</body>
</html>