function columnSort(itemEvent, colName) {
    let sortArrayFunc, type;
    let row = Array.from(document.querySelectorAll('.table .row:not(.table__header)'));
    if (row.length <= 1) {
        type = true;
    } else {
        type = isNaN(row[0].querySelector('.cell[data-title="' + colName + '"]').textContent - row[1].querySelector('.cell[data-title="' + colName + '"]').textContent)
    }
    if (type) {
        sortArrayFunc = function (x, y) {
            return x.querySelector('.cell[data-title="' + colName + '"]').textContent > y.querySelector('.cell[data-title="' + colName + '"]').textContent ? 1 : -1;
        };
    } else {
        sortArrayFunc = function (x, y) {
            return x.querySelector('.cell[data-title="' + colName + '"]').textContent - y.querySelector('.cell[data-title="' + colName + '"]').textContent;
        };
    }
    if (!itemEvent.classList.contains("active")) {
        row.sort(sortArrayFunc);
        document.querySelectorAll('.table__header .cell').forEach(item => {
            item.classList.remove("active");
        });
        itemEvent.classList.add("active");
    } else if (itemEvent.classList.contains("active")) {
        row.reverse();
        document.querySelectorAll('.table__header .cell').forEach(item => {
            item.classList.remove("active");
        });
    }
    document.querySelector(".table").append(...row);
}