function validateCompanyForm() {

    var isValid = true;

    var hiddenFieldCrudAction = document.getElementById('crudAction');
    var vcCompanyName = document.getElementById('vcCompanyName');
    var bitIsActive = document.querySelector('input[name="bitIsActive"]:checked');


    if (hiddenFieldCrudAction.value == 'delete') {
        isValid = true;
        return;
    } else {    
        if (vcCompanyName.value == "") {
            document.getElementById('vcCompanyNameMessage').innerHTML = "This field is required.";
            isValid = false;
        }
        if (!bitIsActive) {
            document.getElementById('bitIsActiveMessage').innerHTML = "This field is required.";
            isValid = false;
        }
    }

    return isValid;
}