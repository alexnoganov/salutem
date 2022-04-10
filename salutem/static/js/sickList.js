document.querySelector("#print_btn").addEventListener("click", e=>{
    document.querySelectorAll("input").forEach(input => {
        input.placeholder = "";
        if(input.type === "date" && input.id !== "sickList_date_dtd" && input.value === '')
            input.style.color = "transparent"
    });
    window.print()
});

function onlyOneCheckedBox() {
    let checkbox_duplicate = document.querySelectorAll(".sickList_checkbox input[type='checkbox']");
    function f(e,t) {
        e.addEventListener("click", g=>{
            t.checked = e.checked === false;
        });
        t.addEventListener("click", g=>{
            e.checked = t.checked === false;
        });
    }
    f(checkbox_duplicate[0],checkbox_duplicate[1]);
    f(checkbox_duplicate[2],checkbox_duplicate[3]);

}

document.querySelector("#submit__analysis__result").addEventListener("click", e=>{

    let allInput = document.querySelectorAll("input:not(#sickList_F, #sickList_date_dtd, #sickList_specialist_FIO," +
        " #sickList_specialist_init,[type='checkbox'], [name='csrfmiddlewaretoken'])");
    let checkboxCheck = document.querySelectorAll(".sickList_checkbox input[type='checkbox']:checked");
    console.log(checkboxCheck);
    console.log(allInput);
    if(validator()){
        let allInput = document.querySelectorAll("input:not(#sickList_F, #sickList_date_dtd, #sickList_specialist_FIO," +
            " #sickList_specialist_init,[type='checkbox'])");
        let valueInput  = [];
        console.log(allInput);
        allInput.forEach(input=>{
            valueInput.push(input.value);
        });

        console.log(valueInput);
        $.ajax({
            url: 'addSickList/',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(allInput),
            success: (data) => {
                if ('errors' in data) {
                    toastr["error"]("Произошла ошибка! Повторите позже или обновите страницу.");
                }
                if ('success' in data) {
                    toastr["success"]("Данные успешно изменены!");
                }
            }
        });

        console.log(allInput);
    }
})


function OnlyNumberInputAndBRD() {
    let ogrn = document.querySelector("#sickList_orgn");
    let code = document.querySelector("#sickList_reason_code");
    let code_addit = document.querySelector("#sickList_reason_addit_code");
    let code_number = document.querySelector("#sickList_reason_code_number");

    let name = document.querySelector("#sickList_F");
    let surname = document.querySelector("#organizations");
    let patronymic = document.querySelector("#sickList_address_organization");

    function oninputNumber(input) {
        input.oninput = function () {
            input.value = input.value.replace(/[A-Za-zА-Яа-яЁё^!\-?=*+|`~_&%$#@"№;()]/, '');
        }
    }

    function oninputFIO(input) {
        input.oninput = function () {
            input.value = input.value.replace(/[0-9^!\?=*+|`~_&%$#@"№;()]/, '');
        }
    }

    oninputNumber(ogrn);
    oninputNumber(code);
    oninputNumber(code_addit);
    oninputNumber(code_number);
    oninputFIO(name);
    oninputFIO(surname);
    oninputFIO(patronymic);
} // Валидация

function validator() {
    let allInput = document.querySelectorAll("input:not(#sickList_specialist_init)");
    let invalid_message = document.querySelector("#invalid_message");
    let flags = true;
    invalid_message.style.display = "none";
    allInput.forEach(input => {
        if((input.value).trim() === "") {
            flags = false;
            invalid_message.style.display = "block";
        }
    });

    return flags;
} // Валидатор


OnlyNumberInputAndBRD();
onlyOneCheckedBox();