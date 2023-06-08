function validateUserForm() {

    var isValid = true;

    var hiddenFieldCrudAction = document.getElementById('crudAction');

    var vcUserName = document.getElementById('vcUserName');
    var vcPassword = document.getElementById('vcPassword');
    var bitIsActive = document.querySelector('input[name="bitIsActive"]:checked');
    var bitIsAdmin = document.querySelector('input[name="bitIsAdmin"]:checked');


    if (hiddenFieldCrudAction.value == 'delete') {
        isValid = true;
        return;
    } else {    
        if (vcUserName.value == "") {
            document.getElementById('vcUserNameMessage').innerHTML = "This field is required.";
            isValid = false;
        }
        if (vcPassword.value == "") {
            document.getElementById('vcPasswordMessage').innerHTML = "This field is required.";
            isValid = false;
        }
        if (!bitIsActive) {
            document.getElementById('bitIsActiveMessage').innerHTML = "This field is required.";
            isValid = false;
        }
        if (!bitIsAdmin) {
            document.getElementById('bitIsAdminMessage').innerHTML = "This field is required.";
            isValid = false;
        }

    }

    return isValid;
}