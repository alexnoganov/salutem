toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-bottom-right",
    "preventDuplicates": false,
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


let files;
let zxc = document.querySelector(".info_edit_main_profile_avatar_delete");
let cxz = document.querySelector(".info_edit_main_profile_avatar_reupload");


cxz.addEventListener("click", () => {
    files = "update"
})
zxc.addEventListener("click", () => {
    files = "delete"
})


document.querySelector("#profile_save").addEventListener("click", (e) => {
    e.preventDefault();

    if (validator()) {
        let fileName = document.querySelector("#update").files;

        if (fileName.length > 0 || files === 'delete') {
            let formData = new FormData();

            if (files === "update") {
                let newFileName = location.href.split('/')[4] + "!" + fileName[0].name
                console.log(fileName)
                let newFile = new File(fileName, newFileName);
                console.log(newFile)
                formData.append("photo", newFile)
                image_ajax(formData, false, false)
            } else {
                let defaultImgUrl = location.href.split('/')[4] + "!" + "photos/unnamed.jpg";
                image_ajax(defaultImgUrl)
            }

        }

        $.ajax({
            url: '/user/save_profile/',
            type: 'POST',
            dataType: 'json',
            data: {
                data: JSON.stringify({
                    pk: location.href.split('/')[4],
                    sex: $('#powermail_field_anrede').val(),
                    first_name: $('#powermail_field_vorname').val(),
                    last_name: $('#powermail_field_nachname').val(),
                    patronymic: $('#powermail_field_Patronymic').val(),
                    date_of_birth: $('#powermail_field_geburtsdatum').val(),
                    phone: $('#powermail_field_telefonnummer').val(),
                    email: $('#powermail_field_e_mail').val(),
                    place_of_residence: $('#powermail_field_residence').val(),
                    passport_num: $('#powermail_field_pass_num').val(),
                    inn: $('#powermail_field_inn').val(),
                    spec: $('#powermail_field_spec').val(),
                    education: $('#powermail_field_education').val(),
                })
            },
            success: (data) => {
                if ('errors' in data) {
                    toastr["error"]("Произошла ошибка! Повторите позже или обновите страницу.");
                }
                if ('success' in data) {
                    toastr["success"]("Данные успешно изменены!");
                }
            }
        })

        function image_ajax(formData, contentType = undefined, processData = undefined) {
            $.ajax({
                url: '/user/save_profile/',
                type: 'POST',
                contentType: contentType,
                dataType: 'json',
                processData: processData,
                data: formData,

                success: (data) => {
                    if ('errors' in data) {
                        console.log(1);
                    }
                    if ('success' in data) {
                        console.log(0);
                    }
                }
            })
        }
    }
})

function validator() {
    const validateEmail = (email) => {
        return email.match(
            /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        );
    };
    const validateFIO = (FIO) => {
        return FIO.value.trim().length !== 0;
    };

    let flags = true;
    let name = document.querySelector("#powermail_field_vorname");
    let surname = document.querySelector("#powermail_field_nachname");
    let patronymic = document.querySelector("#powermail_field_Patronymic");
    let phone = document.querySelector("#powermail_field_telefonnummer");
    let pass = document.querySelector("#powermail_field_pass_num");
    let spec = document.querySelector("#powermail_field_spec");
    let invalids = document.querySelectorAll(".invalid-feedback");

    invalids.forEach(item => {
        item.style.display = "none";
    });

    let email = $('#powermail_field_e_mail').val();

    if (!validateEmail(email)) {
        document.querySelector("#invalid_email").style.display = "block";
        flags = false;
    }
    if (!validateFIO(name)) {
        document.querySelector("#invalid_name").style.display = "block";
        flags = false;
    }
    if (!validateFIO(surname)) {
        document.querySelector("#invalid_surname").style.display = "block";
        flags = false;
    }
    if (!validateFIO(patronymic)) {
        document.querySelector("#invalid_patronymic").style.display = "block";
        flags = false;
    }
    if (!validateFIO(phone)) {
        document.querySelector("#invalid_phone").style.display = "block";
        flags = false;
    }
    if (!validateFIO(pass)) {
        document.querySelector("#invalid_pass").style.display = "block";
        flags = false;
    }
    if (!validateFIO(spec)) {
        document.querySelector("#invalid_spec").style.display = "block";
        flags = false;
    }
    return flags;
}

