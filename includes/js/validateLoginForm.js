function validateLoginForm() {

    var isValid = true;
    const noNumsRegEx = /^[A-Za-z]+$/; 

    var vcUserName = document.getElementById('vcUserName');
    var vcPassword = document.getElementById('vcPassword');

    if (!noNumsRegEx.test(vcUserName.value)) {
        if (vcUserName.value == "") {
            document.getElementById('vcUserNameMessage').innerHTML = "This field cannot be empty.";
            isValid = false;
        } else {
            document.getElementById('vcUserNameMessage').innerHTML = "This field only allows letters.";
            isValid = false;
        }   
    }
    if (vcPassword.value == "") {
        document.getElementById('vcPasswordMessage').innerHTML = "This field cannot be empty.";
        isValid = false;
    }

    return isValid;
}