$(document).ready(function () {
    var isValidEmail = false;
    $(document).on('click', '#regSubmit', function (e) {
        e.preventDefault();
        CheckEmailExists();
        if (!validateEmail() || !validateName() || !isValidEmail) {
            return;
        }
        $.ajax({
            type: "POST",
            global: false,
            headers: { '__RequestVerificationToken': $('[name=__RequestVerificationToken]').val() },
            url: $('#hiddenBaseURL').val() + "Register/SaveRegistration",
            data: $('#frmRegistration').serialize(),
            success: function (result) {
                if (result.Result) {
                    Success("You have successfully registered. Please login to application.");
                    $('#frmRegistration').each(function () {
                        this.reset();
                    });
                }
                else {
                    Error("Failed");
                }
            },
            complete: function () {

            },
            error: function (a, b, c) {
                Error(a + b + c + " occured")
                return false;
            }
        });
    });

    $(document).on('blur', '#r_EMAILID', function (e) {
        var flag = validateEmail();
        if (flag) {
            CheckEmailExists();
        }
    });

    $(document).on('blur', '#r_NAME', function (e) {
        validateName();
    });

    $(document).on('blur', '#r_LOGINNAME', function (e) {
        validateLoginName();
    });

});


function CheckEmailExists() {
    var flag = true;
    var email = $('#r_EMAILID').val();
    $.ajax({
        type: 'GET',
        url: $('#hiddenBaseURL').val() + "Register/CheckEmailExists?email=" + email,
        async: false,
        success: function (result) {
            isValidEmail = result.Result;
            if (result.Result) {
                SetControlError('#r_EMAILID', '', false);
                Error("Email already exists. In case you have forgotten your password, please click forgot password.")
                flag = false;
            }
            else {
                SetControlError('#r_EMAILID', '', true);
            }
        },
        error: function (a, b, c) {
            toastr.error(Messages["MSG9002"]);
            return false;
        }
    });
}

function validateEmail() {
    var flag = true;
    var emailregex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var email = $('#r_EMAILID').val();
    if (email.trim() == '' || !email.trim().match(emailregex)) {
        SetControlError('#r_EMAILID', '', false);
        flag = false;
    }
    else {
        SetControlError('#r_EMAILID', '', true);
    }
    return flag;
}

function validateName() {
    var flag = true;
    var name = $('#r_NAME').val();
    if (name.trim() == '') {
        SetControlError('#r_NAME', '', false);
        flag = false;
    }
    else {
        SetControlError('#r_NAME', '', true);
    }
    return flag;
}

function validateLoginName() {
    var flag = true;
    var name = $('#r_LOGINNAME').val();
    if (name.trim() == '') {
        SetControlError('#r_LOGINNAME', '', false);
        flag = false;
    }
    else {
        SetControlError('#r_LOGINNAME', '', true);
    }
    return flag;
}