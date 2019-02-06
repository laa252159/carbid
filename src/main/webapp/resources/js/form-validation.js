// Wait for the DOM to be ready
$(function () {
    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form[name='regForm']").validate({
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            username: {
                required: true,
                minlength: 3,
                alphanumeric : true
            },
            firstName: {
                required: true,
                firstName : true
            },
            email: {
                email :true,
                maxlength: 255
            },
            password: {
                required: true,
                minlength: 5
            },
            phone: {
                required: true,
                number: true,
                minlength: 5,
                maxlength: 11
                // phone : true
            }
        },
        // Specify validation error messages
        messages: {
            username: "не менее 3- символов (буквы, цифры)",
            email: "введите действующий адрес электронной почты",
            password: "не менее 5 знаков",
            matchingPassword: "введите пароль повторно",
            phone: "только цифры",
            firstName: "только кириллица"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function (form) {
            form.submit();
        }

    });
    //проверка только на буквы и цифры
    jQuery.validator.addMethod("alphanumeric", function(value, element) {
        return /^[A-Za-z0-9 _.-]+$/.test(value);
    }, "*");

    //проверка электронки
    jQuery.validator.addMethod("email", function(value, element) {
        return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i.test(value);
    }, "*");

    //проверка имени
    jQuery.validator.addMethod("firstName", function(value, element) {
        return /^[\u0400-\u04FF]*$/.test(value);
    }, "*");

    //проверка телефонного номера
    // jQuery.validator.addMethod("phone", function(value, element) {
    //     return /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/.test(value);
    // }, "*");
});



function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#matchingPassword").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("<p style='color: red; font-size: 16px'>пароли не совпадают</p>");
    else
        $("#divCheckPasswordMatch").html("<p style='color: green; font-size: 16px'>пароли совпадают</p>");
}

$(document).ready(function () {
    $("#password, #matchingPassword").keyup(checkPasswordMatch);
});

