(function (n) {
    function t(t, i) {
        var u, r = this,
            e = window.navigator,
            l = e.userAgent.toLowerCase(),
            s, o, a, y;
        r.uid = n.rsModules.uid++;
        r.ns = ".rs" + r.uid;
        var h = document.createElement("div").style,
            f = ["webkit", "Moz", "ms", "O"],
            o = "",
            v = 0,
            c;
        for (u = 0; u < f.length; u++) c = f[u], !o && c + "Transform" in h && (o = c), c = c.toLowerCase(), window.requestAnimationFrame ||
                (window.requestAnimationFrame = window[c + "RequestAnimationFrame"], window.cancelAnimationFrame =
                window[c + "CancelAnimationFrame"] || window[c + "CancelRequestAnimationFrame"]);
        for (window.requestAnimationFrame || (window.requestAnimationFrame = function (n) {
            var t = (new Date).getTime(),
                i = Math.max(0, 16 - (t - v)),
                r = window.setTimeout(function () {
                    n(t + i)
                }, i);
            return v = t + i, r
        }), window.cancelAnimationFrame || (window.cancelAnimationFrame = function (n) {
            clearTimeout(n)
        }), r.isIPAD = l.match(/(ipad)/), r.isIOS = r.isIPAD || l.match(/(iphone|ipod)/), u = function (n) {
            return n = /(chrome)[ \/]([\w.]+)/.exec(n) || /(webkit)[ \/]([\w.]+)/.exec(n) ||
                /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(n) || /(msie) ([\w.]+)/.exec(n) || 0 > n.indexOf("compatible") &&
                /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(n) || [], {
                browser: n[1] || "",
                version: n[2] || "0"
            }
        }(l), f = {}, u.browser && (f[u.browser] = !0, f.version = u.version), f.chrome && (f.webkit = !0), r._a = f, r
            .isAndroid = -1 < l.indexOf("android"), r.slider = n(t), r.ev = n(r), r._b = n(document), r.st = n.extend({},
            n.fn.royalSlider.defaults, i), r._c = r.st.transitionSpeed, r._d = 0, r.st.allowCSS3 && (!f.webkit || r.st.allowCSS3OnWebkit) &&
            (u = o + (o ? "T" : "t"), r._e = (u + "ransform" in h) && (u + "ransition" in h), r._e && (r._f = (o + (o ?
            "P" : "p") + "erspective" in h))), o = o.toLowerCase(), r._g = "-" + o + "-", r._h = "vertical" === r.st.slidesOrientation ? !
            1 : !0, r._i = r._h ? "left" : "top", r._j = r._h ? "width" : "height", r._k = -1, r._l = "fade" === r.st.transitionType ? !
            1 : !0, r._l || (r.st.sliderDrag = !1, r._m = 10), r._n = "z-index:0; display:none; opacity:0;", r._o = 0,
            r._p = 0, r._q = 0, n.each(n.rsModules, function (n, t) {
            "uid" !== n && t.call(r)
        }), r.slides = [], r._r = 0, (r.st.slides ? n(r.st.slides) : r.slider.children().detach()).each(function () {
            r._s(this, !0)
        }), r.st.randomizeSlides && r.slides.sort(function () {
            return .5 - Math.random()
        }), r.numSlides = r.slides.length, r._t(), r.st.startSlideId ? r.st.startSlideId > r.numSlides - 1 && (r.st.startSlideId =
            r.numSlides - 1) : r.st.startSlideId = 0, r._o = r.staticSlideId = r.currSlideId = r._u = r.st.startSlideId,
            r.currSlide = r.slides[r.currSlideId], r._v = 0, r.pointerMultitouch = !1, r.slider.addClass((r._h ?
            "rsHor" : "rsVer") + (r._l ? "" : " rsFade")), h = '<div class="rsOverflow"><div class="rsContainer">', r.slidesSpacing =
            r.st.slidesSpacing, r._w = (r._h ? r.slider.width() : r.slider.height()) + r.st.slidesSpacing, r._x =
            Boolean(0 < r._y), 1 >= r.numSlides && (r._z = !1), r._a1 = r._z && r._l ? 2 === r.numSlides ? 1 : 2 : 0, r
            ._b1 = 6 > r.numSlides ? r.numSlides : 6, r._c1 = 0, r._d1 = 0, r.slidesJQ = [], u = 0; u < r.numSlides; u++)
            r.slidesJQ.push(n('<div style="' + (r._l ? "" : u !== r.currSlideId ? r._n : "z-index:0;") +
                '" class="rsSlide "><\/div>'));
        r._e1 = h = n(h + "<\/div><\/div>");
        s = r.ns;
        o = function (n, t, i, u, f) {
            r._j1 = n + t + s;
            r._k1 = n + i + s;
            r._l1 = n + u + s;
            f && (r._m1 = n + f + s)
        };
        u = e.pointerEnabled;
        r.pointerEnabled = u || e.msPointerEnabled;
        r.pointerEnabled ? (r.hasTouch = !1, r._n1 = .2, r.pointerMultitouch = Boolean(1 < e[(u ? "m" : "msM") +
            "axTouchPoints"]), u ? o("pointer", "down", "move", "up", "cancel") : o("MSPointer", "Down", "Move", "Up",
            "Cancel")) : (r.isIOS ? r._j1 = r._k1 = r._l1 = r._m1 = "" : o("mouse", "down", "move", "up"),
            "ontouchstart" in window || "createTouch" in document ? (r.hasTouch = !0, r._j1 += " touchstart" + s, r._k1 +=
            " touchmove" + s, r._l1 += " touchend" + s, r._m1 += " touchcancel" + s, r._n1 = .5, r.st.sliderTouch && (r
            ._f1 = !0)) : (r.hasTouch = !1, r._n1 = .2));
        r.st.sliderDrag && (r._f1 = !0, f.msie || f.opera ? r._g1 = r._h1 = "move" : f.mozilla ? (r._g1 = "-moz-grab",
            r._h1 = "-moz-grabbing") : f.webkit && -1 != e.platform.indexOf("Mac") && (r._g1 = "-webkit-grab", r._h1 =
            "-webkit-grabbing"), r._i1());
        r.slider.html(h);
        r._o1 = r.st.controlsInside ? r._e1 : r.slider;
        r._p1 = r._e1.children(".rsContainer");
        r.pointerEnabled && r._p1.css((u ? "" : "-ms-") + "touch-action", r._h ? "pan-y" : "pan-x");
        r._q1 = n('<div class="rsPreloader"><\/div>');
        e = r._p1.children(".rsSlide");
        r._r1 = r.slidesJQ[r.currSlideId];
        r._s1 = 0;
        r._e ? (r._t1 = "transition-property", r._u1 = "transition-duration", r._v1 = "transition-timing-function", r._w1 =
            r._x1 = r._g + "transform", r._f ? (f.webkit && !f.chrome && r.slider.addClass("rsWebkit3d"), r._y1 =
            "translate3d(", r._z1 = "px, ", r._a2 = "px, 0px)") : (r._y1 = "translate(", r._z1 = "px, ", r._a2 = "px)"),
            r._l ? r._p1[r._g + r._t1] = r._g + "transform" : (f = {}, f[r._g + r._t1] = "opacity", f[r._g + r._u1] = r
            .st.transitionSpeed + "ms", f[r._g + r._v1] = r.st.css3easeInOut, e.css(f))) : (r._x1 = "left", r._w1 =
            "top");
        n(window).on("resize" + r.ns, function () {
            a && clearTimeout(a);
            a = setTimeout(function () {
                r.updateSliderSize()
            }, 50)
        });
        if (r.ev.trigger("rsAfterPropsSetup"), r.updateSliderSize(), r.st.keyboardNavEnabled && r._b2(), r.st.arrowsNavHideOnTouch &&
            (r.hasTouch || r.pointerMultitouch) && (r.st.arrowsNav = !1), r.st.arrowsNav && (e = r._o1, n(
            '<div class="rsArrow rsArrowLeft"><div class="rsArrowIcn"><\/div><\/div><div class="rsArrow rsArrowRight"><div class="rsArrowIcn"><\/div><\/div>')
            .appendTo(e), r._c2 = e.children(".rsArrowLeft").click(function (n) {
            n.preventDefault();
            r.prev()
        }), r._d2 = e.children(".rsArrowRight").click(function (n) {
            n.preventDefault();
            r.next()
        }), r.st.arrowsNavAutoHide && !r.hasTouch && (r._c2.addClass("rsHidden"), r._d2.addClass("rsHidden"), e.one(
            "mousemove.arrowshover", function () {
            r._c2.removeClass("rsHidden");
            r._d2.removeClass("rsHidden")
        }), e.hover(function () {
            r._e2 || (r._c2.removeClass("rsHidden"), r._d2.removeClass("rsHidden"))
        }, function () {
            r._e2 || (r._c2.addClass("rsHidden"), r._d2.addClass("rsHidden"))
        })), r.ev.on("rsOnUpdateNav", function () {
            r._f2()
        }), r._f2()), r._f1) r._p1.on(r._j1, function (n) {
                r._g2(n)
            });
        else r.dragSuccess = !1;
        y = ["rsPlayBtnIcon", "rsPlayBtn", "rsCloseVideoBtn", "rsCloseVideoIcn"];
        r._p1.click(function (t) {
            if (!r.dragSuccess) {
                var i = n(t.target).attr("class");
                if (-1 !== n.inArray(i, y) && r.toggleVideo()) return !1;
                if (r.st.navigateByClick && !r._h2) {
                    if (n(t.target).closest(".rsNoDrag", r._r1).length) return !0;
                    r._i2(t)
                }
                r.ev.trigger("rsSlideClick", t)
            }
        }).on("click.rs", "a", function () {
            if (r.dragSuccess) return !1;
            r._h2 = !0;
            setTimeout(function () {
                r._h2 = !1
            }, 3)
        });
        r.ev.trigger("rsAfterInit")
    }
    n.rsModules || (n.rsModules = {
        uid: 0
    });
    t.prototype = {
        constructor: t,
        _i2: function (n) {
            n = n[this._h ? "pageX" : "pageY"] - this._j2;
            n >= this._q ? this.next() : 0 > n && this.prev()
        },
        _t: function () {
            var n;
            n = this.st.numImagesToPreload;
            (this._z = this.st.loop) && (2 === this.numSlides ? (this._z = !1, this.st.loopRewind = !0) : 2 > this.numSlides &&
                (this.st.loopRewind = this._z = !1));
            this._z && 0 < n && (4 >= this.numSlides ? n = 1 : this.st.numImagesToPreload > (this.numSlides - 1) / 2 &&
                (n = Math.floor((this.numSlides - 1) / 2)));
            this._y = n
        },
        _s: function (t, i) {
            function e(n, t) {
                if (t ? r.images.push(n.attr(t)) : r.images.push(n.text()), s) {
                    s = !1;
                    r.caption = "src" === t ? n.attr("alt") : n.contents();
                    r.image = r.images[0];
                    r.videoURL = n.attr("data-rsVideo");
                    var i = n.attr("data-rsw"),
                        f = n.attr("data-rsh");
                    "undefined" != typeof i && !1 !== i && "undefined" != typeof f && !1 !== f ? (r.iW = parseInt(i, 10),
                        r.iH = parseInt(f, 10)) : u.st.imgWidth && u.st.imgHeight && (r.iW = u.st.imgWidth, r.iH = u.st
                        .imgHeight)
                }
            }
            var u = this,
                o, r = {}, f, s = !0;
            return t = n(t), u._k2 = t, u.ev.trigger("rsBeforeParseNode", [t, r]), r.stopParsing ? void 0 : (t = u._k2,
                r.id = u._r, r.contentAdded = !1, u._r++, r.images = [], r.isBig = !1, r.hasCover || (t.hasClass(
                "rsImg") ? (f = t, o = !0) : (f = t.find(".rsImg"), f.length && (o = !0)), o ? (r.bigImage = f.eq(0).attr(
                "data-rsBigImg"), f.each(function () {
                var t = n(this);
                t.is("a") ? e(t, "href") : t.is("img") ? e(t, "src") : e(t)
            })) : t.is("img") && (t.addClass("rsImg rsMainSlideImage"), e(t, "src"))), f = t.find(".rsCaption"), f.length &&
                (r.caption = f.remove()), r.content = t, u.ev.trigger("rsAfterParseNode", [t, r]), i && u.slides.push(r),
                0 === r.images.length && (r.isLoaded = !0, r.isRendered = !1, r.isLoading = !1, r.images = null), r)
        },
        _b2: function () {
            var n = this,
                t, i, r = function (t) {
                    37 === t ? n.prev() : 39 === t && n.next()
                };
            n._b.on("keydown" + n.ns, function (u) {
                n._l2 || (i = u.keyCode, 37 !== i && 39 !== i || t || (r(i), t = setInterval(function () {
                    r(i)
                }, 700)))
            }).on("keyup" + n.ns, function () {
                t && (clearInterval(t), t = null)
            })
        },
        goTo: function (n, t) {
            n !== this.currSlideId && this._m2(n, this.st.transitionSpeed, !0, !t)
        },
        destroy: function (t) {
            this.ev.trigger("rsBeforeDestroy");
            this._b.off("keydown" + this.ns + " keyup" + this.ns + " " + this._k1 + " " + this._l1);
            this._p1.off(this._j1 + " click");
            this.slider.data("royalSlider", null);
            n.removeData(this.slider, "royalSlider");
            n(window).off("resize" + this.ns);
            this.loadingTimeout && clearTimeout(this.loadingTimeout);
            t && this.slider.remove();
            this.ev = this.slider = this.slides = null
        },
        _n2: function (t, i) {
            function v(i, u, f) {
                i.isAdded ? (y(u, i), p(u, i)) : (f || (f = r.slidesJQ[u]), i.holder ? f = i.holder : (f = r.slidesJQ[u] =
                    n(f), i.holder = f), i.appendOnLoaded = !1, p(u, i, f), y(u, i), r._p2(i, f, t), i.isAdded = !0)
            }
            function y(n, i) {
                i.contentAdded || (r.setItemHtml(i, t), t || (i.contentAdded = !0))
            }
            function p(n, t, i) {
                r._l && (i || (i = r.slidesJQ[n]), i.css(r._i, (n + r._d1 + a) * r._w))
            }
            function s(n) {
                if (k) {
                    if (n > l - 1) return s(n - l);
                    if (0 > n) return s(l + n)
                }
                return n
            }
            var r = this,
                e, u, k = r._z,
                l = r.numSlides;
            if (!isNaN(i)) return s(i);
            var f = r.currSlideId,
                a, h = t ? Math.abs(r._o2 - r.currSlideId) >= r.numSlides - 1 ? 0 : 1 : r._y,
                c = Math.min(2, h),
                w = !1,
                b = !1,
                o;
            for (u = f; u < f + 1 + c; u++) if (o = s(u), (e = r.slides[o]) && (!e.isAdded || !e.positionSet)) {
                    w = !0;
                    break
                }
            for (u = f - 1; u > f - 1 - c; u--) if (o = s(u), (e = r.slides[o]) && (!e.isAdded || !e.positionSet)) {
                    b = !0;
                    break
                }
            if (w) for (u = f; u < f + h + 1; u++) o = s(u), a = Math.floor((r._u - (f - u)) / r.numSlides) * r.numSlides, (
                        e = r.slides[o]) && v(e, o);
            if (b) for (u = f - 1; u > f - 1 - h; u--) o = s(u), a = Math.floor((r._u - (f - u)) / l) * l, (e = r.slides[
                        o]) && v(e, o);
            if (!t) for (c = s(f - h), f = s(f + h), h = c > f ? 0 : c, u = 0; u < l; u++) c > f && u > c - 1 || !(u <
                        h || u > f) || (e = r.slides[u]) && e.holder && (e.holder.detach(), e.isAdded = !1)
        },
        setItemHtml: function (t, i) {
            var r = this,
                e = function () {
                    var i, e, u, s;
                    if (t.images) {
                        if (!t.isLoading) if (t.content.hasClass("rsImg") ? (i = t.content, e = !0) : i = t.content.find(
                                ".rsImg:not(img)"), i && !i.is("img") && i.each(function () {
                                var i = n(this),
                                    r = '<img class="rsImg" src="' + (i.is("a") ? i.attr("href") : i.text()) + '" />';
                                e ? t.content = n(r) : i.replaceWith(r)
                            }), i = e ? t.content : t.content.find("img.rsImg"), h(), i.eq(0).addClass(
                                "rsMainSlideImage"), t.iW && t.iH && (t.isLoaded || r._q2(t), f()), t.isLoading = !0, t
                                .isBig) n("<img />").on("load.rs error.rs", function () {
                                    n(this).off("load.rs error.rs");
                                    o([this], !0)
                                }).attr("src", t.image);
                            else for (t.loaded = [], t.numStartedLoad = 0, i = function () {
                                    n(this).off("load.rs error.rs");
                                    t.loaded.push(this);
                                    t.loaded.length === t.numStartedLoad && o(t.loaded, !1)
                                }, u = 0; u < t.images.length; u++) s = n("<img />"), t.numStartedLoad++, s.on(
                                        "load.rs error.rs", i).attr("src", t.images[u])
                    } else t.isRendered = !0, t.isLoaded = !0, t.isLoading = !1, f(!0)
                }, o = function (n, i) {
                    var f, r;
                    n.length ? (f = n[0], i !== t.isBig ? (f = t.holder.children()) && 1 < f.length && c() : t.iW && t.iH ?
                        u() : (t.iW = f.width, t.iH = f.height, t.iW && t.iH) ? u() : (r = new Image, r.onload = function () {
                        r.width ? (t.iW = r.width, t.iH = r.height, u()) : setTimeout(function () {
                            r.width && (t.iW = r.width, t.iH = r.height);
                            u()
                        }, 1e3)
                    }, r.src = f.src)) : u()
                }, u = function () {
                    t.isLoaded = !0;
                    t.isLoading = !1;
                    f();
                    c();
                    s()
                }, f = function () {
                    if (!t.isAppended && r.ev) {
                        var n = r.st.visibleNearby,
                            u = t.id - r._o;
                        !i && !t.appendOnLoaded && r.st.fadeinLoadedSlide && (0 === u || (n || r._r2 || r._l2) && (-1 ===
                            u || 1 === u)) && (n = {
                            visibility: "visible",
                            opacity: 0
                        }, n[r._g + "transition"] = "opacity 400ms ease-in-out", t.content.css(n), setTimeout(function () {
                            t.content.css("opacity", 1)
                        }, 16));
                        t.holder.find(".rsPreloader").length ? t.holder.append(t.content) : t.holder.html(t.content);
                        t.isAppended = !0;
                        t.isLoaded && (r._q2(t), s());
                        t.sizeReady || (t.sizeReady = !0, setTimeout(function () {
                            r.ev.trigger("rsMaybeSizeReady", t)
                        }, 100))
                    }
                }, s = function () {
                    !t.loadedTriggered && r.ev && (t.isLoaded = t.loadedTriggered = !0, t.holder.trigger(
                        "rsAfterContentSet"), r.ev.trigger("rsAfterContentSet", t))
                }, h = function () {
                    r.st.usePreloader && t.holder.html(r._q1.clone())
                }, c = function (n) {
                    r.st.usePreloader && (n = t.holder.find(".rsPreloader"), n.length && n.remove())
                };
            t.isLoaded ? f() : i ? !r._l && t.images && t.iW && t.iH ? e() : (t.holder.isWaiting = !0, h(), t.holder.slideId = -
                99) : e()
        },
        _p2: function (n) {
            this._p1.append(n.holder);
            n.appendOnLoaded = !1
        },
        _g2: function (t, i) {
            var r = this,
                u, f = "touchstart" === t.type,
                e;
            if (r._s2 = f, r.ev.trigger("rsDragStart"), n(t.target).closest(".rsNoDrag", r._r1).length) return r.dragSuccess = !
                    1, !0;
            if (!i && r._r2 && (r._t2 = !0, r._u2()), r.dragSuccess = !1, r._l2) f && (r._v2 = !0);
            else {
                if (f && (r._v2 = !1), r._w2(), f) if (e = t.originalEvent.touches, e && 0 < e.length) u = e[0], 1 < e.length &&
                            (r._v2 = !0);
                    else return;
                    else t.preventDefault(), u = t, r.pointerEnabled && (u = u.originalEvent);
                r._l2 = !0;
                r._b.on(r._k1, function (n) {
                    r._x2(n, i)
                }).on(r._l1, function (n) {
                    r._y2(n, i)
                });
                if (r._z2 = "", r._a3 = !1, r._b3 = u.pageX, r._c3 = u.pageY, r._d3 = r._v = (i ? r._e3 : r._h) ? u.pageX :
                    u.pageY, r._f3 = 0, r._g3 = 0, r._h3 = i ? r._i3 : r._p, r._j3 = (new Date).getTime(), f) r._e1.on(
                        r._m1, function (n) {
                        r._y2(n, i)
                    })
            }
        },
        _k3: function (n, t) {
            if (this._l3) {
                var o = this._m3,
                    i = n.pageX - this._b3,
                    f = n.pageY - this._c3,
                    r = this._h3 + i,
                    u = this._h3 + f,
                    e = t ? this._e3 : this._h,
                    r = e ? r : u,
                    u = this._z2;
                this._a3 = !0;
                this._b3 = n.pageX;
                this._c3 = n.pageY;
                "x" === u && 0 !== i ? this._f3 = 0 < i ? 1 : -1 : "y" === u && 0 !== f && (this._g3 = 0 < f ? 1 : -1);
                u = e ? this._b3 : this._c3;
                i = e ? i : f;
                t ? r > this._n3 ? r = this._h3 + i * this._n1 : r < this._o3 && (r = this._h3 + i * this._n1) : this._z ||
                    (0 >= this.currSlideId && 0 < u - this._d3 && (r = this._h3 + i * this._n1), this.currSlideId >=
                    this.numSlides - 1 && 0 > u - this._d3 && (r = this._h3 + i * this._n1));
                this._h3 = r;
                200 < o - this._j3 && (this._j3 = o, this._v = u);
                t ? this._q3(this._h3) : this._l && this._p3(this._h3)
            }
        },
        _x2: function (n, t) {
            var i = this,
                r, f = "touchmove" === n.type,
                u;
            if (!i._s2 || f) {
                if (f) {
                    if (i._r3) return;
                    if (u = n.originalEvent.touches, u) {
                        if (1 < u.length) return;
                        r = u[0]
                    } else return
                } else r = n, i.pointerEnabled && (r = r.originalEvent); if (i._a3 || (i._e && (t ? i._s3 : i._p1).css(
                    i._g + i._u1, "0s"), function e() {
                    i._l2 && (i._t3 = requestAnimationFrame(e), i._u3 && i._k3(i._u3, t))
                }()), i._l3) n.preventDefault(), i._m3 = (new Date).getTime(), i._u3 = r;
                else if (u = t ? i._e3 : i._h, r = Math.abs(r.pageX - i._b3) - Math.abs(r.pageY - i._c3) - (u ? -7 : 7),
                    7 < r) {
                    if (u) n.preventDefault(), i._z2 = "x";
                    else if (f) {
                        i._v3(n);
                        return
                    }
                    i._l3 = !0
                } else if (-7 > r) {
                    if (u) {
                        if (f) {
                            i._v3(n);
                            return
                        }
                    } else n.preventDefault(), i._z2 = "y";
                    i._l3 = !0
                }
            }
        },
        _v3: function (n) {
            this._r3 = !0;
            this._a3 = this._l2 = !1;
            this._y2(n)
        },
        _y2: function (t, i) {
            function v(n) {
                return 100 > n ? 100 : 500 < n ? 500 : n
            }
            function c(n, t) {
                (r._l || i) && (s = (-r._u - r._d1) * r._w, y = Math.abs(r._p - s), r._c = y / t, n && (r._c += 250), r
                    ._c = v(r._c), r._x3(s, !1))
            }
            var r = this,
                o, u, s, y, f, a, e, h;
            if (o = -1 < t.type.indexOf("touch"), !r._s2 || o) if (r._s2 = !1, r.ev.trigger("rsDragRelease"), r._u3 =
                    null, r._l2 = !1, r._r3 = !1, r._l3 = !1, r._m3 = 0, cancelAnimationFrame(r._t3), r._a3 && (i ? r._q3(
                    r._h3) : r._l && r._p3(r._h3)), r._b.off(r._k1).off(r._l1), o && r._e1.off(r._m1), r._i1(), !r._a3 && !
                    r._v2 && i && r._w3) f = n(t.target).closest(".rsNavItem"), f.length && r.goTo(f.index());
                else {
                    if (u = i ? r._e3 : r._h, r._a3 && ("y" !== r._z2 || !u) && ("x" !== r._z2 || u)) r.dragSuccess = !
                            0;
                    else if (!i && r._t2) {
                        if (r._t2 = !1, r.st.navigateByClick) {
                            r._i2(r.pointerEnabled ? t.originalEvent : t);
                            r.dragSuccess = !0;
                            return
                        }
                        r.dragSuccess = !0
                    } else {
                        r._t2 = !1;
                        r.dragSuccess = !1;
                        return
                    }
                    r._t2 = !1;
                    r._z2 = "";
                    a = r.st.minSlideOffset;
                    o = o ? t.originalEvent.changedTouches[0] : r.pointerEnabled ? t.originalEvent : t;
                    e = u ? o.pageX : o.pageY;
                    h = r._d3;
                    o = r._v;
                    var p = r.currSlideId,
                        w = r.numSlides,
                        l = u ? r._f3 : r._g3,
                        b = r._z;
                    if (Math.abs(e - h), o = e - o, u = (new Date).getTime() - r._j3, u = Math.abs(o) / u, 0 === l || 1 >=
                        w) c(!0, u);
                    else {
                        if (!b && !i) if (0 >= p) {
                                if (0 < l) {
                                    c(!0, u);
                                    return
                                }
                            } else if (p >= w - 1 && 0 > l) {
                            c(!0, u);
                            return
                        }
                        if (i) {
                            if (s = r._i3, s > r._n3) s = r._n3;
                            else if (s < r._o3) s = r._o3;
                            else {
                                if (e = u * u / .006, f = -r._i3, h = r._y3 - r._z3 + r._i3, 0 < o && e > f ? (f += r._z3 /
                                    (15 / (e / u * .003)), u = u * f / e, e = f) : 0 > o && e > h && (h += r._z3 / (15 /
                                    (e / u * .003)), u = u * h / e, e = h), f = Math.max(Math.round(u / .003), 50), s +=
                                    e * (0 > o ? -1 : 1), s > r._n3) {
                                    r._a4(s, f, !0, r._n3, 200);
                                    return
                                }
                                if (s < r._o3) {
                                    r._a4(s, f, !0, r._o3, 200);
                                    return
                                }
                            }
                            r._a4(s, f, !0)
                        } else f = function (n) {
                                var t = Math.floor(n / r._w);
                                return n - t * r._w > a && t++, t
                        }, h + a < e ? 0 > l ? c(!1, u) : (f = f(e - h), r._m2(r.currSlideId - f, v(Math.abs(r._p - (-r
                            ._u - r._d1 + f) * r._w) / u), !1, !0, !0)) : h - a > e ? 0 < l ? c(!1, u) : (f = f(h - e),
                            r._m2(r.currSlideId + f, v(Math.abs(r._p - (-r._u - r._d1 - f) * r._w) / u), !1, !0, !0)) :
                            c(!1, u)
                    }
                }
        },
        _p3: function (n) {
            n = this._p = n;
            this._e ? this._p1.css(this._x1, this._y1 + (this._h ? n + this._z1 + 0 : 0 + this._z1 + n) + this._a2) :
                this._p1.css(this._h ? this._x1 : this._w1, n)
        },
        updateSliderSize: function (n) {
            var t, i, r, u;
            if (this.slider) {
                if (this.st.autoScaleSlider ? (r = this.st.autoScaleSliderWidth, u = this.st.autoScaleSliderHeight,
                    this.st.autoScaleHeight ? (t = this.slider.width(), t != this.width && (this.slider.css("height", u /
                    r * t), t = this.slider.width()), i = this.slider.height()) : (i = this.slider.height(), i != this.height &&
                    (this.slider.css("width", r / u * i), i = this.slider.height()), t = this.slider.width())) : (t =
                    this.slider.width(), i = this.slider.height()), n || t != this.width || i != this.height) {
                    for (this.width = t, this.height = i, this._b4 = t, this._c4 = i, this.ev.trigger("rsBeforeSizeSet"),
                        this.ev.trigger("rsAfterSizePropSet"), this._e1.css({
                        width: this._b4,
                        height: this._c4
                    }), this._w = (this._h ? this._b4 : this._c4) + this.st.slidesSpacing, this._d4 = this.st.imageScalePadding,
                        t = 0; t < this.slides.length; t++) n = this.slides[t], n.positionSet = !1, n && n.images && n.isLoaded &&
                            (n.isRendered = !1, this._q2(n));
                    if (this._e4) for (t = 0; t < this._e4.length; t++) n = this._e4[t], n.holder.css(this._i, (n.id +
                                this._d1) * this._w);
                    this._n2();
                    this._l && (this._e && this._p1.css(this._g + "transition-duration", "0s"), this._p3((-this._u -
                        this._d1) * this._w));
                    this.ev.trigger("rsOnUpdateNav")
                }
                this._j2 = this._e1.offset();
                this._j2 = this._j2[this._i]
            }
        },
        appendSlide: function (t, i) {
            var r = this._s(t);
            (isNaN(i) || i > this.numSlides) && (i = this.numSlides);
            this.slides.splice(i, 0, r);
            this.slidesJQ.splice(i, 0, n('<div style="' + (this._l ? "position:absolute;" : this._n) +
                '" class="rsSlide"><\/div>'));
            i <= this.currSlideId && this.currSlideId++;
            this.ev.trigger("rsOnAppendSlide", [r, i]);
            this._f4(i);
            i === this.currSlideId && this.ev.trigger("rsAfterSlideChange")
        },
        removeSlide: function (n) {
            var t = this.slides[n];
            t && (t.holder && t.holder.remove(), n < this.currSlideId && this.currSlideId--, this.slides.splice(n, 1),
                this.slidesJQ.splice(n, 1), this.ev.trigger("rsOnRemoveSlide", [n]), this._f4(n), n === this.currSlideId &&
                this.ev.trigger("rsAfterSlideChange"))
        },
        _f4: function (n) {
            var t = this;
            for (n = t.numSlides, n = 0 >= t._u ? 0 : Math.floor(t._u / n), t.numSlides = t.slides.length, 0 === t.numSlides ?
                (t.currSlideId = t._d1 = t._u = 0, t.currSlide = t._g4 = null) : t._u = n * t.numSlides + t.currSlideId,
                n = 0; n < t.numSlides; n++) t.slides[n].id = n;
            t.currSlide = t.slides[t.currSlideId];
            t._r1 = t.slidesJQ[t.currSlideId];
            t.currSlideId >= t.numSlides ? t.goTo(t.numSlides - 1) : 0 > t.currSlideId && t.goTo(0);
            t._t();
            t._l && t._p1.css(t._g + t._u1, "0ms");
            t._h4 && clearTimeout(t._h4);
            t._h4 = setTimeout(function () {
                t._l && t._p3((-t._u - t._d1) * t._w);
                t._n2();
                t._l || t._r1.css({
                    display: "block",
                    opacity: 1
                })
            }, 14);
            t.ev.trigger("rsOnUpdateNav")
        },
        _i1: function () {
            this._f1 && this._l && (this._g1 ? this._e1.css("cursor", this._g1) : (this._e1.removeClass(
                "grabbing-cursor"), this._e1.addClass("grab-cursor")))
        },
        _w2: function () {
            this._f1 && this._l && (this._h1 ? this._e1.css("cursor", this._h1) : (this._e1.removeClass("grab-cursor"),
                this._e1.addClass("grabbing-cursor")))
        },
        next: function (n) {
            this._m2("next", this.st.transitionSpeed, !0, !n)
        },
        prev: function (n) {
            this._m2("prev", this.st.transitionSpeed, !0, !n)
        },
        _m2: function (n, t, i, r, u) {
            var f = this,
                l, s, e, a, o, c;
            if (f.ev.trigger("rsBeforeMove", [n, r]), e = "next" === n ? f.currSlideId + 1 : "prev" === n ? f.currSlideId -
                1 : n = parseInt(n, 10), !f._z) {
                if (0 > e) {
                    f._i4("left", !r);
                    return
                }
                if (e >= f.numSlides) {
                    f._i4("right", !r);
                    return
                }
            }
            f._r2 && (f._u2(!0), i = !1);
            s = e - f.currSlideId;
            e = f._o2 = f.currSlideId;
            o = f.currSlideId + s;
            r = f._u;
            f._z ? (o = f._n2(!1, o), r += s) : r = o;
            f._o = o;
            f._g4 = f.slidesJQ[f.currSlideId];
            f._u = r;
            f.currSlideId = f._o;
            f.currSlide = f.slides[f.currSlideId];
            f._r1 = f.slidesJQ[f.currSlideId];
            o = f.st.slidesDiff;
            c = Boolean(0 < s);
            s = Math.abs(s);
            var h = Math.floor(e / f._y),
                v = Math.floor((e + (c ? o : -o)) / f._y),
                h = (c ? Math.max(h, v) : Math.min(h, v)) * f._y + (c ? f._y - 1 : 0);
            if (h > f.numSlides - 1 ? h = f.numSlides - 1 : 0 > h && (h = 0), e = c ? h - e : e - h, e > f._y && (e = f
                ._y), s > e + o) for (f._d1 += (s - (e + o)) * (c ? -1 : 1), t *= 1.4, e = 0; e < f.numSlides; e++) f.slides[
                        e].positionSet = !1;
            f._c = t;
            f._n2(!0);
            u || (a = !0);
            l = (-r - f._d1) * f._w;
            a ? setTimeout(function () {
                f._j4 = !1;
                f._x3(l, n, !1, i);
                f.ev.trigger("rsOnUpdateNav")
            }, 0) : (f._x3(l, n, !1, i), f.ev.trigger("rsOnUpdateNav"))
        },
        _f2: function () {
            this.st.arrowsNav && (1 >= this.numSlides ? (this._c2.css("display", "none"), this._d2.css("display",
                "none")) : (this._c2.css("display", "block"), this._d2.css("display", "block"), this._z || this.st.loopRewind ||
                (0 === this.currSlideId ? this._c2.addClass("rsArrowDisabled") : this._c2.removeClass("rsArrowDisabled"),
                this.currSlideId === this.numSlides - 1 ? this._d2.addClass("rsArrowDisabled") : this._d2.removeClass(
                "rsArrowDisabled"))))
        },
        _x3: function (t, i, r, u, f) {
            function c() {
                var n;
                o && (n = o.data("rsTimeout")) && (o !== s && o.css({
                    opacity: 0,
                    display: "none",
                    zIndex: 0
                }), clearTimeout(n), o.data("rsTimeout", ""));
                (n = s.data("rsTimeout")) && (clearTimeout(n), s.data("rsTimeout", ""))
            }
            var e = this,
                o, s, h = {};
            isNaN(e._c) && (e._c = 400);
            e._p = e._h3 = t;
            e.ev.trigger("rsBeforeAnimStart");
            e._e ? e._l ? (e._c = parseInt(e._c, 10), r = e._g + e._v1, h[e._g + e._u1] = e._c + "ms", h[r] = u ? n.rsCSS3Easing[
                e.st.easeInOut] : n.rsCSS3Easing[e.st.easeOut], e._p1.css(h), u || !e.hasTouch ? setTimeout(function () {
                e._p3(t)
            }, 5) : e._p3(t)) : (e._c = e.st.transitionSpeed, o = e._g4, s = e._r1, s.data("rsTimeout") && s.css(
                "opacity", 0), c(), o && o.data("rsTimeout", setTimeout(function () {
                h[e._g + e._u1] = "0ms";
                h.zIndex = 0;
                h.display = "none";
                o.data("rsTimeout", "");
                o.css(h);
                setTimeout(function () {
                    o.css("opacity", 0)
                }, 16)
            }, e._c + 60)), h.display = "block", h.zIndex = e._m, h.opacity = 0, h[e._g + e._u1] = "0ms", h[e._g + e._v1] =
                n.rsCSS3Easing[e.st.easeInOut], s.css(h), s.data("rsTimeout", setTimeout(function () {
                s.css(e._g + e._u1, e._c + "ms");
                s.data("rsTimeout", setTimeout(function () {
                    s.css("opacity", 1);
                    s.data("rsTimeout", "")
                }, 20))
            }, 20))) : e._l ? (h[e._h ? e._x1 : e._w1] = t + "px", e._p1.animate(h, e._c, u ? e.st.easeInOut : e.st.easeOut)) :
                (o = e._g4, s = e._r1, s.stop(!0, !0).css({
                opacity: 0,
                display: "block",
                zIndex: e._m
            }), e._c = e.st.transitionSpeed, s.animate({
                opacity: 1
            }, e._c, e.st.easeInOut), c(), o && o.data("rsTimeout", setTimeout(function () {
                o.stop(!0, !0).css({
                    opacity: 0,
                    display: "none",
                    zIndex: 0
                })
            }, e._c + 60)));
            e._r2 = !0;
            e.loadingTimeout && clearTimeout(e.loadingTimeout);
            e.loadingTimeout = f ? setTimeout(function () {
                e.loadingTimeout = null;
                f.call()
            }, e._c + 60) : setTimeout(function () {
                e.loadingTimeout = null;
                e._k4(i)
            }, e._c + 60)
        },
        _u2: function (n) {
            if (this._r2 = !1, clearTimeout(this.loadingTimeout), this._l) if (this._e) {
                    if (!n) {
                        n = this._p;
                        var t = this._h3 = this._l4();
                        this._p1.css(this._g + this._u1, "0ms");
                        n !== t && this._p3(t)
                    }
                } else this._p1.stop(!0), this._p = parseInt(this._p1.css(this._x1), 10);
                else 20 < this._m ? this._m = 10 : this._m++
        },
        _l4: function () {
            var n = window.getComputedStyle(this._p1.get(0), null).getPropertyValue(this._g + "transform").replace(
                /^matrix\(/i, "").split(/, |\)$/g),
                t = 0 === n[0].indexOf("matrix3d");
            return parseInt(n[this._h ? t ? 12 : 4 : t ? 13 : 5], 10)
        },
        _m4: function (n, t) {
            return this._e ? this._y1 + (t ? n + this._z1 + 0 : 0 + this._z1 + n) + this._a2 : n
        },
        _k4: function () {
            this._l || (this._r1.css("z-index", 0), this._m = 10);
            this._r2 = !1;
            this.staticSlideId = this.currSlideId;
            this._n2();
            this._n4 = !1;
            this.ev.trigger("rsAfterSlideChange")
        },
        _i4: function (n, t) {
            var i = this,
                r = (-i._u - i._d1) * i._w,
                u;
            0 === i.numSlides || i._r2 || (i.st.loopRewind ? i.goTo("left" === n ? i.numSlides - 1 : 0, t) : i._l && (i
                ._c = 200, u = function () {
                i._r2 = !1
            }, i._x3(r + ("left" === n ? 30 : -30), "", !1, !0, function () {
                i._r2 = !1;
                i._x3(r, "", !1, !0, u)
            })))
        },
        _q2: function (n) {
            var e, o, c, u, h, s;
            if (!n.isRendered) {
                var f = n.content,
                    t = "rsMainSlideImage",
                    l, a = this.st.imageAlignCenter,
                    i = this.st.imageScaleMode,
                    r;
                n.videoURL && (t = "rsVideoContainer", "fill" !== i ? l = !0 : (r = f, r.hasClass(t) || (r = r.find("." +
                    t)), r.css({
                    width: "100%",
                    height: "100%"
                }), t = "rsMainSlideImage"));
                f.hasClass(t) || (f = f.find("." + t));
                f && (e = n.iW, o = n.iH, n.isRendered = !0, ("none" !== i || a) && (t = "fill" !== i ? this._d4 : 0, r =
                    this._b4 - 2 * t, c = this._c4 - 2 * t, s = {}, "fit-if-smaller" === i && (e > r || o > c) && (i =
                    "fit"), ("fill" === i || "fit" === i) && (u = r / e, h = c / o, u = "fill" == i ? u > h ? u : h :
                    "fit" == i ? u < h ? u : h : 1, e = Math.ceil(e * u, 10), o = Math.ceil(o * u, 10)), "none" !== i &&
                    (s.width = e, s.height = o, l && f.find(".rsImg").css({
                    width: "100%",
                    height: "100%"
                })), a && (s.marginLeft = Math.floor((r - e) / 2) + t, s.marginTop = Math.floor((c - o) / 2) + t), f.css(
                    s)))
            }
        }
    };
    n.rsProto = t.prototype;
    n.fn.royalSlider = function (i) {
        var r = arguments;
        return this.each(function () {
            var u = n(this);
            if ("object" != typeof i && i) {
                if ((u = u.data("royalSlider")) && u[i]) return u[i].apply(u, Array.prototype.slice.call(r, 1))
            } else u.data("royalSlider") || u.data("royalSlider", new t(u, i))
        })
    };
    n.fn.royalSlider.defaults = {
        slidesSpacing: 8,
        startSlideId: 0,
        loop: !1,
        loopRewind: !1,
        numImagesToPreload: 4,
        fadeinLoadedSlide: !0,
        slidesOrientation: "horizontal",
        transitionType: "move",
        transitionSpeed: 600,
        controlNavigation: "bullets",
        controlsInside: !0,
        arrowsNav: !0,
        arrowsNavAutoHide: !0,
        navigateByClick: !0,
        randomizeSlides: !1,
        sliderDrag: !0,
        sliderTouch: !0,
        keyboardNavEnabled: !1,
        fadeInAfterLoaded: !0,
        allowCSS3: !0,
        allowCSS3OnWebkit: !0,
        addActiveClass: !1,
        autoHeight: !1,
        easeOut: "easeOutSine",
        easeInOut: "easeInOutSine",
        minSlideOffset: 10,
        imageScaleMode: "fit-if-smaller",
        imageAlignCenter: !0,
        imageScalePadding: 4,
        usePreloader: !0,
        autoScaleSlider: !1,
        autoScaleSliderWidth: 800,
        autoScaleSliderHeight: 400,
        autoScaleHeight: !0,
        arrowsNavHideOnTouch: !1,
        globalCaption: !1,
        slidesDiff: 2
    };
    n.rsCSS3Easing = {
        easeOutSine: "cubic-bezier(0.390, 0.575, 0.565, 1.000)",
        easeInOutSine: "cubic-bezier(0.445, 0.050, 0.550, 0.950)"
    };
    n.extend(jQuery.easing, {
        easeInOutSine: function (n, t, i, r, u) {
            return -r / 2 * (Math.cos(Math.PI * t / u) - 1) + i
        },
        easeOutSine: function (n, t, i, r, u) {
            return r * Math.sin(t / u * (Math.PI / 2)) + i
        },
        easeOutCubic: function (n, t, i, r, u) {
            return r * ((t = t / u - 1) * t * t + 1) + i
        }
    })
})(jQuery, window),
function (n) {
    n.rsProto._o4 = function () {
        var t, n = this;
        if (n.st.addActiveClass) n.ev.on("rsOnUpdateNav", function () {
                t && clearTimeout(t);
                t = setTimeout(function () {
                    n._g4 && n._g4.removeClass("rsActiveSlide");
                    n._r1 && n._r1.addClass("rsActiveSlide");
                    t = null
                }, 50)
            })
    };
    n.rsModules.activeClass = n.rsProto._o4
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _p4: function () {
            function r() {
                var n = t.currSlide,
                    r;
                if (t.currSlide && t.currSlide.isLoaded && t._t4 !== n) {
                    if (0 < t._s4.length) {
                        for (i = 0; i < t._s4.length; i++) clearTimeout(t._s4[i]);
                        t._s4 = []
                    }
                    if (0 < t._r4.length) {
                        for (i = 0; i < t._r4.length; i++)(r = t._r4[i]) && (t._e ? (r.block.css(t._g + t._u1, "0s"), r
                                .block.css(r.css)) : r.block.stop(!0).css(r.css), t._t4 = null, n.animBlocksDisplayed = !
                                1);
                        t._r4 = []
                    }
                    n.animBlocks && (n.animBlocksDisplayed = !0, t._t4 = n, t._u4(n.animBlocks))
                }
            }
            var t = this,
                i;
            t._q4 = {
                fadeEffect: !0,
                moveEffect: "top",
                moveOffset: 20,
                speed: 400,
                easing: "easeOutSine",
                delay: 200
            };
            t.st.block = n.extend({}, t._q4, t.st.block);
            t._r4 = [];
            t._s4 = [];
            t.ev.on("rsAfterInit", function () {
                r()
            });
            t.ev.on("rsBeforeParseNode", function (t, i, r) {
                i = n(i);
                r.animBlocks = i.find(".rsABlock").css("display", "none");
                r.animBlocks.length || (r.animBlocks = i.hasClass("rsABlock") ? i.css("display", "none") : !1)
            });
            t.ev.on("rsAfterContentSet", function (n, i) {
                i.id === t.slides[t.currSlideId].id && setTimeout(function () {
                    r()
                }, t.st.fadeinLoadedSlide ? 300 : 0)
            });
            t.ev.on("rsAfterSlideChange", function () {
                r()
            })
        },
        _v4: function (n, t) {
            setTimeout(function () {
                n.css(t)
            }, 6)
        },
        _u4: function (t) {
            var i = this,
                f, o, s, u, e, r, h;
            i._s4 = [];
            t.each(function (t) {
                var c, a, l;
                f = n(this);
                o = {};
                s = {};
                u = null;
                c = f.attr("data-move-offset");
                c = c ? parseInt(c, 10) : i.st.block.moveOffset;
                0 < c && ((r = f.data("move-effect")) ? (r = r.toLowerCase(), "none" === r ? r = !1 : "left" !== r &&
                    "top" !== r && "bottom" !== r && "right" !== r && (r = i.st.block.moveEffect, "none" === r && (r = !
                    1))) : r = i.st.block.moveEffect, r && "none" !== r) && (a = "right" === r || "left" === r ? !0 : !
                    1, h = !1, i._e ? (l = 0, e = i._x1) : (a ? isNaN(parseInt(f.css("right"), 10)) ? e = "left" : (e =
                    "right", h = !0) : isNaN(parseInt(f.css("bottom"), 10)) ? e = "top" : (e = "bottom", h = !0), e =
                    "margin-" + e, h && (c = -c), i._e ? l = parseInt(f.css(e), 10) : (l = f.data("rs-start-move-prop"),
                    void 0 === l && (l = parseInt(f.css(e), 10), isNaN(l) && (l = 0), f.data("rs-start-move-prop", l)))),
                    s[e] = i._m4("top" === r || "left" === r ? l - c : l + c, a), o[e] = i._m4(l, a));
                c = f.attr("data-fade-effect");
                c ? ("none" === c.toLowerCase() || "false" === c.toLowerCase()) && (c = !1) : c = i.st.block.fadeEffect;
                c && (s.opacity = 0, o.opacity = 1);
                (c || r) && (u = {}, u.hasFade = Boolean(c), Boolean(r) && (u.moveProp = e, u.hasMove = !0), u.speed =
                    f.data("speed"), isNaN(u.speed) && (u.speed = i.st.block.speed), u.easing = f.data("easing"), u.easing ||
                    (u.easing = i.st.block.easing), u.css3Easing = n.rsCSS3Easing[u.easing], u.delay = f.data("delay"),
                    isNaN(u.delay) && (u.delay = i.st.block.delay * t));
                c = {};
                i._e && (c[i._g + i._u1] = "0ms");
                c.moveProp = o.moveProp;
                c.opacity = o.opacity;
                c.display = "none";
                i._r4.push({
                    block: f,
                    css: c
                });
                i._v4(f, s);
                i._s4.push(setTimeout(function (n, t, r, u) {
                    return function () {
                        var f, e;
                        n.css("display", "block");
                        r && (f = {}, i._e ? (e = "", r.hasMove && (e += r.moveProp), r.hasFade && (r.hasMove && (e +=
                            ", "), e += "opacity"), f[i._g + i._t1] = e, f[i._g + i._u1] = r.speed + "ms", f[i._g + i._v1] =
                            r.css3Easing, n.css(f), setTimeout(function () {
                            n.css(t)
                        }, 24)) : setTimeout(function () {
                            n.animate(t, r.speed, r.easing)
                        }, 16));
                        delete i._s4[u]
                    }
                }(f, o, u, t), 6 >= u.delay ? 12 : u.delay))
            })
        }
    });
    n.rsModules.animatedBlocks = n.rsProto._p4
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _w4: function () {
            var n = this,
                f, t, r, u, i;
            if (n.st.autoHeight) {
                u = !0;
                i = function (i) {
                    r = n.slides[n.currSlideId];
                    (f = r.holder) && (t = f.height()) && void 0 !== t && t > (n.st.minAutoHeight || 30) && (n._c4 = t,
                        n._e || !i ? n._e1.css("height", t) : n._e1.stop(!0, !0).animate({
                        height: t
                    }, n.st.transitionSpeed), n.ev.trigger("rsAutoHeightChange", t), u && (n._e && setTimeout(function () {
                        n._e1.css(n._g + "transition", "height " + n.st.transitionSpeed + "ms ease-in-out")
                    }, 16), u = !1))
                };
                n.ev.on("rsMaybeSizeReady.rsAutoHeight", function (n, t) {
                    r === t && i()
                });
                n.ev.on("rsAfterContentSet.rsAutoHeight", function (n, t) {
                    r === t && i()
                });
                n.slider.addClass("rsAutoHeight");
                n.ev.one("rsAfterInit", function () {
                    setTimeout(function () {
                        i(!1);
                        setTimeout(function () {
                            n.slider.append('<div style="clear:both; float: none;"><\/div>')
                        }, 16)
                    }, 16)
                });
                n.ev.on("rsBeforeAnimStart", function () {
                    i(!0)
                });
                n.ev.on("rsBeforeSizeSet", function () {
                    setTimeout(function () {
                        i(!1)
                    }, 16)
                })
            }
        }
    });
    n.rsModules.autoHeight = n.rsProto._w4
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _x4: function () {
            var t = this,
                i;
            t._y4 = {
                enabled: !1,
                stopAtAction: !0,
                pauseOnHover: !0,
                delay: 2e3
            };
            !t.st.autoPlay && t.st.autoplay && (t.st.autoPlay = t.st.autoplay);
            t.st.autoPlay = n.extend({}, t._y4, t.st.autoPlay);
            t.st.autoPlay.enabled && (t.ev.on("rsBeforeParseNode", function (t, r, u) {
                r = n(r);
                (i = r.attr("data-rsDelay")) && (u.customDelay = parseInt(i, 10))
            }), t.ev.one("rsAfterInit", function () {
                t._z4()
            }), t.ev.on("rsBeforeDestroy", function () {
                t.stopAutoPlay();
                t.slider.off("mouseenter mouseleave");
                n(window).off("blur" + t.ns + " focus" + t.ns)
            }))
        },
        _z4: function () {
            var t = this;
            t.startAutoPlay();
            t.ev.on("rsAfterContentSet", function (n, i) {
                t._l2 || t._r2 || !t._a5 || i !== t.currSlide || t._b5()
            });
            t.ev.on("rsDragRelease", function () {
                t._a5 && t._c5 && (t._c5 = !1, t._b5())
            });
            t.ev.on("rsAfterSlideChange", function () {
                t._a5 && t._c5 && (t._c5 = !1, t.currSlide.isLoaded && t._b5())
            });
            t.ev.on("rsDragStart", function () {
                t._a5 && (t.st.autoPlay.stopAtAction ? t.stopAutoPlay() : (t._c5 = !0, t._d5()))
            });
            t.ev.on("rsBeforeMove", function (n, i, r) {
                t._a5 && (r && t.st.autoPlay.stopAtAction ? t.stopAutoPlay() : (t._c5 = !0, t._d5()))
            });
            t._e5 = !1;
            t.ev.on("rsVideoStop", function () {
                t._a5 && (t._e5 = !1, t._b5())
            });
            t.ev.on("rsVideoPlay", function () {
                t._a5 && (t._c5 = !1, t._d5(), t._e5 = !0)
            });
            n(window).on("blur" + t.ns, function () {
                t._a5 && (t._c5 = !0, t._d5())
            }).on("focus" + t.ns, function () {
                t._a5 && t._c5 && (t._c5 = !1, t._b5())
            });
            t.st.autoPlay.pauseOnHover && (t._f5 = !1, t.slider.hover(function () {
                t._a5 && (t._c5 = !1, t._d5(), t._f5 = !0)
            }, function () {
                t._a5 && (t._f5 = !1, t._b5())
            }))
        },
        toggleAutoPlay: function () {
            this._a5 ? this.stopAutoPlay() : this.startAutoPlay()
        },
        startAutoPlay: function () {
            this._a5 = !0;
            this.currSlide.isLoaded && this._b5()
        },
        stopAutoPlay: function () {
            this._e5 = this._f5 = this._c5 = this._a5 = !1;
            this._d5()
        },
        _b5: function () {
            var n = this;
            n._f5 || n._e5 || (n._g5 = !0, n._h5 && clearTimeout(n._h5), n._h5 = setTimeout(function () {
                var t;
                n._z || n.st.loopRewind || (t = !0, n.st.loopRewind = !0);
                n.next(!0);
                t && (n.st.loopRewind = !1)
            }, n.currSlide.customDelay ? n.currSlide.customDelay : n.st.autoPlay.delay))
        },
        _d5: function () {
            this._f5 || this._e5 || (this._g5 = !1, this._h5 && (clearTimeout(this._h5), this._h5 = null))
        }
    });
    n.rsModules.autoplay = n.rsProto._x4
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _i5: function () {
            var t = this;
            "bullets" === t.st.controlNavigation && (t.ev.one("rsAfterPropsSetup", function () {
                t._j5 = !0;
                t.slider.addClass("rsWithBullets");
                for (var i = '<div class="rsNav rsBullets">', r = 0; r < t.numSlides; r++) i +=
                        '<div class="rsNavItem rsBullet"><span><\/span><\/div>';
                t._k5 = i = n(i + "<\/div>");
                t._l5 = i.appendTo(t.slider).children();
                t._k5.on("click.rs", ".rsNavItem", function () {
                    t._m5 || t.goTo(n(this).index())
                })
            }), t.ev.on("rsOnAppendSlide", function (n, i, r) {
                r >= t.numSlides ? t._k5.append('<div class="rsNavItem rsBullet"><span><\/span><\/div>') : t._l5.eq(r).before(
                    '<div class="rsNavItem rsBullet"><span><\/span><\/div>');
                t._l5 = t._k5.children()
            }), t.ev.on("rsOnRemoveSlide", function (n, i) {
                var r = t._l5.eq(i);
                r && r.length && (r.remove(), t._l5 = t._k5.children())
            }), t.ev.on("rsOnUpdateNav", function () {
                var n = t.currSlideId;
                t._n5 && t._n5.removeClass("rsNavSelected");
                n = t._l5.eq(n);
                n.addClass("rsNavSelected");
                t._n5 = n
            }))
        }
    });
    n.rsModules.bullets = n.rsProto._i5
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _o5: function () {
            var t = this,
                u, i, r;
            if (t._p5 = {
                enabled: !1,
                change: !1,
                prefix: ""
            }, t.st.deeplinking = n.extend({}, t._p5, t.st.deeplinking), t.st.deeplinking.enabled) {
                var f = t.st.deeplinking.change,
                    e = t.st.deeplinking.prefix,
                    o = "#" + e,
                    s = function () {
                        var n = window.location.hash;
                        return n && 0 < n.indexOf(e) && (n = parseInt(n.substring(o.length), 10), 0 <= n) ? n - 1 : -1
                    }, h = s(); - 1 !== h && (t.st.startSlideId = h);
                f && (n(window).on("hashchange" + t.ns, function (n) {
                    u || (n = s(), 0 > n || (n > t.numSlides - 1 && (n = t.numSlides - 1), t.goTo(n)))
                }), t.ev.on("rsBeforeAnimStart", function () {
                    i && clearTimeout(i);
                    r && clearTimeout(r)
                }), t.ev.on("rsAfterSlideChange", function () {
                    i && clearTimeout(i);
                    r && clearTimeout(r);
                    r = setTimeout(function () {
                        u = !0;
                        window.location.replace(("" + window.location).split("#")[0] + o + (t.currSlideId + 1));
                        i = setTimeout(function () {
                            u = !1;
                            i = null
                        }, 60)
                    }, 400)
                }));
                t.ev.on("rsBeforeDestroy", function () {
                    i = r = null;
                    f && n(window).off("hashchange" + t.ns)
                })
            }
        }
    });
    n.rsModules.deeplinking = n.rsProto._o5
}(jQuery),
function (n, t, i) {
    function u(n) {
        return n = n || location.href, "#" + n.replace(/^[^#]*#?(.*)$/, "$1")
    }
    var r = "hashchange",
        f = document,
        e, s = n.event.special,
        h = f.documentMode,
        o = "on" + r in t && (h === i || 7 < h);
    n.fn[r] = function (n) {
        return n ? this.bind(r, n) : this.trigger(r)
    };
    n.fn[r].delay = 50;
    s[r] = n.extend(s[r], {
        setup: function () {
            if (o) return !1;
            n(e.start)
        },
        teardown: function () {
            if (o) return !1;
            n(e.stop)
        }
    });
    e = function () {
        function c() {
            var f = u(),
                i = v(h);
            f !== h ? (a(h = f, i), n(t).trigger(r)) : i !== h && (location.href = location.href.replace(/#.*/, "") + i);
            s = setTimeout(c, n.fn[r].delay)
        }
        var e = {}, s, h = u(),
            l = function (n) {
                return n
            }, a = l,
            v = l;
        return e.start = function () {
            s || c()
        }, e.stop = function () {
            s && clearTimeout(s);
            s = i
        }, !t.attachEvent || t.addEventListener || o || function () {
            var t, i;
            e.start = function () {
                t || (i = (i = n.fn[r].src) && i + u(), t = n('<iframe tabindex="-1" title="empty"/>').hide().one(
                    "load", function () {
                    i || a(u());
                    c()
                }).attr("src", i || "javascript:0").insertAfter("body")[0].contentWindow, f.onpropertychange = function () {
                    try {
                        "title" === event.propertyName && (t.document.title = f.title)
                    } catch (n) {}
                })
            };
            e.stop = l;
            v = function () {
                return u(t.location.href)
            };
            a = function (i, u) {
                var e = t.document,
                    o = n.fn[r].domain;
                i !== u && (e.title = f.title, e.open(), o && e.write('<script>document.domain="' + o + '"<\/script>'),
                    e.close(), t.location.hash = i)
            }
        }(), e
    }()
}(jQuery, this),
function (n) {
    n.extend(n.rsProto, {
        _q5: function () {
            var t = this;
            if (t._r5 = {
                enabled: !1,
                keyboardNav: !0,
                buttonFS: !0,
                nativeFS: !1,
                doubleTap: !0
            }, t.st.fullscreen = n.extend({}, t._r5, t.st.fullscreen), t.st.fullscreen.enabled) t.ev.one(
                    "rsBeforeSizeSet", function () {
                    t._s5()
                })
        },
        _s5: function () {
            var t = this,
                i, u, r, f;
            if (t._t5 = !t.st.keyboardNavEnabled && t.st.fullscreen.keyboardNav, t.st.fullscreen.nativeFS) {
                if (i = {
                    supportsFullScreen: !1,
                    isFullScreen: function () {
                        return !1
                    },
                    requestFullScreen: function () {},
                    cancelFullScreen: function () {},
                    fullScreenEventName: "",
                    prefix: ""
                }, u = ["webkit", "moz", "o", "ms", "khtml"], "undefined" != typeof document.cancelFullScreen) i.supportsFullScreen = !
                        0;
                else for (r = 0, f = u.length; r < f; r++) if (i.prefix = u[r], "undefined" != typeof document[i.prefix +
                            "CancelFullScreen"]) {
                            i.supportsFullScreen = !0;
                            break
                        } i.supportsFullScreen ? (t.nativeFS = !0, i.fullScreenEventName = i.prefix +
                    "fullscreenchange" + t.ns, i.isFullScreen = function () {
                    switch (this.prefix) {
                    case "":
                        return document.fullScreen;
                    case "webkit":
                        return document.webkitIsFullScreen;
                    default:
                        return document[this.prefix + "FullScreen"]
                    }
                }, i.requestFullScreen = function (n) {
                    return "" === this.prefix ? n.requestFullScreen() : n[this.prefix + "RequestFullScreen"]()
                }, i.cancelFullScreen = function () {
                    return "" === this.prefix ? document.cancelFullScreen() : document[this.prefix + "CancelFullScreen"]()
                }, t._u5 = i) : t._u5 = !1
            }
            t.st.fullscreen.buttonFS && (t._v5 = n(
                '<div class="rsFullscreenBtn"><div class="rsFullscreenIcn"><\/div><\/div>').appendTo(t._o1).on(
                "click.rs", function () {
                t.isFullscreen ? t.exitFullscreen() : t.enterFullscreen()
            }))
        },
        enterFullscreen: function (t) {
            var i = this,
                r;
            if (i._u5) if (t) i._u5.requestFullScreen(n("html")[0]);
                else {
                    i._b.on(i._u5.fullScreenEventName, function () {
                        i._u5.isFullScreen() ? i.enterFullscreen(!0) : i.exitFullscreen(!0)
                    });
                    i._u5.requestFullScreen(n("html")[0]);
                    return
                }
            if (!i._w5) {
                i._w5 = !0;
                i._b.on("keyup" + i.ns + "fullscreen", function (n) {
                    27 === n.keyCode && i.exitFullscreen()
                });
                for (i._t5 && i._b2(), t = n(window), i._x5 = t.scrollTop(), i._y5 = t.scrollLeft(), i._z5 = n("html").attr(
                    "style"), i._a6 = n("body").attr("style"), i._b6 = i.slider.attr("style"), n("body, html").css({
                    overflow: "hidden",
                    height: "100%",
                    width: "100%",
                    margin: "0",
                    padding: "0"
                }), i.slider.addClass("rsFullscreen"), r = 0; r < i.numSlides; r++) t = i.slides[r], t.isRendered = !1,
                        t.bigImage && (t.isBig = !0, t.isMedLoaded = t.isLoaded, t.isMedLoading = t.isLoading, t.medImage =
                        t.image, t.medIW = t.iW, t.medIH = t.iH, t.slideId = -99, t.bigImage !== t.medImage && (t.sizeType =
                        "big"), t.isLoaded = t.isBigLoaded, t.isLoading = !1, t.image = t.bigImage, t.images[0] = t.bigImage,
                        t.iW = t.bigIW, t.iH = t.bigIH, t.isAppended = t.contentAdded = !1, i._c6(t));
                i.isFullscreen = !0;
                i._w5 = !1;
                i.updateSliderSize();
                i.ev.trigger("rsEnterFullscreen")
            }
        },
        exitFullscreen: function (t) {
            var i = this,
                r;
            if (i._u5) {
                if (!t) {
                    i._u5.cancelFullScreen(n("html")[0]);
                    return
                }
                i._b.off(i._u5.fullScreenEventName)
            }
            if (!i._w5) {
                for (i._w5 = !0, i._b.off("keyup" + i.ns + "fullscreen"), i._t5 && i._b.off("keydown" + i.ns), n("html")
                    .attr("style", i._z5 || ""), n("body").attr("style", i._a6 || ""), r = 0; r < i.numSlides; r++) t =
                        i.slides[r], t.isRendered = !1, t.bigImage && (t.isBig = !1, t.slideId = -99, t.isBigLoaded = t
                        .isLoaded, t.isBigLoading = t.isLoading, t.bigImage = t.image, t.bigIW = t.iW, t.bigIH = t.iH,
                        t.isLoaded = t.isMedLoaded, t.isLoading = !1, t.image = t.medImage, t.images[0] = t.medImage, t
                        .iW = t.medIW, t.iH = t.medIH, t.isAppended = t.contentAdded = !1, i._c6(t, !0), t.bigImage !==
                        t.medImage && (t.sizeType = "med"));
                i.isFullscreen = !1;
                t = n(window);
                t.scrollTop(i._x5);
                t.scrollLeft(i._y5);
                i._w5 = !1;
                i.slider.removeClass("rsFullscreen");
                i.updateSliderSize();
                setTimeout(function () {
                    i.updateSliderSize()
                }, 1);
                i.ev.trigger("rsExitFullscreen")
            }
        },
        _c6: function (t) {
            var i = t.isLoaded || t.isLoading ? '<img class="rsImg rsMainSlideImage" src="' + t.image + '"/>' :
                '<a class="rsImg rsMainSlideImage" href="' + t.image + '"><\/a>';
            t.content.hasClass("rsImg") ? t.content = n(i) : t.content.find(".rsImg").eq(0).replaceWith(i);
            t.isLoaded || t.isLoading || !t.holder || t.holder.html(t.content)
        }
    });
    n.rsModules.fullscreen = n.rsProto._q5
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _d6: function () {
            var t = this;
            t.st.globalCaption && (t.ev.on("rsAfterInit", function () {
                t.globalCaption = n('<div class="rsGCaption"><\/div>').appendTo(t.st.globalCaptionInside ? t._e1 : t.slider);
                t.globalCaption.html(t.currSlide.caption)
            }), t.ev.on("rsBeforeAnimStart", function () {
                t.globalCaption.html(t.currSlide.caption)
            }))
        }
    });
    n.rsModules.globalCaption = n.rsProto._d6
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _e6: function () {
            var n = this;
            if (n.st.navAutoHide && !n.hasTouch) n.ev.one("rsAfterInit", function () {
                    if (n._k5) {
                        n._k5.addClass("rsHidden");
                        var t = n.slider;
                        t.one("mousemove.controlnav", function () {
                            n._k5.removeClass("rsHidden")
                        });
                        t.hover(function () {
                            n._k5.removeClass("rsHidden")
                        }, function () {
                            n._k5.addClass("rsHidden")
                        })
                    }
                })
        }
    });
    n.rsModules.autoHideNav = n.rsProto._e6
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _f6: function () {
            var t = this;
            "tabs" === t.st.controlNavigation && (t.ev.on("rsBeforeParseNode", function (t, i, r) {
                i = n(i);
                r.thumbnail = i.find(".rsTmb").remove();
                r.thumbnail.length ? r.thumbnail = n(document.createElement("div")).append(r.thumbnail).html() : (r.thumbnail =
                    i.attr("data-rsTmb"), r.thumbnail || (r.thumbnail = i.find(".rsImg").attr("data-rsTmb")), r.thumbnail =
                    r.thumbnail ? '<img src="' + r.thumbnail + '"/>' : "")
            }), t.ev.one("rsAfterPropsSetup", function () {
                t._g6()
            }), t.ev.on("rsOnAppendSlide", function (n, i, r) {
                r >= t.numSlides ? t._k5.append('<div class="rsNavItem rsTab">' + i.thumbnail + "<\/div>") : t._l5.eq(r)
                    .before('<div class="rsNavItem rsTab">' + item.thumbnail + "<\/div>");
                t._l5 = t._k5.children()
            }), t.ev.on("rsOnRemoveSlide", function (n, i) {
                var r = t._l5.eq(i);
                r && (r.remove(), t._l5 = t._k5.children())
            }), t.ev.on("rsOnUpdateNav", function () {
                var n = t.currSlideId;
                t._n5 && t._n5.removeClass("rsNavSelected");
                n = t._l5.eq(n);
                n.addClass("rsNavSelected");
                t._n5 = n
            }))
        },
        _g6: function () {
            var t = this,
                i, r;
            for (t._j5 = !0, i = '<div class="rsNav rsTabs">', r = 0; r < t.numSlides; r++) i +=
                    '<div class="rsNavItem rsTab">' + t.slides[r].thumbnail + "<\/div>";
            i = n(i + "<\/div>");
            t._k5 = i;
            t._l5 = i.children(".rsNavItem");
            t.slider.append(i);
            t._k5.click(function (i) {
                i = n(i.target).closest(".rsNavItem");
                i.length && t.goTo(i.index())
            })
        }
    });
    n.rsModules.tabs = n.rsProto._f6
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _h6: function () {
            var t = this;
            "thumbnails" === t.st.controlNavigation && (t._i6 = {
                drag: !0,
                touch: !0,
                orientation: "horizontal",
                navigation: !0,
                arrows: !0,
                arrowLeft: null,
                arrowRight: null,
                spacing: 4,
                arrowsAutoHide: !1,
                appendSpan: !1,
                transitionSpeed: 600,
                autoCenter: !0,
                fitInViewport: !0,
                firstMargin: !0,
                paddingTop: 0,
                paddingBottom: 0
            }, t.st.thumbs = n.extend({}, t._i6, t.st.thumbs), t._j6 = !0, !1 === t.st.thumbs.firstMargin ? t.st.thumbs
                .firstMargin = 0 : !0 === t.st.thumbs.firstMargin && (t.st.thumbs.firstMargin = t.st.thumbs.spacing), t
                .ev.on("rsBeforeParseNode", function (t, i, r) {
                i = n(i);
                r.thumbnail = i.find(".rsTmb").remove();
                r.thumbnail.length ? r.thumbnail = n(document.createElement("div")).append(r.thumbnail).html() : (r.thumbnail =
                    i.attr("data-rsTmb"), r.thumbnail || (r.thumbnail = i.find(".rsImg").attr("data-rsTmb")), r.thumbnail =
                    r.thumbnail ? '<img src="' + r.thumbnail + '"/>' : "")
            }), t.ev.one("rsAfterPropsSetup", function () {
                t._k6()
            }), t._n5 = null, t.ev.on("rsOnUpdateNav", function () {
                var i = n(t._l5[t.currSlideId]);
                i !== t._n5 && (t._n5 && (t._n5.removeClass("rsNavSelected"), t._n5 = null), t._l6 && t._m6(t.currSlideId),
                    t._n5 = i.addClass("rsNavSelected"))
            }), t.ev.on("rsOnAppendSlide", function (n, i, r) {
                n = "<div" + t._n6 + ' class="rsNavItem rsThumb">' + t._o6 + i.thumbnail + "<\/div>";
                t._e && t._s3.css(t._g + "transition-duration", "0ms");
                r >= t.numSlides ? t._s3.append(n) : t._l5.eq(r).before(n);
                t._l5 = t._s3.children();
                t.updateThumbsSize(!0)
            }), t.ev.on("rsOnRemoveSlide", function (n, i) {
                var r = t._l5.eq(i);
                r && (t._e && t._s3.css(t._g + "transition-duration", "0ms"), r.remove(), t._l5 = t._s3.children(), t.updateThumbsSize(!
                    0))
            }))
        },
        _k6: function () {
            var t = this,
                u = "rsThumbs",
                i = t.st.thumbs,
                r = "",
                f, e, s = i.spacing,
                o;
            for (t._j5 = !0, t._e3 = "vertical" === i.orientation ? !1 : !0, t._n6 = f = s ? ' style="margin-' + (t._e3 ?
                "right" : "bottom") + ":" + s + 'px;"' : "", t._i3 = 0, t._p6 = !1, t._m5 = !1, t._l6 = !1, t._q6 = i.arrows &&
                i.navigation, e = t._e3 ? "Hor" : "Ver", t.slider.addClass("rsWithThumbs rsWithThumbs" + e), r +=
                '<div class="rsNav rsThumbs rsThumbs' + e + '"><div class="' + u + 'Container">', t._o6 = i.appendSpan ?
                '<span class="thumbIco"><\/span>' : "", o = 0; o < t.numSlides; o++) e = t.slides[o], r += "<div" + f +
                    ' class="rsNavItem rsThumb">' + e.thumbnail + t._o6 + "<\/div>";
            r = n(r + "<\/div><\/div>");
            f = {};
            i.paddingTop && (f[t._e3 ? "paddingTop" : "paddingLeft"] = i.paddingTop);
            i.paddingBottom && (f[t._e3 ? "paddingBottom" : "paddingRight"] = i.paddingBottom);
            r.css(f);
            t._s3 = n(r).find("." + u + "Container");
            t._q6 && (u += "Arrow", i.arrowLeft ? t._r6 = i.arrowLeft : (t._r6 = n('<div class="' + u + " " + u +
                'Left"><div class="' + u + 'Icn"><\/div><\/div>'), r.append(t._r6)), i.arrowRight ? t._s6 = i.arrowRight :
                (t._s6 = n('<div class="' + u + " " + u + 'Right"><div class="' + u + 'Icn"><\/div><\/div>'), r.append(
                t._s6)), t._r6.click(function () {
                var n = (Math.floor(t._i3 / t._t6) + t._u6) * t._t6 + t.st.thumbs.firstMargin;
                t._a4(n > t._n3 ? t._n3 : n)
            }), t._s6.click(function () {
                var n = (Math.floor(t._i3 / t._t6) - t._u6) * t._t6 + t.st.thumbs.firstMargin;
                t._a4(n < t._o3 ? t._o3 : n)
            }), i.arrowsAutoHide && !t.hasTouch && (t._r6.css("opacity", 0), t._s6.css("opacity", 0), r.one(
                "mousemove.rsarrowshover", function () {
                t._l6 && (t._r6.css("opacity", 1), t._s6.css("opacity", 1))
            }), r.hover(function () {
                t._l6 && (t._r6.css("opacity", 1), t._s6.css("opacity", 1))
            }, function () {
                t._l6 && (t._r6.css("opacity", 0), t._s6.css("opacity", 0))
            })));
            t._k5 = r;
            t._l5 = t._s3.children();
            t.msEnabled && t.st.thumbs.navigation && t._s3.css("-ms-touch-action", t._e3 ? "pan-y" : "pan-x");
            t.slider.append(r);
            t._w3 = !0;
            t._v6 = s;
            i.navigation && t._e && t._s3.css(t._g + "transition-property", t._g + "transform");
            t._k5.on("click.rs", ".rsNavItem", function () {
                t._m5 || t.goTo(n(this).index())
            });
            t.ev.off("rsBeforeSizeSet.thumbs").on("rsBeforeSizeSet.thumbs", function () {
                t._w6 = t._e3 ? t._c4 : t._b4;
                t.updateThumbsSize(!0)
            });
            t.ev.off("rsAutoHeightChange.thumbs").on("rsAutoHeightChange.thumbs", function (n, i) {
                t.updateThumbsSize(!0, i)
            })
        },
        updateThumbsSize: function (n, t) {
            var i = this,
                r = i._l5.first(),
                u = {}, f = i._l5.length;
            i._t6 = (i._e3 ? r.outerWidth() : r.outerHeight()) + i._v6;
            i._y3 = f * i._t6 - i._v6;
            u[i._e3 ? "width" : "height"] = i._y3 + i._v6;
            i._z3 = i._e3 ? i._k5.width() : void 0 !== t ? t : i._k5.height();
            i._w3 && (i.isFullscreen || i.st.thumbs.fitInViewport) && (i._e3 ? i._c4 = i._w6 - i._k5.outerHeight() : i._b4 =
                i._w6 - i._k5.outerWidth());
            i._z3 && (i._o3 = -(i._y3 - i._z3) - i.st.thumbs.firstMargin, i._n3 = i.st.thumbs.firstMargin, i._u6 = Math
                .floor(i._z3 / i._t6), i._y3 < i._z3 ? (i.st.thumbs.autoCenter && i._q3((i._z3 - i._y3) / 2), i.st.thumbs
                .arrows && i._r6 && (i._r6.addClass("rsThumbsArrowDisabled"), i._s6.addClass("rsThumbsArrowDisabled")),
                i._l6 = !1, i._m5 = !1, i._k5.off(i._j1)) : i.st.thumbs.navigation && !i._l6 && (i._l6 = !0, !i.hasTouch &&
                i.st.thumbs.drag || i.hasTouch && i.st.thumbs.touch) && (i._m5 = !0, i._k5.on(i._j1, function (n) {
                i._g2(n, !0)
            })), i._s3.css(u), n && t && i._m6(i.currSlideId, !0))
        },
        setThumbsOrientation: function (n, t) {
            this._w3 && (this.st.thumbs.orientation = n, this._k5.remove(), this.slider.removeClass(
                "rsWithThumbsHor rsWithThumbsVer"), this._k6(), this._k5.off(this._j1), t || this.updateSliderSize(!0))
        },
        _q3: function (n) {
            this._i3 = n;
            this._e ? this._s3.css(this._x1, this._y1 + (this._e3 ? n + this._z1 + 0 : 0 + this._z1 + n) + this._a2) :
                this._s3.css(this._e3 ? this._x1 : this._w1, n)
        },
        _a4: function (t, i, r, u, f) {
            var e = this,
                o;
            e._l6 && (i || (i = e.st.thumbs.transitionSpeed), e._i3 = t, e._x6 && clearTimeout(e._x6), e._p6 && (e._e ||
                e._s3.stop(), r = !0), o = {}, e._p6 = !0, e._e ? (o[e._g + "transition-duration"] = i + "ms", o[e._g +
                "transition-timing-function"] = r ? n.rsCSS3Easing[e.st.easeOut] : n.rsCSS3Easing[e.st.easeInOut], e._s3
                .css(o), e._q3(t)) : (o[e._e3 ? e._x1 : e._w1] = t + "px", e._s3.animate(o, i, r ? "easeOutCubic" : e.st
                .easeInOut)), u && (e._i3 = u), e._y6(), e._x6 = setTimeout(function () {
                e._p6 = !1;
                f && (e._a4(u, f, !0), f = null)
            }, i))
        },
        _y6: function () {
            this._q6 && (this._i3 === this._n3 ? this._r6.addClass("rsThumbsArrowDisabled") : this._r6.removeClass(
                "rsThumbsArrowDisabled"), this._i3 === this._o3 ? this._s6.addClass("rsThumbsArrowDisabled") : this._s6
                .removeClass("rsThumbsArrowDisabled"))
        },
        _m6: function (n, t) {
            var r = 0,
                i, f = n * this._t6 + 2 * this._t6 - this._v6 + this._n3,
                u = Math.floor(this._i3 / this._t6);
            this._l6 && (this._j6 && (t = !0, this._j6 = !1), f + this._i3 > this._z3 ? (n === this.numSlides - 1 && (r =
                1), u = -n + this._u6 - 2 + r, i = u * this._t6 + this._z3 % this._t6 + this._v6 - this._n3) : 0 !== n ?
                (n - 1) * this._t6 <= -this._i3 + this._n3 && n - 1 <= this.numSlides - this._u6 && (i = (-n + 1) *
                this._t6 + this._n3) : i = this._n3, i !== this._i3 && (r = void 0 === i ? this._i3 : i, r > this._n3 ?
                this._q3(this._n3) : r < this._o3 ? this._q3(this._o3) : void 0 !== i && (t ? this._q3(i) : this._a4(i))),
                this._y6())
        }
    });
    n.rsModules.thumbnails = n.rsProto._h6
}(jQuery),
function (n) {
    n.extend(n.rsProto, {
        _z6: function () {
            var t = this,
                i;
            t._a7 = {
                autoHideArrows: !0,
                autoHideControlNav: !1,
                autoHideBlocks: !1,
                autoHideCaption: !1,
                disableCSS3inFF: !0,
                youTubeCode: '<iframe src="http://www.youtube.com/embed/%id%?rel=1&showinfo=0&autoplay=1&wmode=transparent" frameborder="no"><\/iframe>',
                vimeoCode: '<iframe src="http://player.vimeo.com/video/%id%?byline=0&portrait=0&autoplay=1" frameborder="no" webkitAllowFullScreen mozallowfullscreen allowFullScreen><\/iframe>'
            };
            t.st.video = n.extend({}, t._a7, t.st.video);
            t.ev.on("rsBeforeSizeSet", function () {
                t._b7 && setTimeout(function () {
                    var n = t._r1,
                        n = n.hasClass("rsVideoContainer") ? n : n.find(".rsVideoContainer");
                    t._c7 && t._c7.css({
                        width: n.width(),
                        height: n.height()
                    })
                }, 32)
            });
            i = t._a.mozilla;
            t.ev.on("rsAfterParseNode", function (r, u, f) {
                if (r = n(u), f.videoURL) {
                    t.st.video.disableCSS3inFF && i && (t._e = t._f = !1);
                    u = n('<div class="rsVideoContainer"><\/div>');
                    var e = n(
                        '<div class="rsBtnCenterer"><div class="rsPlayBtn"><div class="rsPlayBtnIcon"><\/div><\/div><\/div>');
                    r.hasClass("rsImg") ? f.content = u.append(r).append(e) : f.content.find(".rsImg").wrap(u).after(e)
                }
            });
            t.ev.on("rsAfterSlideChange", function () {
                t.stopVideo()
            })
        },
        toggleVideo: function () {
            return this._b7 ? this.stopVideo() : this.playVideo()
        },
        playVideo: function () {
            var t = this,
                r, i, f, u;
            return t._b7 ? !1 : (i = t.currSlide, !i.videoURL) ? !1 : (t._d7 = i, r = t._e7 = i.content, i = i.videoURL,
                i.match(/youtu\.be/i) || i.match(/youtube\.com/i) ? (u =
                /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/, (u = i.match(u)) && 11 ==
                u[7].length && (f = u[7]), void 0 !== f && (t._c7 = t.st.video.youTubeCode.replace("%id%", f))) : i.match(
                /vimeo\.com/i) && (u = /(www\.)?vimeo.com\/(\d+)($|\/)/, (u = i.match(u)) && (f = u[2]), void 0 !== f &&
                (t._c7 = t.st.video.vimeoCode.replace("%id%", f))), t.videoObj = n(t._c7), t.ev.trigger(
                "rsOnCreateVideoElement", [i]), t.videoObj.length && (t._c7 = n(
                '<div class="rsVideoFrameHolder"><div class="rsPreloader"><\/div><div class="rsCloseVideoBtn"><div class="rsCloseVideoIcn"><\/div><\/div><\/div>'),
                t._c7.find(".rsPreloader").after(t.videoObj), r = r.hasClass("rsVideoContainer") ? r : r.find(
                ".rsVideoContainer"), t._c7.css({
                width: r.width(),
                height: r.height()
            }).find(".rsCloseVideoBtn").off("click.rsv").on("click.rsv", function (n) {
                return t.stopVideo(), n.preventDefault(), n.stopPropagation(), !1
            }), r.append(t._c7), t.isIPAD && r.addClass("rsIOSVideo"), t._f7(!1), setTimeout(function () {
                t._c7.addClass("rsVideoActive")
            }, 10), t.ev.trigger("rsVideoPlay"), t._b7 = !0), !0)
        },
        stopVideo: function () {
            var n = this;
            return n._b7 ? (n.isIPAD && n.slider.find(".rsCloseVideoBtn").remove(), n._f7(!0), setTimeout(function () {
                n.ev.trigger("rsOnDestroyVideoElement", [n.videoObj]);
                var t = n._c7.find("iframe");
                if (t.length) try {
                        t.attr("src", "")
                } catch (i) {}
                n._c7.remove();
                n._c7 = null
            }, 16), n.ev.trigger("rsVideoStop"), n._b7 = !1, !0) : !1
        },
        _f7: function (n) {
            var t = [],
                i = this.st.video;
            if (i.autoHideArrows && (this._c2 && (t.push(this._c2, this._d2), this._e2 = !n), this._v5 && t.push(this._v5)),
                i.autoHideControlNav && this._k5 && t.push(this._k5), i.autoHideBlocks && this._d7.animBlocks && t.push(
                this._d7.animBlocks), i.autoHideCaption && this.globalCaption && t.push(this.globalCaption), this.slider[
                n ? "removeClass" : "addClass"]("rsVideoPlaying"), t.length) for (i = 0; i < t.length; i++) n ? t[i].removeClass(
                        "rsHidden") : t[i].addClass("rsHidden")
        }
    });
    n.rsModules.video = n.rsProto._z6
}(jQuery),
function (n) {
    n.rsProto._g7 = function () {
        var t = this;
        t.st.visibleNearby && t.st.visibleNearby.enabled && (t._h7 = {
            enabled: !0,
            centerArea: .6,
            center: !0,
            breakpoint: 0,
            breakpointCenterArea: .8,
            hiddenOverflow: !0,
            navigateByCenterClick: !1
        }, t.st.visibleNearby = n.extend({}, t._h7, t.st.visibleNearby), t.ev.one("rsAfterPropsSetup", function () {
            t._i7 = t._e1.css("overflow", "visible").wrap('<div class="rsVisibleNearbyWrap"><\/div>').parent();
            t.st.visibleNearby.hiddenOverflow || t._i7.css("overflow", "visible");
            t._o1 = t.st.controlsInside ? t._i7 : t.slider
        }), t.ev.on("rsAfterSizePropSet", function () {
            var n, i = t.st.visibleNearby;
            n = i.breakpoint && t.width < i.breakpoint ? i.breakpointCenterArea : i.centerArea;
            t._h ? (t._b4 *= n, t._i7.css({
                height: t._c4,
                width: t._b4 / n
            }), t._d = t._b4 * (1 - n) / 2 / n) : (t._c4 *= n, t._i7.css({
                height: t._c4 / n,
                width: t._b4
            }), t._d = t._c4 * (1 - n) / 2 / n);
            i.navigateByCenterClick || (t._q = t._h ? t._b4 : t._c4);
            i.center && t._e1.css("margin-" + (t._h ? "left" : "top"), t._d)
        }))
    };
    n.rsModules.visibleNearby = n.rsProto._g7
}(jQuery);
$(document).ready(function () {
    $("#menubar_homepage").addClass("selected");
    $("#full-width-slider").royalSlider({
        arrowsNav: !0,
        loop: !0,
        keyboardNavEnabled: !0,
        controlsInside: !1,
        imageScaleMode: "fill",
        arrowsNavAutoHide: !1,
        autoScaleSlider: !0,
        autoScaleSliderWidth: 1920,
        autoScaleSliderHeight: 310,
        controlNavigation: "bullets",
        thumbsFitInViewport: !1,
        navigateByClick: !0,
        startSlideId: 0,
        autoPlay: {
            enabled: !0,
            pauseOnHover: !0
        },
        slidesSpacing: 0,
        transitionType: "move",
        globalCaption: !1,
        deeplinking: {
            enabled: !0,
            change: !1
        },
        imgWidth: 1920,
        imgHeight: 310
    });
    Yswee.StartCountdown()
})