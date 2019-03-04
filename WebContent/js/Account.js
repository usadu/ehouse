function doauthuser() {
    if (checkRealName() && checkIdNo()) {
        $("#authuserfrm").submit();
        return
    }
}
function checkRealName() {
    var n = $("#RealName").val();
    return n == "" || n == null ? (notify("姓名不能为空"), !1) : /[\u4e00-\u9fa5]+/.test(n) && /^([\u4E00-\u9FA5])*$/.test(n) ? !
        0 : (notify("您输入的中文名字格式不合法"), !1)
}
function checkIdNo() {
    var i = $("#IDNO").val(),
        t, n, r, u;
    return i == "" || i == null ? (notify("身份证号码不能为空"), !1) : callIdCodeValid("IDNO") ? (t = i.toUpperCase().substring(
        6, 14), n = new Date, n.setFullYear(t.substring(0, 4)), n.setMonth(t.substring(4, 6) - 1), n.setDate(t.substring(
        6, 8)), r = new Date, r.getFullYear() - n.getFullYear() > 18 ? !0 : (n.setFullYear(n.getFullYear() + 18), u =
        parseInt((r.getTime() - n.getTime()) / 864e5), u < 0 && notify("需要年满18岁,才能开通", -1), !1)) : !1
}
function callIdCodeValid(n) {
    var t = document.getElementById(n).value,
        u, i, h;
    if (t = t.toUpperCase(), u = {
        11: "北京",
        12: "天津",
        13: "河北",
        14: "山西",
        15: "内蒙古",
        21: "辽宁",
        22: "吉林",
        23: "黑龙江 ",
        31: "上海",
        32: "江苏",
        33: "浙江",
        34: "安徽",
        35: "福建",
        36: "江西",
        37: "山东",
        41: "河南",
        42: "湖北 ",
        43: "湖南",
        44: "广东",
        45: "广西",
        46: "海南",
        50: "重庆",
        51: "四川",
        52: "贵州",
        53: "云南",
        54: "西藏 ",
        61: "陕西",
        62: "甘肃",
        63: "青海",
        64: "宁夏",
        65: "新疆",
        71: "台湾",
        81: "香港",
        82: "澳门",
        91: "国外 "
    }, t && /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)?$/.test(t)) if (u[t.substr(0, 2)]) {
            if (t.length == 18) {
                t = t.split("");
                var s = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2],
                    f = [1, 0, "X", 9, 8, 7, 6, 5, 4, 3, 2],
                    r = 0,
                    e = 0,
                    o = 0;
                for (i = 0; i < 17; i++) e = t[i], o = s[i], r += e * o;
                if (h = f[r % 11], f[r % 11] != t[17]) return notify("您输入的身份证格式不正确"), !1
            }
        } else return notify("您输入的身份证格式不正确"), !1;
        else return notify("您输入的身份证格式不正确"), !1;
    return !0
}
function submitpaypwd() {
    if (testPwd()) {
        var n = $.md5($("#PayPassword").val());
        $("#Encrypted_pwd").val(n);
        $("#paypasswordfrm").submit();
        return
    }
}
function testPwd() {
    var n = $("#PayPassword").val(),
        t;
    return n == "" ? (notify("交易密码不能为空"), !1) : REG.passwd.test(n) ? (t = $("#ConfirmPayPassword").val(), n != t) ? (
        notify("交易密码与再次输入的密码不一致"), !1) : !0 : (notify("8-20位字符，必须由数字和字符组成"), !1)
}
function cllBankCodeVaild(n) {
    var t = document.getElementById(n).value;
    return t == "" ? (notify("请选择开户行"), !1) : !0
}
function callMobileValid(n) {
    var t = document.getElementById(n).value;
    return /^(17[0-9]|13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|4||5|6|7|8|9])\d{8}$|^[569][0-9]{7}$/.test(t) ? !
        0 : (notify("手机号码不正确"), !1)
}
function callBankCardValid(n) {
    var t = document.getElementById(n).value,
        d, g, e, i, s, v, u, h, c, f, tt, it;
    if (t.length < 16 || t.length > 19 || (d = /^\d*$/, !d.test(t)) || (g =
        "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99", g.indexOf(
        t.substring(0, 2)) == -1)) return notify("银行卡号格式不对,请重新输入"), !1;
    var rt = t.substr(t.length - 1, 1),
        nt = t.substr(0, t.length - 1),
        r = [];
    for (e = nt.length - 1; e > -1; e--) r.push(nt.substr(e, 1));
    var l = [],
        o = [],
        a = [];
    for (i = 0; i < r.length; i++)(i + 1) % 2 == 1 ? parseInt(r[i]) * 2 < 9 ? l.push(parseInt(r[i]) * 2) : o.push(
            parseInt(r[i]) * 2) : a.push(r[i]);
    for (s = [], v = [], u = 0; u < o.length; u++) s.push(parseInt(o[u]) % 10), v.push(parseInt(o[u]) / 10);
    var y = 0,
        p = 0,
        w = 0,
        b = 0,
        k = 0;
    for (h = 0; h < l.length; h++) y = y + parseInt(l[h]);
    for (c = 0; c < a.length; c++) p = p + parseInt(a[c]);
    for (f = 0; f < s.length; f++) w = w + parseInt(s[f]), b = b + parseInt(v[f]);
    return k = parseInt(y) + parseInt(p) + parseInt(w) + parseInt(b), tt = parseInt(k) % 10 == 0 ? 10 : parseInt(k) %
        10, it = 10 - tt, rt == it ? !0 : (notify("银行卡号格式不对,请重新输入"), !1)
}
function AjaxPostBegin() {
    if (cllBankCodeVaild("BankCode") && callBankCardValid("Cardno") && callMobileValid("Tel")) $("#btn_submit_supplier")
            .attr("disabled", !0);
    else return !1
}
function AjaxPostSuccess(n) {
    if ($("#btn_submit_supplier").attr("disabled", !1), n.Message.msgType == 2) window.document.location.href = n.Message
            .url;
    else if (n.Message.msgType == 1) {
        var t = $('<a class="open-dialog" style="display:none"  href="/Profile/SendSmsCode"><\/a>');
        triggerContainer = $("#__someKindOfTrigger");
        triggerContainer.append(t);
        t.click();
        triggerContainer.empty();
        $(".close-dialog").click()
    } else notify(n.Message.text, n.Message.msgType, function () {})
}
function AjaxPostError(n) {
    notify(n.Message.text, n.Message.msgType, function () {
        $("#btn_submit_supplier").attr("disabled", !1)
    })
}
function resetpaypwdauth() {
    var n = $("#Password").val(),
        t;
    if (n == "") return notify("当前登录密码不能为空"), !1;
    if (checkIdNo()) {
        t = $.md5(n);
        $("#Encrypted_pwd").val(t);
        $("#resetpaypwdauth").submit();
        return
    }
}
function limitAmountp(n) {
    var t = n.val();
    t != "" && $.post("/profile/limitAmountp", {
        bankcode: t
    }, function (n) {
        n.Success && $("#limitAmountp").text(n.Message.text).show()
    })
}(function (n) {
    n.__params = {
        mainbar: "#menubar_profile",
        menubar: "#"
    }
})(window);
$(document).ready(function () {
    $(window.__params.mainbar).addClass("selected")
});
var REG = {
    passwd: /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$/
};
/**
 * jQuery MD5 hash algorithm function
 * 
 *  <code>
 *      Calculate the md5 hash of a String 
 *      String $.md5 ( String str )
 *  </code>
 * 
 * Calculates the MD5 hash of str using the » RSA Data Security, Inc. MD5 Message-Digest Algorithm, and returns that hash. 
 * MD5 (Message-Digest algorithm 5) is a widely-used cryptographic hash function with a 128-bit hash value. MD5 has been employed in a wide variety of security applications, and is also commonly used to check the integrity of data. The generated hash is also non-reversable. Data cannot be retrieved from the message digest, the digest uniquely identifies the data.
 * MD5 was developed by Professor Ronald L. Rivest in 1994. Its 128 bit (16 byte) message digest makes it a faster implementation than SHA-1.
 * This script is used to process a variable length message into a fixed-length output of 128 bits using the MD5 algorithm. It is fully compatible with UTF-8 encoding. It is very useful when u want to transfer encrypted passwords over the internet. If you plan using UTF-8 encoding in your project don't forget to set the page encoding to UTF-8 (Content-Type meta tag). 
 * This function orginally get from the WebToolkit and rewrite for using as the jQuery plugin.
 * 
 * Example
 *  Code
 *      <code>
 *          $.md5("I'm Persian."); 
 *      </code>
 *  Result
 *      <code>
 *          "b8c901d0f02223f9761016cfff9d68df"
 *      </code>
 * 
 * @alias Muhammad Hussein Fattahizadeh < muhammad [AT] semnanweb [DOT] com >
 * @link http://www.semnanweb.com/jquery-plugin/md5.html
 * @see http://www.webtoolkit.info/
 * @license http://www.gnu.org/licenses/gpl.html [GNU General Public License]
 * @param {jQuery} {md5:function(string))
 * @return string
 */ (function (n) {
    var e = function (n, t) {
        return n << t | n >>> 32 - t
    }, t = function (n, t) {
            var f, e, r, u, i;
            return (r = n & 2147483648, u = t & 2147483648, f = n & 1073741824, e = t & 1073741824, i = (n & 1073741823) +
                (t & 1073741823), f & e) ? i ^ 2147483648 ^ r ^ u : f | e ? i & 1073741824 ? i ^ 3221225472 ^ r ^ u : i ^
                1073741824 ^ r ^ u : i ^ r ^ u
        }, s = function (n, t, i) {
            return n & t | ~n & i
        }, h = function (n, t, i) {
            return n & i | t & ~i
        }, c = function (n, t, i) {
            return n ^ t ^ i
        }, l = function (n, t, i) {
            return t ^ (n | ~i)
        }, i = function (n, i, r, u, f, o, h) {
            return n = t(n, t(t(s(i, r, u), f), h)), t(e(n, o), i)
        }, r = function (n, i, r, u, f, o, s) {
            return n = t(n, t(t(h(i, r, u), f), s)), t(e(n, o), i)
        }, u = function (n, i, r, u, f, o, s) {
            return n = t(n, t(t(c(i, r, u), f), s)), t(e(n, o), i)
        }, f = function (n, i, r, u, f, o, s) {
            return n = t(n, t(t(l(i, r, u), f), s)), t(e(n, o), i)
        }, a = function (n) {
            for (var r, u = n.length, o = u + 8, s = (o - o % 64) / 64, e = (s + 1) * 16, i = Array(e - 1), f = 0, t =
                    0; t < u;) r = (t - t % 4) / 4, f = t % 4 * 8, i[r] = i[r] | n.charCodeAt(t) << f, t++;
            return r = (t - t % 4) / 4, f = t % 4 * 8, i[r] = i[r] | 128 << f, i[e - 2] = u << 3, i[e - 1] = u >>> 29,
                i
        }, o = function (n) {
            for (var i = "", r = "", u, t = 0; t <= 3; t++) u = n >>> t * 8 & 255, r = "0" + u.toString(16), i = i + r.substr(
                    r.length - 2, 2);
            return i
        }, v = function (n) {
            var i, r, t;
            for (n = n.replace(/\x0d\x0a/g, "\n"), i = "", r = 0; r < n.length; r++) t = n.charCodeAt(r), t < 128 ? i +=
                    String.fromCharCode(t) : t > 127 && t < 2048 ? (i += String.fromCharCode(t >> 6 | 192), i += String
                    .fromCharCode(t & 63 | 128)) : (i += String.fromCharCode(t >> 12 | 224), i += String.fromCharCode(t >>
                    6 & 63 | 128), i += String.fromCharCode(t & 63 | 128));
            return i
        };
    n.extend({
        md5: function (n) {
            var y = Array(),
                l, ct, lt, at, vt, e, s, h, c, p = 7,
                w = 12,
                b = 17,
                k = 22,
                d = 5,
                g = 9,
                nt = 14,
                tt = 20,
                it = 4,
                rt = 11,
                ut = 16,
                ft = 23,
                et = 6,
                ot = 10,
                st = 15,
                ht = 21,
                yt;
            for (n = v(n), y = a(n), e = 1732584193, s = 4023233417, h = 2562383102, c = 271733878, l = 0; l < y.length; l +=
                16) ct = e, lt = s, at = h, vt = c, e = i(e, s, h, c, y[l + 0], p, 3614090360), c = i(c, e, s, h, y[l +
                    1], w, 3905402710), h = i(h, c, e, s, y[l + 2], b, 606105819), s = i(s, h, c, e, y[l + 3], k,
                    3250441966), e = i(e, s, h, c, y[l + 4], p, 4118548399), c = i(c, e, s, h, y[l + 5], w, 1200080426),
                    h = i(h, c, e, s, y[l + 6], b, 2821735955), s = i(s, h, c, e, y[l + 7], k, 4249261313), e = i(e, s,
                    h, c, y[l + 8], p, 1770035416), c = i(c, e, s, h, y[l + 9], w, 2336552879), h = i(h, c, e, s, y[l +
                    10], b, 4294925233), s = i(s, h, c, e, y[l + 11], k, 2304563134), e = i(e, s, h, c, y[l + 12], p,
                    1804603682), c = i(c, e, s, h, y[l + 13], w, 4254626195), h = i(h, c, e, s, y[l + 14], b,
                    2792965006), s = i(s, h, c, e, y[l + 15], k, 1236535329), e = r(e, s, h, c, y[l + 1], d, 4129170786),
                    c = r(c, e, s, h, y[l + 6], g, 3225465664), h = r(h, c, e, s, y[l + 11], nt, 643717713), s = r(s, h,
                    c, e, y[l + 0], tt, 3921069994), e = r(e, s, h, c, y[l + 5], d, 3593408605), c = r(c, e, s, h, y[l +
                    10], g, 38016083), h = r(h, c, e, s, y[l + 15], nt, 3634488961), s = r(s, h, c, e, y[l + 4], tt,
                    3889429448), e = r(e, s, h, c, y[l + 9], d, 568446438), c = r(c, e, s, h, y[l + 14], g, 3275163606),
                    h = r(h, c, e, s, y[l + 3], nt, 4107603335), s = r(s, h, c, e, y[l + 8], tt, 1163531501), e = r(e,
                    s, h, c, y[l + 13], d, 2850285829), c = r(c, e, s, h, y[l + 2], g, 4243563512), h = r(h, c, e, s, y[
                    l + 7], nt, 1735328473), s = r(s, h, c, e, y[l + 12], tt, 2368359562), e = u(e, s, h, c, y[l + 5],
                    it, 4294588738), c = u(c, e, s, h, y[l + 8], rt, 2272392833), h = u(h, c, e, s, y[l + 11], ut,
                    1839030562), s = u(s, h, c, e, y[l + 14], ft, 4259657740), e = u(e, s, h, c, y[l + 1], it,
                    2763975236), c = u(c, e, s, h, y[l + 4], rt, 1272893353), h = u(h, c, e, s, y[l + 7], ut,
                    4139469664), s = u(s, h, c, e, y[l + 10], ft, 3200236656), e = u(e, s, h, c, y[l + 13], it,
                    681279174), c = u(c, e, s, h, y[l + 0], rt, 3936430074), h = u(h, c, e, s, y[l + 3], ut, 3572445317),
                    s = u(s, h, c, e, y[l + 6], ft, 76029189), e = u(e, s, h, c, y[l + 9], it, 3654602809), c = u(c, e,
                    s, h, y[l + 12], rt, 3873151461), h = u(h, c, e, s, y[l + 15], ut, 530742520), s = u(s, h, c, e, y[
                    l + 2], ft, 3299628645), e = f(e, s, h, c, y[l + 0], et, 4096336452), c = f(c, e, s, h, y[l + 7],
                    ot, 1126891415), h = f(h, c, e, s, y[l + 14], st, 2878612391), s = f(s, h, c, e, y[l + 5], ht,
                    4237533241), e = f(e, s, h, c, y[l + 12], et, 1700485571), c = f(c, e, s, h, y[l + 3], ot,
                    2399980690), h = f(h, c, e, s, y[l + 10], st, 4293915773), s = f(s, h, c, e, y[l + 1], ht,
                    2240044497), e = f(e, s, h, c, y[l + 8], et, 1873313359), c = f(c, e, s, h, y[l + 15], ot,
                    4264355552), h = f(h, c, e, s, y[l + 6], st, 2734768916), s = f(s, h, c, e, y[l + 13], ht,
                    1309151649), e = f(e, s, h, c, y[l + 4], et, 4149444226), c = f(c, e, s, h, y[l + 11], ot,
                    3174756917), h = f(h, c, e, s, y[l + 2], st, 718787259), s = f(s, h, c, e, y[l + 9], ht, 3951481745),
                    e = t(e, ct), s = t(s, lt), h = t(h, at), c = t(c, vt);
            return yt = o(e) + o(s) + o(h) + o(c), yt.toLowerCase()
        }
    })
})(jQuery)