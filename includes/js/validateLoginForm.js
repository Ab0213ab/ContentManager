// Andrew B. Schaefer

function validateLoginForm() {

    var isValid = true;

    var vcUserName = document.getElementById('vcUserName');
    var vcPassword = document.getElementById('vcPassword');

    if (vcUserName.value == "") {
        window.location.href = '#buildLink("main.test")#';
        isValid = false;
    }
    if (vcPassword.value == "") {
        window.location.href = '#buildLink("main.test")#';
        isValid = false;
    }

    return isValid;
}