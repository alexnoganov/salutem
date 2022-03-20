function fillTimetable(timetable) {
    Array.prototype.max = function () {
        return Math.max.apply(null, this);
    };
    Array.prototype.rand = function () {
        let id = Math.floor(Math.random() * this.length);
        return this[id];
    };
    const color = ['accent-pink-gradient',
        'accent-orange-gradient',
        'accent-cyan-gradient',
        'accent-green-gradient', 'accent-blue-gradient',
        'accent-purple-gradient']
    const timetableRow = document.querySelectorAll('.content__row');
    let timetableRowArray = [[], [], [], [], [], [], []];
    let maxDayLength = {};
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
                    timetableRowArray[i].push('<div class="row__item"><div class="time">' + timetable[week][i][j][1] + '</div><div class="patient">' + timetable[week][i][j][0] + '</div></div>')
                } catch (e) {
                    timetableRowArray[i].push('<div></div>')
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
    }
    let rowItem = document.querySelectorAll('.row__item');
    rowItem.forEach(item => {
        item.classList.add(color.rand())
        console.log(rowItem)
        if (item.parentElement.classList.contains("weekend")) {
            item.parentElement.classList.remove("weekend")
        }
    });
}