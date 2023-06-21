function validateCompanyForm() {

    var isValid = true;

    var vcCompanyName = document.getElementById('vcCompanyName');
    var bitIsActive = document.querySelector('input[name="bitIsActive"]:checked');
  
    if (vcCompanyName.value.trim() == "") {
        document.getElementById('vcCompanyNameMessage').innerHTML = "This field is required.";
        isValid = false;
    }
    if (!bitIsActive) {
        document.getElementById('bitIsActiveMessage').innerHTML = "This field is required.";
        isValid = false;
    }

    return isValid;
}