function CreateRow(n, t) {
    var t, u, i, r, f;
    return t = t % 2 == 0 ? $('<tr class="numtrodd" ><\/tr>') : $('<tr class="numtreven"><\/tr>'), t.attr("id", n.ActivityId),
        u = $('<td class="colorfront"><\/td>'), u.text(n.Content), t.append(u), i = $("<td><\/td>"), n.Name != null &&
        n.Name != "" && n.BType > 2 ? i.html('<a onclick="Yswee.ActivityRedirect(' + n.ActivityId + "," + n.Companyid +
        "," + n.BType + ')"  href="javascript:void(0)" class="red "  > ' + n.Name + "<\/a>") : n.Name != null && n.Name !=
        "" && n.BType == 1 ? i.html('<a onclick="Yswee.ProductRedirect(' + n.ActivityId +
        ')"  href="javascript:void(0)" class="red "  > ' + n.Name + "<\/a>") : n.Name != null && n.Name != "" && n.BType ==
        2 && i.html('<a href="/Market/Detail/' + n.ActivityId + '" class="red" target="_blank" > ' + n.Name + "<\/a>"),
        t.append(i), r = $('<td class="alcent"><\/td>'), n.Num != null && n.Num != "" && n.BType > 2 ? r.html(
        '<a data-href="/ActivityTarget/Auction/' + n.TargetId + "?site=" + n.Companyid +
        '" class="pageslide red" target="_blank" > ' + n.CategoryName + "-" + n.Num + "<\/a>") : n.Num != null && n.Num !=
        "" && n.BType == 1 ? r.html('<a data-href="/FinancialProduct/House/' + n.TargetId + "?pid=" + n.ActivityId +
        '" class="pageslide red" target="_blank" > ' + n.CategoryName + "-" + n.Num + "<\/a>") : n.Num != null && n.Num !=
        "" && n.BType == 2 && r.html('<a data-href="/Market/House/' + n.TargetId + "?pid=" + n.ActivityId +
        '" class="pageslide red" target="_blank" > ' + n.CategoryName + "-" + n.Num + "<\/a>"), t.append(r), f = $(
        '<td class="alcent"><\/td>'), n.CreateDate != null && n.CreateDate != "" && f.text(Yswee.getDateTime(Yswee.ConvertJSONDateToJSDateObject(
        n.CreateDate))), t.append(f), t
}
$(document).ready(function () {
    $("#menubar_profile").addClass("selected");
    $("#mtable").PagerTable({
        pageSize: 5,
        pageIndex: 1,
        pagerNumber: 5,
        sortField: "l.CreateDate",
        sortDirection: 1,
        ajaxUrl: "/Profile/GetSystemLogs",
        ajaxParameters: $("#searchfrm").serializeObject(),
        rowFunction: CreateRow
    })
})