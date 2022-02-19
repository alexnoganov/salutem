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

document.querySelector(".submit__form").addEventListener("click", (e) => {
    e.preventDefault();
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
    })
})

let SelectSex = document.querySelector("#powermail_field_anrede").options;
let SelectBlood = document.querySelector("#powermail_field_blood").options;

let hiddenSex = document.querySelector("#hiddenSex").innerText;
let hiddenBlood = document.querySelector("#hiddenBlood").innerText;

function selectedOption(select, type) {
    for (let i = 0; i < select.length; i++) {
        if (select[i].value === type) {
            select[i].selected = true;
        }
    }

}

selectedOption(SelectSex, hiddenSex);
selectedOption(SelectBlood, hiddenBlood);
