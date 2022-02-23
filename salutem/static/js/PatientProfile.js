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


let files
let zxc = document.querySelector(".info_edit_main_profile_avatar_delete");
let cxz = document.querySelector(".info_edit_main_profile_avatar_reupload");



function AnalyzeSwitchDate(){
    let TypeNameAnalyze = document.querySelector("#analysis_name");
    let StatusAnalyze = document.querySelector("#analysis_status");
    let TextAreaAnalyze = document.querySelector("#analysis_result");
    let arrayAnalyze = dataAnalyze;


    TypeNameAnalyze.onchange = function (){
        let idSelect =  TypeNameAnalyze.selectedOptions[0].id.split('-')[0];
        let findObject = arrayAnalyze.find(id => id.id === parseInt(idSelect))
        selectedOption(StatusAnalyze, findObject.status)
    }

    StatusAnalyze.onchange = function (){
       TextAreaAnalyze.disabled = StatusAnalyze.selectedOptions[0].value !== "Завершен";
    }

}


AnalyzeSwitchDate();



cxz.addEventListener("click", () => {
    files = "update"
})
zxc.addEventListener("click", () => {
    files = "delete"
})


document.querySelector("#profile_save").addEventListener("click", (e) => {
    e.preventDefault();
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
    })

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
                    console.log(1);
                }
                if ('success' in data) {
                    console.log(0);
                    // window.location.replace(window.location.origin + data.success)
                }
            }
        })
    }

})

$("#submit__analysis").click((e) => {
    e.preventDefault();
    $.ajax({
        url: '/patients/analysis/',
        type: 'POST',
        dataType: 'json',
        data: {
            type: 'register',
            data: JSON.stringify({
                type: $("#analysisType").val(),
                date: $("#analysisDate").val(),
                specialistId: $("#profile__text").children('a')[0].href.split('/')[6], //TODO Переделать после изменения ссылки профиля специалиста
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
});
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
                pk: $("#patient_analysis_pk").val(),
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
});

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
