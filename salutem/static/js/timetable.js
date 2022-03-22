function fillTimetable(timetable, url_to_patient, analyzes = false) {
    Array.prototype.max = function () {
        return Math.max.apply(null, this);
    };
    Array.prototype.rand = function () {
        let id = Math.floor(Math.random() * this.length);
        return this[id];
    };
    url_to_patient = url_to_patient.slice(0, -2)
    const color = ['accent-pink-gradient',
        'accent-orange-gradient',
        'accent-cyan-gradient',
        'accent-green-gradient', 'accent-blue-gradient',
        'accent-purple-gradient'];
    const timetableRow = document.querySelectorAll('.content__row');
    const headerItems = document.querySelectorAll('.week-names div');
    let timetableRowArray = [[], [], [], [], [], [], []], maxDayLength = {}, appointment;
    for (const week in timetable) {
        maxDayLength[week] = [];
        for (const day in timetable[week]) {
            maxDayLength[week].push(timetable[week][day].length);
        }
    }
    for (const key in maxDayLength) {
        maxDayLength[key] = maxDayLength[key].max();
    }
    for (const week in timetable) {
        for (let i = 0; i < 7; i++) {
            for (let j = 0; j < maxDayLength[week]; j++) {
                try {
                    timetableRowArray[i].push(
                            `<div class="row__item" data-id="${timetable[week][i][j][3]}">
                            <a href="${url_to_patient + timetable[week][i][j][2]}">
                                <div class="time">${timetable[week][i][j][1]}</div>
                                <div class="patient">${timetable[week][i][j][0]}</div>
                            </a>
                            <div class="row__item__close" onclick="$('#confirmModal').modal();">
                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 460.775 460.775" xml:space="preserve" fill="rgb(255,255,255, 0.7)">
                                    <path d="M285.08,230.397L456.218,59.27c6.076-6.077,6.076-15.911,0-21.986L423.511,4.565c-2.913-2.911-6.866-4.55-10.992-4.55
                                    \tc-4.127,0-8.08,1.639-10.993,4.55l-171.138,171.14L59.25,4.565c-2.913-2.911-6.866-4.55-10.993-4.55
                                    \tc-4.126,0-8.08,1.639-10.992,4.55L4.558,37.284c-6.077,6.075-6.077,15.909,0,21.986l171.138,171.128L4.575,401.505
                                    \tc-6.074,6.077-6.074,15.911,0,21.986l32.709,32.719c2.911,2.911,6.865,4.55,10.992,4.55c4.127,0,8.08-1.639,10.994-4.55
                                    \tl171.117-171.12l171.118,171.12c2.913,2.911,6.866,4.55,10.993,4.55c4.128,0,8.081-1.639,10.992-4.55l32.709-32.719
                                    \tc6.074-6.075,6.074-15.909,0-21.986L285.08,230.397z"/>
                                </svg>
                            </div>
                        </div>
                    `);
                } catch (e) {
                    timetableRowArray[i].push('<div></div>');
                }
            }
        }
    }
    for (let i = 0; i < timetableRow.length; i++) {
        if (timetableRowArray[i].length < 6) {
            for (let j = 0; j < 5; j++) {
                if (timetableRowArray[i][j] !== undefined) {
                    timetableRow[i].insertAdjacentHTML('beforeend', timetableRowArray[i][j]);
                } else {
                    timetableRow[i].insertAdjacentHTML('beforeend', '<div></div>');
                }
            }
        } else {
            for (let j = 0; j < timetableRowArray[i].length; j++) {
                timetableRow[i].insertAdjacentHTML('beforeend', timetableRowArray[i][j]);
            }
        }
        fillColorCell(i);
    }

    function fillColorCell(i, add_color = true) {
        let items = timetableRow[i].querySelectorAll('.row__item');
        for (let j = 0; j < items.length; j++) {
            if (add_color) {
                items[j].classList.add(color.rand());
            }
        }
        if (i > 4) {
            if (items.length === 0) {
                headerItems[i].classList.add('weekend');
                timetableRow[i].classList.add('weekend');
            }
        }
    }

    function removeEmptyCell() {
        let items = [], row, counter = [0, 0, 0, 0, 0, 0, 0,];
        for (let i = 0; i < timetableRow.length; i++) {
            items.push(timetableRow[i].querySelectorAll('div:not([class]), div[class*="accent"]'));
        }
        for (let i = 0; i < items.length; i++) {
            for (let j = 0; j < items[i].length; j++) {
                if (items[i][j].nodeName === 'DIV' && items[i][j].classList.length === 0) {
                    if (counter[j] === undefined) {
                        counter[j] = 1;
                    } else {
                        counter[j]++;
                    }
                }
                if (counter[j] === 7) {
                    row = j;
                    break;
                }
            }
        }
        if (row !== undefined) {
            for (let i = 0; i < timetableRow.length; i++) {
                if (items[0].length > 5) {
                    timetableRow[i].innerHTML = '';
                    for (let j = 0; j < items[i].length; j++) {
                        if (j !== row) {
                            timetableRow[i].appendChild(items[i][j]);
                        }
                    }
                } else {
                    timetableRow[i].innerHTML = '';
                    for (let j = 0; j < 6; j++) {
                        if (j !== row) {
                            try {
                                timetableRow[i].appendChild(items[i][j]);
                            } catch (e) {
                                timetableRow[i].insertAdjacentHTML('beforeend', '<div></div>');
                            }
                        }
                    }
                }
                fillColorCell(i, false);
            }
        }
    }

    document.addEventListener('click', e => {
        if (e.target.closest('div.row__item') !== null && e.target.closest('div.row__item').dataset.id !== '') {
            appointment = e.target.closest('div.row__item').dataset.id;
        }
        if (e.target.id === 'modal__delete__analysis') {
            $.ajax({
                url: '/timetable/delete_appointment/',
                type: 'POST',
                dataType: 'json',
                data: {
                    pk: appointment,
                },
                success: (data) => {
                    if ('errors' in data) {
                        toastr.error("Произошла ошибка! Повторите попытку позже.");
                    }
                    if ('success' in data) {
                        toastr.success("Запись была успешно удалена.");
                        const item = document.querySelector(`.row__item[data-id="${appointment}"]`);
                        item.insertAdjacentHTML('beforebegin', '<div></div>')
                        item.remove();
                        $.modal.close();
                        removeEmptyCell();
                    }
                }
            });
        }
    });
}