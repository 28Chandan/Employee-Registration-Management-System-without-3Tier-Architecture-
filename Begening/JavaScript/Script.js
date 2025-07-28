function resetForm() {

    document.getElementById('firstNameTxt').value = "";
    document.getElementById('lastNameTxt').value = "";
    document.getElementById('emailTxt').value = "";
    document.getElementById('usernameTxt').value = "";
    document.getElementById('passwordTxt').value = "";
    document.getElementById('confirmPasswordTxt').value = "";
    document.getElementById('resumeUpload').value = "";
}


function validations() {
    const fname = document.getElementById('firstNameTxt');
    const lname = document.getElementById('lastNameTxt');
    const emailid = document.getElementById('emailTxt');
    const username = document.getElementById('usernameTxt');
    const password = document.getElementById('passwordTxt');
    const confirmpassword = document.getElementById('confirmPasswordTxt');
    const deptddl = document.getElementById('deptddl');
    const resumeupload = document.getElementById('resumeUpload');
    const errorLog = document.getElementById('ErrorLogs');

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const passwordPattern = /^(?=.*\d).{8,}$/;
    const firstnamePattern = /^[A-Za-z]+$/;
    const usernamePattern = /^[a-zA-Z][a-zA-Z0-9_]{3,15}$/;

    let isValid = true;
    errorLog.innerText = "";

    // First Name
    if (fname.value.trim() === '' || !firstnamePattern.test(fname.value.trim())) {
        errorLog.innerText += "FirstName is required and cannot contain numbers or special characters.\n";
        fname.style.border = '2px solid red';
        isValid = false;
    } else {
        fname.style.border = '2px solid black';
    }

    // Last Name
    if (lname.value.trim() === '' || !firstnamePattern.test(lname.value.trim())) {
        errorLog.innerText += "LastName is required and cannot contain numbers or special characters.\n";
        lname.style.border = '2px solid red';
        isValid = false;
    } else {
        lname.style.border = '2px solid black';
    }

    // Email
    if (emailid.value.trim() === '' || !emailPattern.test(emailid.value.trim())) {
        errorLog.innerText += "Valid Email ID is required (e.g., example@domain.com).\n";
        emailid.style.border = '2px solid red';
        isValid = false;
    } else {
        emailid.style.border = '2px solid black';
    }

    // Username
    if (username.value.trim() === '' || !usernamePattern.test(username.value.trim())) {
        errorLog.innerText += "Username must start with a letter and can contain letters, numbers, and underscores (4–16 characters).\n";
        username.style.border = '2px solid red';
        isValid = false;
    } else {
        username.style.border = '2px solid black';
    }

    // Password
    if (password.value.trim() === '' || !passwordPattern.test(password.value.trim())) {
        errorLog.innerText += "Password must be at least 8 characters and contain a number.\n";
        password.style.border = '2px solid red';
        isValid = false;
    } else {
        password.style.border = '2px solid black';
    }

    // Confirm Password
    if (confirmpassword.value.trim() === '') {
        errorLog.innerText += "Confirm Password is required.\n";
        confirmpassword.style.border = '2px solid red';
        isValid = false;
    } else if (password.value.trim() !== confirmpassword.value.trim()) {
        errorLog.innerText += "Passwords do not match.\n";
        confirmpassword.style.border = '2px solid red';
        isValid = false;
    } else {
        confirmpassword.style.border = '2px solid black';
    }

    // Department
    if (deptddl.value.trim() === '') {
        errorLog.innerText += "Please select a department.\n";
        deptddl.style.border = '2px solid red';
        isValid = false;
    } else {
        deptddl.style.border = '2px solid black';
    }

    // Resume Upload
    if (resumeupload.value.trim() === '') {
        errorLog.innerText += "Resume upload is required.\n";
        resumeupload.style.border = '2px solid red';
        isValid = false;
    } else {
        resumeupload.style.border = '2px solid black';
    }

    return isValid;
}