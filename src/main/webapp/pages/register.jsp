<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/dc1776693c.js" crossorigin="anonymous"></script>
    <title>Registration Form</title>
    <style type="text/css">
        <%@ include file="/pages/styles/registerStyle.css" %>
    </style>
</head>
<body>
<div class="main-block" id="main-block">
    <p>${message}</p>
    <form class="content" action="registerProcess" method="POST" enctype="multipart/form-data">
        <div>
            <h3>Registration Form</h3>
        </div>

        <div class="form-group field">
            <label for="name" class="col-md-4 control-label">Name:</label>
            <input id="name" name="name" placeholder="name" type="text" class="form-control"
                   onkeypress="return isAlphabetKey(event)" required="required"/>
        </div>

        <div class="form-group field">
            <label for="family" class="col-md-4 control-label">Family:</label>
            <input id="family" name="family" placeholder="Family" class="form-control"
                   onkeypress="return isAlphabetKey(event)" required="required"/>
        </div>
        <div class="custom-file mb-3">
            <label for="image" class="custom-file-label">Choose Image:</label>
            <input id="image" name="file" class="custom-file-input" type="file" required/>
        </div>

        <div class="span2">
            <button id="register" name="register" class="btn btn-primary btn-block button">Register</button>
        </div>
    </form>
</div>
</body>
<script>
    $(".custom-file-input").on("change", function () {
        const fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });

    function isAlphabetKey(evt) {
        const charCode = evt.keyCode;
        const isAlphabet = ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode === 8 || charCode === 32);
        if (!isAlphabet) {
            window.alert("Just Alphabets Are Allowed");
            return false;
        }
    }
</script>
</html>