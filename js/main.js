// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog(logStr){
    var result = [];
    if(!logStr){
        return result;
    }

    if(logStr.match(/\n$/)){
         logStr = logStr.replace(/\n$/, "");
    }
    var logs = logStr.split("\n");

    logs.forEach(function(log){
        var elements = log.split("\t");
        var logObj = new Object;
        elements.forEach(function(element){
            var e = element.split(":");
            if(!e[1].match(/[^0-9]/g)){
                e[1] = parseInt(e[1]);
            }
            logObj[e[0]] = e[1];
        });
        result.push(logObj)
    });
    return JSON.parse(JSON.stringify(result))

}
// 課題 JS-2: 関数 `createLogTable` を記述してください
function createLogTable(el, data){
    var table = document.createElement("table");

    var thead = document.createElement("thead");
    var tr = document.createElement('tr');
    var th1 = document.createElement('th');
    var th2 = document.createElement('th');
    th1.appendChild(document.createTextNode('path'));
    th2.appendChild(document.createTextNode('reqtime_microsec'));
    tr.appendChild(th1);
    tr.appendChild(th2);
    thead.appendChild(tr);
    table.appendChild(thead);

    var tbody = document.createElement("tbody");
    data.forEach(function(d){
        if(d){
            var tr = document.createElement('tr');
            var td1 = document.createElement('td');
            var td2 = document.createElement('td');
            td1.appendChild(document.createTextNode(d["path"]));
            td2.appendChild(document.createTextNode(d["reqtime_microsec"]));
            tr.appendChild(td1);
            tr.appendChild(td2);
            tbody.appendChild(tr);
        };
    });
    table.appendChild(tbody);
    el.appendChild(table);
}