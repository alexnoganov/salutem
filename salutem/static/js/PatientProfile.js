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
} // Настройки toatsr


let files;
let zxc = document.querySelector(".info_edit_main_profile_avatar_delete");
let cxz = document.querySelector(".info_edit_main_profile_avatar_reupload");


function AnalyzeSwitchDate() {
    let TypeNameAnalyze = document.querySelector("#analysis_name");
    let StatusAnalyze = document.querySelector("#analysis_status");
    let TextAreaAnalyze = document.querySelector("#analysis_result");
    let arrayAnalyze = dataAnalyze;

    document.addEventListener("DOMContentLoaded", () => {
        let idSelect = TypeNameAnalyze.value;
        let findObject = arrayAnalyze.find(id => id.id === parseInt(idSelect))
        selectedOption(StatusAnalyze, findObject.status)
    });

    TypeNameAnalyze.onchange = function () {
        let idSelect = TypeNameAnalyze.value;
        let findObject = arrayAnalyze.find(id => id.id === parseInt(idSelect))
        selectedOption(StatusAnalyze, findObject.status)
        TextAreaAnalyze.disabled = StatusAnalyze.value !== "Завершен";
    }

    StatusAnalyze.onchange = function () {
        TextAreaAnalyze.disabled = StatusAnalyze.value !== "Завершен";
    }
} // Обработка формы анализов

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
                let newFileName = location.href.split('/')[5] + "!" + fileName[0].name
                console.log(fileName)
                let newFile = new File(fileName, newFileName);
                console.log(newFile)
                formData.append("photo", newFile)
                image_ajax(formData, false, false)
            } else {
                let defaultImgUrl = location.href.split('/')[5] + "!" + "photos/unnamed.jpg";
                image_ajax(defaultImgUrl)
            }

        }


        $.ajax({
            url: '/patients/save_profile/',
            type: 'POST',
            dataType: 'json',
            data: {
                pk: location.href.split('/')[5],
                Sex: $('#powermail_field_anrede').val(),
                username: $('#powermail_field_vorname').val(),
                surname: $('#powermail_field_nachname').val(),
                Patronymic: $('#powermail_field_Patronymic').val(),
                Date_of_birth: $('#powermail_field_geburtsdatum').val(),
                phone: $('#powermail_field_telefonnummer').val(),
                email: $('#powermail_field_e_mail').val(),
                Place_of_residence: $('#powermail_field_residence').val(),
                Blood_type: $('#powermail_field_blood').val(),
            },
            success: (data) => {
                if ('errors' in data) {
                    toastr["error"]("Произошла ошибка! Повторите позже или обновите страницу.");
                }
                if ('success' in data) {
                    toastr["success"]("Данные успешно изменены!");
                }
            }
        }) // AJAX текста

        function image_ajax(formData, contentType = undefined, processData = undefined) {
            $.ajax({
                url: '/patients/save_profile/',
                type: 'POST',
                contentType: contentType,
                dataType: 'json',
                processData: processData,
                data: formData,

                success: (data) => {
                    if ('errors' in data) {
                    }
                    if ('success' in data) {
                    }
                }
            })
        } // AJAX картинки
    }
}) // Сохранение профиля

$("#submit__appointment").click((e) => {
    e.preventDefault();
    let date = $("#appointmentDate").val()
    if (date === '') {
        toastr.error("Заполните поле \"Дата приема\".");
    } else {
        $.ajax({
            url: '/patients/appointment/',
            type: 'POST',
            dataType: 'json',
            data: {
                specialistId: $("#specialist_for_appointment").val(),
                patientId: location.href.split('/')[5],
                date: date
            },

            success: (data) => {
                if ('errors' in data) {
                    toastr.error("Произошла ошибка! Повторите попытку позже.");
                }
                if ('success' in data) {
                    toastr.success("Пациент успешно записан на прием.");
                    $.modal.close();
                }
            }
        });
    }

}); // Запись на прием

$("#submit__analysis").click((e) => {
    e.preventDefault();
    let date = $("#analysisDate").val()
    if (date === '') {
        toastr.error("Заполните поле \"Дата сдачи\".");
    } else {
        $.ajax({
        url: '/patients/analysis/',
        type: 'POST',
        dataType: 'json',
        data: {
            type: 'register',
            data: JSON.stringify({
                type: $("#analysisType").val(),
                date: date,
                specialistId: $("#profile__text").children('a')[0].href.split('/')[4],
                patientId: location.href.split('/')[5]
            })
        },

        success: (data) => {
            if ('errors' in data) {
                toastr.error("Произошла ошибка! Повторите попытку позже.");
            }
            if ('success' in data) {
                toastr.success("Пациент успешно записан на сдачу анализов.");
                $.modal.close();
            }
        }
    });
    }

}); // Запись на анализ

$("#submit__analysis__result").click((e) => {
    e.preventDefault();
    $.ajax({
        url: '/patients/analysis/',
        type: 'POST',
        dataType: 'json',
        data: {
            type: 'status',
            data: JSON.stringify({
                status: $("#analysis_status").val(),
                result: $("#analysis_result").val(),
                pk: $("#analysis_name").val(),
            })
        },

        success: (data) => {
            if ('errors' in data) {
                toastr.error("Произошла ошибка! Повторите попытку позже.");
            }
            if ('success' in data) {
                toastr.success("Данные успешно изменены.");
            }
        }
    });
}); // Отправка результатов анализа

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
    let email = $('#powermail_field_e_mail').val();
    let invalids = document.querySelectorAll(".invalid-feedback");

    invalids.forEach(item => {
        item.style.display = "none";
    });

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
    return flags;
} // Валидатор

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
} // Валидация


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
}); // Добавление фото профиля

$(".info_edit_main_profile_avatar_delete").click(function () {
    let img = document.querySelector('#profile_img');
    img.src = "/media/photos/unnamed.jpg"
    $("#update").val('');
}); // Удаление фото профиля

$("#modal__delete__analysis").click((e) => {
    e.preventDefault();
    $.ajax({
        url: '/patients/analysis/',
        type: 'POST',
        dataType: 'json',
        data: {
            type: 'delete',
            data: JSON.stringify({
                pk: $("#analysis_name").val(),
            })
        },

        success: (data) => {
            if ('errors' in data) {
                toastr.error("Произошла ошибка! Повторите попытку позже.");
            }
            if ('success' in data) {
                location.reload();
            }
        }
    });
}); // Обработка удаления анализа

function selectedOption(select, type) {
    for (let i = 0; i < select.length; i++) {
        if (select[i].value === type) {
            select[i].selected = true;
        }
    }

}

OnlyNumberInputAndBRD();
AnalyzeSwitchDate();