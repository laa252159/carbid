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
                minlength: 3
            },
            email: {
                email :true,
                maxlength: 255
            },
            password: {
                required: true
            }
            // ,
            // matchingPassword: {
            //     required: true,
            // }
        },
        // Specify validation error messages
        messages: {
            username: "не менее 3х символов (буквы, цифры)",
            email: "введите действующий адрес электронной почты",
            password: "Введите имя",
            matchingPassword: "Введите пароль повторно"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function (form) {
            form.submit();
        }
    });

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

