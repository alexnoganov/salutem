function TableSort() {
    let table = document.querySelector(".table");
    // let fio = document.querySelectorAll(".table__header .cell")[0];
    // let phone = document.querySelectorAll(".table__header .cell")[1];
    // let dateOfBirth = document.querySelectorAll(".table__header .cell")[2];
    // let address = document.querySelectorAll(".table__header .cell")[3];
    let row, sortArrayFunc;

    document.addEventListener("click", e => {
        if (e.target.id === "header1") {
            columnSort(document.querySelector("#header1"), "FIO");
        } else if (e.target.id === "header2") {
            columnSort(document.querySelector("#header2"), "Phone")
        } else if (e.target.id === "header3") {
            columnSort(document.querySelector("#header3"), "Date of Birth")
        } else if (e.target.id === "header4") {
            columnSort(document.querySelector("#header4"), "Address")
        }
    })

    function columnSort(itemEvent, colName) {
        row = Array.from(document.querySelectorAll('.table .row:not(.table__header)'));
        let type = isNaN(row[0].querySelector('.cell[data-title="' + colName + '"]').textContent - row[1].querySelector('.cell[data-title="' + colName + '"]').textContent);
        /*if (colName === "Date of Birth") {
            sortArrayFunc = function (x, y) {
                return new Date(x.querySelector('.cell[data-title="' + colName + '"]').textContent) - new Date(y.querySelector('.cell[data-title="' + colName + '"]').textContent);
            };
        } else*/
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
            row.reverse()
            document.querySelectorAll('.table__header .cell').forEach(item => {
                item.classList.remove("active");
            });
        }
        table.append(...row);
    }
}

TableSort();