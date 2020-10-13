
$(function () {
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-center",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }


});


function Success(msg) {
    toastr.options.positionClass = 'toast-top-center'
    toastr["success"](msg, "Success");
}

function Error(msg) {
    toastr.options.positionClass = 'toast-top-center'
    toastr["error"](msg, "Error");
}

function Warning(msg) {
    toastr["warning"](msg, "Warning");
}