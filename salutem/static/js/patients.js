function columnSort(itemEvent, colName) {
    let sortArrayFunc;
    let row = Array.from(document.querySelectorAll('.table .row:not(.table__header)'));
    let type = isNaN(row[0].querySelector('.cell[data-title="' + colName + '"]').textContent - row[1].querySelector('.cell[data-title="' + colName + '"]').textContent);
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

document.addEventListener("DOMContentLoaded", () => {
    document.addEventListener("click", e => {
        if (e.target.id === "header1") {
            columnSort(document.querySelector("#header1"), "FIO");
        } else if (e.target.id === "header2") {
            columnSort(document.querySelector("#header2"), "Phone")
        } else if (e.target.id === "header3") {
            columnSort(document.querySelector("#header3"), "Date of Birth")
        } else if (e.target.id === "header4") {
            columnSort(document.querySelector("#header4"), "Address")
        } else if (e.target.id === "header5") {
            columnSort(document.querySelector("#header5"), "Date of Registration")
        }
    });
});