function OnlyNumberInputAndBRD() {
    let phone = document.querySelector("#powermail_field_telefonnummer");
    let brd = document.querySelector("#powermail_field_geburtsdatum");
    let name = document.querySelector("#powermail_field_vorname");
    let surname = document.querySelector("#powermail_field_nachname");
    let patronymic = document.querySelector("#powermail_field_Patronymic");


    phone.oninput = function () {
        phone.value = phone.value.replace(/[A-Za-zА-Яа-яЁё^!\-?=*+|`~_&%$#@"№;()]/, '');
    }
    brd.oninput = function () {
        brd.value = brd.value.replace(/[A-Za-zА-Яа-яЁё^!\?=*+|`~_&%$#@"№;()]/, '');
    }

    function oninputFIO(input) {
        input.oninput = function () {
            input.value = input.value.replace(/[0-9^!\?=*+|`~_&%$#@"№;()]/, '');
        }
    }

    oninputFIO(name);
    oninputFIO(surname);
    oninputFIO(patronymic);
}

function readURL(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        let img = document.querySelector('#profile_img');
        reader.onload = function (e) {
            img.src = URL.createObjectURL(input.files[0]);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(".info_edit_main_profile_avatar_reupload span").click(function () {
    $('#update').click();
    $("#update").change(function () {
        readURL(this);
    });
});

$(".info_edit_main_profile_avatar_delete").click(function () {
    let img = document.querySelector('#profile_img');
    img.src = "/media/photos/unnamed.jpg"
    $("#update").val('');
});

$('#reset_password').click(e => {
    e.preventDefault();

    if (validator()) {
        $.ajax({
            url: '/user/change_password/',
            type: 'POST',
            dataType: 'json',
            data: {
                current_password: $('#powermail_field_current_password').val(),
                new_password: $('#powermail_field_new_password').val(),
                confirm_new_password: $('#powermail_field_confirm_new_password').val(),
            },
            success: (data) => {
                if ('errors' in data) {
                    if (data['errors'] === 'does_not_match') {
                        document.querySelector("#invalid_current_password").style.display = "block";
                        document.querySelector("#invalid_current_password").textContent = 'Введенный пароль не совпадает с текущим.';
                    } else if (data['errors'] === 'passwords_match') {
                        document.querySelector("#invalid_new_password").style.display = "block";
                        document.querySelector("#invalid_new_password").textContent = 'Новый пароль совпадает  текущим.';
                    } else if (data['errors']['validation']) {
                        document.querySelector("#invalid_new_password").style.display = "block";
                        document.querySelector("#invalid_new_password").innerHTML = '';
                        for (let i = 0; i < data['errors']['validation'].length; i++) {
                            document.querySelector("#invalid_new_password").innerHTML += data['errors']['validation'][i] + "<br>";
                        }
                    } else {
                        toastr["error"]("Произошла ошибка! Повторите позже или обновите страницу.");
                    }
                }
                if ('success' in data) {
                    toastr["success"]("Пароль успешно изменен!");
                    document.querySelectorAll('#reset_password_form input').forEach(item => {
                        item.value = '';
                    });
                }
            }
        });
    }

    function validator() {
        const validate = (value) => {
            return value.value.trim().length !== 0;
        };

        let flags = true;
        let current_password = document.querySelector("#powermail_field_current_password");
        let new_password = document.querySelector("#powermail_field_new_password");
        let confirm_new_password = document.querySelector("#powermail_field_confirm_new_password");
        let invalids = document.querySelectorAll("#reset_password_form .invalid-feedback");

        invalids.forEach(item => {
            item.style.display = "none";
        });

        if (!validate(current_password)) {
            document.querySelector("#invalid_current_password").style.display = "block";
            document.querySelector("#invalid_current_password").textContent = 'Это поле не может быть пустым.';
            flags = false;
        }
        if (!validate(new_password) && !validate(confirm_new_password)) {
            document.querySelector("#invalid_new_password").style.display = "block";
            document.querySelector("#invalid_new_password").textContent = 'Это поле не может быть пустым.';
            document.querySelector("#invalid_confirm_new_password").style.display = "block";
            document.querySelector("#invalid_confirm_new_password").textContent = 'Это поле не может быть пустым.';
            flags = false;
        } else if (new_password.value !== confirm_new_password.value) {
            document.querySelector("#invalid_new_password").style.display = "block";
            document.querySelector("#invalid_new_password").textContent = 'Пароли не совпадают.';
            document.querySelector("#invalid_confirm_new_password").style.display = "block";
            document.querySelector("#invalid_confirm_new_password").textContent = 'Пароли не совпадают.';
            flags = false;
        }
        return flags;
    }
});

OnlyNumberInputAndBRD();
