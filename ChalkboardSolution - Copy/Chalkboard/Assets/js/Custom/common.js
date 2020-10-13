function toggleErrorControl(control) {
    if (control.isValid) {
        $(control.selecector).removeClass("error");
    } else {
        $(control.selecector).addClass("error");
        $(control.selecector).focus();
        //$(control.selector).focus();

    }
}

function SetControlError(controlName, errorMessage, isvalid) {
    var control = {};
    control.selecector = controlName;
    control.isValid = isvalid;
    control.errorMessage = "";
    toggleErrorControl(control)
}

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}