// 課題 JS-3 の実装をここに記述してください。
var btn = document.getElementById("submit-button");
btn.addEventListener('click', function(){
    var input = document.getElementById("log-input");
    var logs = parseLTSVLog(input.value);
    var table = document.getElementById("table-container");
    createLogTable(table, logs);
});
