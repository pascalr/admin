require('jquery')

import Handsontable from "handsontable";
import 'handsontable/dist/handsontable.full';
//import 'handsontable/dist/handsontable.full.css';

//const data = [
//  ['', 'Tesla', 'Volvo', 'Toyota', 'Ford'],
//  ['2019', 10, 11, 12, 13],
//  ['2020', 20, 11, 14, 13],
//  ['2021', 30, 15, 12, 13]
//];

const container = document.getElementById('example');

let data = JSON.parse(container.dataset.spreadsheetvalues)
let headers = JSON.parse(container.dataset.spreadsheetheaders).filter(h => !(h == "created_at" || h == "updated_at"))
let tablename = container.dataset.spreadsheettablename
let model = container.dataset.spreadsheetmodel
//let columns = headers.map((h) => ({readOnly: h == "id"}))
let columns = JSON.parse(container.dataset.spreadsheetcols)

function printErrors(errors) {
  if (!errors) {return;}
  let msg = '<ul>'
  errors.forEach(error => {
    msg += '<li>'
    msg += error
    msg += '</li>'
  })
  msg += '</ul>'
  toastr['error'](msg)
}

//function createModel(row, column, value) {
function createModel(row, record) {
  //[model]: {[column]: value}
  $.ajax({
    type: "POST",
    url: "/" + tablename + ".json",
    data: {
      authenticity_token: $('[name="csrf-token"]')[0].content,
      [model]: record
    },
    async: false,
    success: function (data) {console.log("success insert data: ", data); hot.setDataAtCell(row, 0, data.id); return false},
    error: function (data) {console.log("error insert data: ", data); printErrors(data.responseJSON); return false}
  })
}

function updateModel(id, column, value) {
  $.ajax({
    type: "PATCH",
    url: "/" + tablename + "/" + id + ".json",
    data: {
      authenticity_token: $('[name="csrf-token"]')[0].content,
      [model]: {[column]: value}
    },
    success: function (data) {console.log("success data: ", data); return false},
    error: function (data) {console.log("error update data: ", data); printErrors(data.responseJSON); return false}
  })
}

function deleteModel(id) {
  $.ajax({
    type: "DELETE",
    url: "/" + tablename + "/" + id + ".json" + "?no_redirect=true",
    data: {
      authenticity_token: $('[name="csrf-token"]')[0].content,
    },
    success: function (data) {console.log("success data: ", data); return false},
    error: function (data) {console.log("error data: ", data); return false}
  })
}

function makeModelFromRow(hot, row) {
  let obj = {}
  headers.forEach((h,i) => {
    if (h == "id" || h == "created_at" || h == "updated_at") { return; }
    obj[h] = hot.getDataAtCell(row, i)
  })
  return obj
}

//function idRenderer(instance, td, row, col, prop, value, cellProperties) {
//  val = Handsontable.helper.sanitize(value)
//  td.innerHTML = '<a href="'+val+'"</a>';
//}

const hot = new Handsontable(container, {
  data: data,
  rowHeaders: true,
  colHeaders: headers,
  columns: columns,
  allowInsertRow: true,
  autoInsertRow: true,
  contextMenu: true,
  manualColumnMove: true,
  manualColumnResize: true,
  modifyColWidth: function(width, col){
    window.col = col
    if(width > 1000){
      return 1000
    }
  },
  licenseKey: 'non-commercial-and-evaluation',
  afterChange: function (changes, source) {

    if (source === 'loadData') { return; /* don't save this change*/ }

    console.log("Source: ", source)

    changes.forEach(([row, prop, oldValue, newValue]) => {
      if (prop == 0) {return; /* Ignore anything related to the id. */ }

      let id = hot.getDataAtCell(row, 0);
      let columnName = headers[prop]
      if (id == null) {
        createModel(row, makeModelFromRow(hot, row))
        //createModel(row, columnName, newValue)
      } else {
        let allNull = false
        if (newValue == null == newValue == "") {
          allNull = true
          for (let i = 1; i < headers.length; i++) {
            let v = hot.getDataAtCell(row, i)
            if (v && headers[i] !== "created_at" && headers[i] !== "updated_at") {
              console.log("Found not empty: ", v);
              allNull = false
            }
          }
        }
        if (allNull) {
          deleteModel(id)
        } else {
          updateModel(id, columnName, newValue)
        }
      }
      console.log("row: ", row);
    });
  }
});

document.getElementById('add_row_spreadsheet').addEventListener('click', function() {
    var col = hot.countRows();
    hot.alter('insert_row', col, 1);
  })
