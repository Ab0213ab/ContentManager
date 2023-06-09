function submitFormWithKey(formId, key) {
    var form = document.getElementById(formId);
    form.intCompanyKey.value = key;
    form.submit();
}