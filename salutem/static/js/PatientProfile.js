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
let zxc  = document.querySelector(".info_edit_main_profile_avatar_delete");
let cxz = document.querySelector(".info_edit_main_profile_avatar_reupload");
cxz.addEventListener("click", () => {
    files = "update"
})
zxc.addEventListener("click", () => {
    files = "delete"
})


document.querySelector(".submit__form").addEventListener("click", (e) => {
    e.preventDefault();
    let formData = new FormData();

    let fileName = document.querySelector("#update").files;
    let newFileName = location.href.split('/')[5] + "!" + fileName[0].name
    let newFile  = new File(fileName, newFileName);

    if(files === "delete"){
        formData = "da";
    }

    else if (files === "update") {
        formData.append("photo", newFile)
    }




    $.ajax({
        url: '/patients/save_profile/',
        type: 'POST',
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
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

    $.ajax({
        url: '/patients/save_profile/',
        type: 'POST',
        contentType: false,
        dataType: 'json',
        processData: false,
        data:  formData,

        success: (data) => {
            if('errors' in data){
                console.log(1);
            }
            if('success' in data){
                console.log(0);
                // window.location.replace(window.location.origin + data.success)
            }
        }
    })

})


function readURL(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();

        reader.onload = function (e) {
            $('.info_edit_main_profile_avatar').css('background-image', 'url(' + e.target.result + ')');
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(".info_edit_main_profile_avatar_reupload span").click(function(){
    $('#update').click();
    $("#update").change(function(){
        readURL(this);
    });
});

$(".info_edit_main_profile_avatar_delete").click(function(){
    $(".info_edit_main_profile_avatar").css("background-image", "");
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
