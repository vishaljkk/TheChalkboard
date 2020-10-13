$(document).ready(function (e) {

    var msg = getUrlVars()["message"];
    if (msg != null && msg != '') {
        Error(decodeURIComponent(msg));
        window.history.pushState({}, document.title, window.location.pathname);
    }

    $(document).on('click', '#btnLogIn', function (e) {
        if ($('#emailID').val().trim() == '') {
            SetControlError('#emailID', '', false);
            return false;
        }
        else {
            SetControlError('#emailID', '', true);
        }

        if ($('#password').val().trim() == '') {
            SetControlError('#password', '', false);
            return false;
        }
        else {
            SetControlError('#password', '', true);
        }
        return true;
    });

});