function AddRemoveInput(){
    let MedicalCard__plus = document.querySelector(".medicalcard__svg__plus");
    let h = 1;

    MedicalCard__plus.addEventListener("click", e => {
        let containerInput = document.querySelector(".enjoyer");

        let addNewInput = '<div class="sdf" style="display: flex; align-items: center; flex-wrap: wrap;"><input' +
            ' type="text" maxlength="100" value="-"\n' +
            'id="medicalcard__symptoms__' + h + '" class="text-input powermail_input">' +
            '<div class="medicalcard__svg" style="padding-left:7px"><svg xmlns="http://www.w3.org/2000/svg" class="medicalcard__svg__minus" style="cursor: pointer"' +
            'width="15px"\n' +
            'height="15px" viewBox="0 0 459.313 459.314"  fill="red">\n' +
            '<path d="M459.313,229.648c0,22.201-17.992,40.199-40.205,40.199H40.181c-11.094,0-21.14-4.498-28.416-11.774   C4.495,250.808,0,240.76,0,229.66c-0.006-22.204,17.992-40.199,40.202-40.193h378.936   C441.333,189.472,459.308,207.456,459.313,229.648z"></path>\n' +
            '</svg></div></div>';
        h++;
        containerInput.insertAdjacentHTML("afterbegin", addNewInput);
    })

    document.addEventListener("click", ev => {
        if(ev.target.classList.contains("medicalcard__svg__minus")){
            ev.target.parentElement.parentElement.remove();
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

AddRemoveInput();