function validateEmployeeForm() {

    var isValid = true;

    const noNumsRegEx = /^[A-Za-z\s]+$/;
    const noNumsOrEmptyStrRegEx = /^(?!$)[A-Za-z\s]+$/;
    const noLettersRegEx = /^[0-9\s]+$/;

    var vcLastName = document.getElementById('vcLastName');
    var vcFirstName = document.getElementById('vcFirstName');
    var vcCity = document.getElementById('vcCity');
    var vcRegion = document.getElementById('vcRegion');
    var vcHomePhone = document.getElementById('vcHomePhone');

  
    if (!noNumsOrEmptyStrRegEx.test(vcLastName.value)) {
        document.getElementById('vcLastNameMessage').innerHTML = "This field only allows letters.";
        isValid = false;
    }

    if (!noNumsOrEmptyStrRegEx.test(vcFirstName.value)) {
        document.getElementById('vcFirstNameMessage').innerHTML = "This field only allows letters.";
        isValid = false;
    }

    if (!noNumsRegEx.test(vcCity.value)) {
        document.getElementById('vcCityMessage').innerHTML = "This field only allows letters.";
        isValid = false;
    }

    if (!noNumsRegEx.test(vcRegion.value)) {
        document.getElementById('vcRegionMessage').innerHTML = "This field only allows letters.";
        isValid = false;
    }

    if (!noLettersRegEx.test(vcHomePhone.value)) {
        document.getElementById('vcHomePhoneMessage').innerHTML = "This field only allows numbers.";
        isValid = false;
    }

    return isValid;
}