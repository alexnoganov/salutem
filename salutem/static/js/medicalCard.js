function AddRemoveInput(){
    let MedicalCard__plus = document.querySelectorAll(".medicalcard__svg__plus");
    let h = 1;

    MedicalCard__plus.forEach(MR__plus=>{
        MR__plus.addEventListener("click", e => {
            let containerInput = MR__plus.closest(".enjoyer");
            let addNewInput = '<div class="sdf" style="display: flex; align-items: center; flex-wrap: wrap;"><input' +
                ' type="text" maxlength="100" placeholder="--"\n' +
                'id="medicalcard__symptoms__' + h + '" class="text-input powermail_input">' +
                '<div class="medicalcard__svg" style="padding-left:7px"><svg xmlns="http://www.w3.org/2000/svg" class="medicalcard__svg__minus" style="cursor: pointer"' +
                'width="15px"\n' +
                'height="15px" viewBox="0 0 459.313 459.314"  fill="red">\n' +
                '<path d="M459.313,229.648c0,22.201-17.992,40.199-40.205,40.199H40.181c-11.094,0-21.14-4.498-28.416-11.774   C4.495,250.808,0,240.76,0,229.66c-0.006-22.204,17.992-40.199,40.202-40.193h378.936   C441.333,189.472,459.308,207.456,459.313,229.648z"></path>\n' +
                '</svg></div></div>';
            h++;
            containerInput.insertAdjacentHTML("beforeend", addNewInput);
        })
    })

    document.addEventListener("click", ev => {
        if(ev.target.classList.contains("medicalcard__svg__minus") || ev.target.parentNode.classList.contains("medicalcard__svg__minus")){
            ev.target.closest(".sdf").remove();
        }
    })

}

document.querySelector("#medicalcard__search").onchange = function () {
    let  form  = document.querySelector("#MD__search");
    searchParameters(form, document.querySelector("#medicalcard__search"));
}

document.querySelector("#medicalcard__search_anlz").onchange = function () {
    let  form  = document.querySelector("#MD__search__anlz");
    searchParameters(form, document.querySelector("#medicalcard__search_anlz"));
}

document.querySelector("#addNewMR").addEventListener("click", addNewMR)

function addNewMR() {

    if((document.querySelector("#medicalcard__reception__MR").value.trim()) !== '')
    {
        let record = document.querySelector(".item__accordion__newMR");
        let destinationMR = record.querySelector("#medicalcard__reception__MR").value;
        let enjoyerMR = record.querySelectorAll(".enjoyer input");
        let treatmentMR = record.querySelector("#medicalcard__therapy").value;
        let symptomsMR = [];

        enjoyerMR.forEach(input=>{
            symptomsMR.push(input.value)
        });

        $.ajax({
            url: location.pathname  + 'addMR/',
            type: 'POST',
            dataType: 'json',
            data: {
                destination: destinationMR,
                treatment: treatmentMR,
                symptoms: JSON.stringify(symptomsMR),
            },
            success: (data) => {
                if ('errors' in data) {
                    toastr["error"]("Произошла ошибка! Повторите позже или обновите страницу.");
                }
                if ('success' in data) {
                    toastr["success"]("Данные успешно записались!");
                }
            }
        });
    }
}

function TodayDate(){
    let date = new Date();
    document.querySelector(".medicalcard__point__dateMR").innerText = String(date.getDate()).padStart(2, '0') + '.' + String(date.getMonth() + 1).padStart(2, '0') + '.' + date.getFullYear();
}

function searchParameters(form, input) {
    let b = document.querySelector("#medicalsearchHidden");
    let c = document.querySelector("#medicalsearchANLZHidden");

    if(location.search.includes('&')){
        if(input.name === "medicalsearch"){
            b.value = document.querySelector("#medicalcard__search_anlz").value;
        }
        if(input.name === "medicalsearchANLZ"){
            c.value = document.querySelector("#medicalcard__search").value;
        }
        form.submit();
    }
    if(location.search.includes('medicalsearch') && form.id === 'MD__search__anlz'){
        c.value = document.querySelector("#medicalcard__search").value;
        form.submit();
    }
    if(location.search.includes('medicalsearchANLZ') && form.id === 'MD__search'){
        b.value = document.querySelector("#medicalcard__search_anlz").value;
        form.submit();
    }
    if(!location.search.includes('medicalsearchANLZ') && !location.search.includes('medicalsearch')){
        form[1].remove();
        form.submit();
    }

}

function deleteMedicalRecords() {
    let allDeleteBtn = document.querySelectorAll(".deleteMR");
    allDeleteBtn.forEach(deleteBtn => {
        deleteBtn.addEventListener('click', e=>{

            let btnClassList =  deleteBtn.classList;
            deleteBtn.closest(".item__accordion").remove();
            ajaxDeleteMR(searchIdClassMR(btnClassList));
        });
    })

    function searchIdClassMR(btn) {
        return Array.from(btn).filter(e => e.includes("MR") && e.length <= 3)[0].replace(/^.{2}/, '');
    }

    function ajaxDeleteMR(pk) {
        $.ajax({
            url: location.pathname  + '/deleteMR',
            type: 'POST',
            dataType: 'json',
            data: {
                id: pk,
            },
            success: (data) => {
                if ('errors' in data) {
                    toastr["error"]("Произошла ошибка! Повторите позже или обновите страницу.");
                }
                if ('success' in data) {
                    toastr["success"]("Запись успешно удалилась!");
                }
            }
        })
    }
}

TodayDate();
deleteMedicalRecords();
AddRemoveInput();