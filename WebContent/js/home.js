function CreateRow(n, t) {
    var t = $('<tr class="numtreven" onclick="Yswee.ActivityRedirect(' + n.ID + "," + _site + "," + n.BType +
        ');"  ><\/tr>'),
        i, r, s, u, f, e, o, h;
    return t.attr("id", n.ID), n.Status == 5 && t.addClass("in"), i = $("<td><\/td>"), n.Name != null && n.Name != "" &&
        i.html('<a href="javascript:void(0)" class="colorfront name " onclick="Yswee.ActivityRedirect(' + n.ID + "," +
        _site + "," + n.BType + ');"  > ' + n.Name + "<\/a>"), t.append(i), r = $('<td class="alcent"><\/td>'), n.BType !=
        null && n.BType != "" && (s = '<span class="label label-primary">' + n.BtypeName + "<\/span>", r.html(s)), t.append(
        r), u = $('<td class="alcent"><\/td>'), n.OpenDate != null && n.OpenDate != "" && u.text(n.OpenDate), t.append(
        u), f = $('<td class="alcent"><\/td>'), n.Status != null && n.Status != "" && f.html(
        '<span class="activitystatus">' + n.StatusName + "<\/span>"), t.append(f), e = $('<td class="alcent"><\/td>'),
        n.TargetCount != null && n.TargetCount != "" && e.text(n.TargetCount), t.append(e), n.HiddenRegisterCount && n.HiddenRegisterCount
        .toString().toUpperCase() == "TRUE" ? (h = $('<td class="alcent"><\/td>'), t.append(h)) : (o = $(
        '<td class="alcent"><\/td>'), o.text(n.RegisterCount), t.append(o)), t
}
var _site = $("#Site").val(),
    _btype = $("#Btype").val();
(function (n) {
    n.__params = {
        mainbar: "#menubar_target",
        menubar: "#target" + _btype
    }
})(window);
$(document).ready(function () {
    $(window.__params.mainbar).addClass("selected");
    $(window.__params.menubar).addClass("selected");
    $("#mtable").PagerTable({
        pageSize: 5,
        pageIndex: 1,
        pagerNumber: 5,
        sortField: "CreateDate",
        sortDirection: 1,
        ajaxUrl: "/Bidding/GetActivity",
        ajaxParameters: $("#searchfrm").serializeObject(),
        rowFunction: CreateRow
    })
})