("function" == typeof define && define.amd
  ? define
  : function (e, t) {
      "undefined" != typeof module && module.exports
        ? (module.exports = t(require("jquery")))
        : (window.toastr = t(window.jQuery));
    })(["jquery"], function (e) {
  return (function () {
    function t(t, n) {
      return (
        t || (t = a()),
        (c = e("#" + t.containerId)).length
          ? c
          : (n &&
              (c = (function (t) {
                return (
                  (c = e("<div/>")
                    .attr("id", t.containerId)
                    .addClass(t.positionClass)).appendTo(e(t.target)),
                  c
                );
              })(t)),
            c)
      );
    }
    function n(t) {
      for (var n = c.children(), s = n.length - 1; s >= 0; s--) o(e(n[s]), t);
    }
    function o(t, n, o) {
      var s = !(!o || !o.force) && o.force;
      return !(
        !t ||
        (!s && 0 !== e(":focus", t).length) ||
        (t[n.hideMethod]({
          duration: n.hideDuration,
          easing: n.hideEasing,
          complete: function () {
            r(t);
          },
        }),
        0)
      );
    }
    function s(e) {
      l && l(e);
    }
    function i(n) {
      function o(e) {
        return (
          null == e && (e = ""),
          e
            .replace(/&/g, "&amp;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
        );
      }
      function i(t) {
        var n = t && !1 !== l.closeMethod ? l.closeMethod : l.hideMethod,
          o = t && !1 !== l.closeDuration ? l.closeDuration : l.hideDuration,
          i = t && !1 !== l.closeEasing ? l.closeEasing : l.hideEasing;
        if (!e(":focus", f).length || t)
          return (
            clearTimeout(b.intervalId),
            f[n]({
              duration: o,
              easing: i,
              complete: function () {
                r(f),
                  clearTimeout(m),
                  l.onHidden && "hidden" !== y.state && l.onHidden(),
                  (y.state = "hidden"),
                  (y.endTime = new Date()),
                  s(y);
              },
            })
          );
      }
      var l = a(),
        p = n.iconClass || l.iconClass;
      if (
        (void 0 !== n.optionsOverride &&
          ((l = e.extend(l, n.optionsOverride)),
          (p = n.optionsOverride.iconClass || p)),
        !(function (e, t) {
          if (l.preventDuplicates) {
            if (t.message === u) return !0;
            u = t.message;
          }
          return !1;
        })(0, n))
      ) {
        d++, (c = t(l, !0));
        var m = null,
          f = e("<div/>"),
          v = e("<div/>"),
          h = e("<div/>"),
          g = e("<div/>"),
          _ = e(l.closeHtml),
          b = { intervalId: null, hideEta: null, maxHideTime: null },
          y = {
            toastId: d,
            state: "visible",
            startTime: new Date(),
            options: l,
            map: n,
          };
        return (
          n.iconClass && f.addClass(l.toastClass).addClass(p),
          (function () {
            if (n.title) {
              var e = n.title;
              l.escapeHtml && (e = o(n.title)),
                v.append(e).addClass(l.titleClass),
                f.append(v);
            }
          })(),
          (function () {
            if (n.message) {
              var e = n.message;
              l.escapeHtml && (e = o(n.message)),
                h.append(e).addClass(l.messageClass),
                f.append(h);
            }
          })(),
          l.closeButton &&
            (_.addClass(l.closeClass).attr("role", "button"), f.prepend(_)),
          l.progressBar && (g.addClass(l.progressClass), f.prepend(g)),
          l.rtl && f.addClass("rtl"),
          l.newestOnTop ? c.prepend(f) : c.append(f),
          (function () {
            var e = "";
            switch (n.iconClass) {
              case "toast-success":
              case "toast-info":
                e = "polite";
                break;
              default:
                e = "assertive";
            }
            f.attr("aria-live", e);
          })(),
          f.hide(),
          f[l.showMethod]({
            duration: l.showDuration,
            easing: l.showEasing,
            complete: l.onShown,
          }),
          l.timeOut > 0 &&
            ((m = setTimeout(i, l.timeOut)),
            (b.maxHideTime = parseFloat(l.timeOut)),
            (b.hideEta = new Date().getTime() + b.maxHideTime),
            l.progressBar &&
              (b.intervalId = setInterval(function () {
                var e =
                  ((b.hideEta - new Date().getTime()) / b.maxHideTime) * 100;
                g.width(e + "%");
              }, 10))),
          l.closeOnHover &&
            f.hover(
              function () {
                clearTimeout(m),
                  (b.hideEta = 0),
                  f.stop(!0, !0)[l.showMethod]({
                    duration: l.showDuration,
                    easing: l.showEasing,
                  });
              },
              function () {
                (l.timeOut > 0 || l.extendedTimeOut > 0) &&
                  ((m = setTimeout(i, l.extendedTimeOut)),
                  (b.maxHideTime = parseFloat(l.extendedTimeOut)),
                  (b.hideEta = new Date().getTime() + b.maxHideTime));
              }
            ),
          !l.onclick && l.tapToDismiss && f.click(i),
          l.closeButton &&
            _ &&
            _.click(function (e) {
              e.stopPropagation
                ? e.stopPropagation()
                : void 0 !== e.cancelBubble &&
                  !0 !== e.cancelBubble &&
                  (e.cancelBubble = !0),
                l.onCloseClick && l.onCloseClick(e),
                i(!0);
            }),
          l.onclick &&
            f.click(function (e) {
              l.onclick(e), i();
            }),
          s(y),
          l.debug && console && console.log(y),
          f
        );
      }
    }
    function a() {
      return e.extend(
        {},
        {
          tapToDismiss: !0,
          toastClass: "toast",
          containerId: "toast-container",
          debug: !1,
          showMethod: "fadeIn",
          showDuration: 300,
          showEasing: "swing",
          onShown: void 0,
          hideMethod: "fadeOut",
          hideDuration: 1e3,
          hideEasing: "swing",
          onHidden: void 0,
          closeMethod: !1,
          closeDuration: !1,
          closeEasing: !1,
          closeOnHover: !0,
          extendedTimeOut: 1e3,
          iconClasses: {
            error: "toast-error",
            info: "toast-info",
            success: "toast-success",
            warning: "toast-warning",
          },
          iconClass: "toast-info",
          positionClass: "toast-bottom-center",
          timeOut: 5e3,
          titleClass: "toast-title",
          messageClass: "toast-message",
          escapeHtml: !1,
          target: "body",
          closeHtml: '<button type="button">&times;</button>',
          closeClass: "toast-close-button",
          newestOnTop: !0,
          preventDuplicates: !1,
          progressBar: !1,
          progressClass: "toast-progress",
          rtl: !1,
        },
        p.options
      );
    }
    function r(e) {
      c || (c = t()),
        e.is(":visible") ||
          (e.remove(),
          (e = null),
          0 === c.children().length && (c.remove(), (u = void 0)));
    }
    var c,
      l,
      u,
      d = 0,
      p = {
        clear: function (e, s) {
          var i = a();
          c || t(i), o(e, i, s) || n(i);
        },
        remove: function (n) {
          var o = a();
          return (
            c || t(o),
            n && 0 === e(":focus", n).length
              ? void r(n)
              : void (c.children().length && c.remove())
          );
        },
        error: function (e, t, n) {
          return i({
            type: "error",
            iconClass: a().iconClasses.error,
            message: e,
            optionsOverride: n,
            title: t,
          });
        },
        getContainer: t,
        info: function (e, t, n) {
          return i({
            type: "info",
            iconClass: a().iconClasses.info,
            message: e,
            optionsOverride: n,
            title: t,
          });
        },
        options: {},
        subscribe: function (e) {
          l = e;
        },
        success: function (e, t, n) {
          return i({
            type: "success",
            iconClass: a().iconClasses.success,
            message: e,
            optionsOverride: n,
            title: t,
          });
        },
        version: "2.1.3",
        warning: function (e, t, n) {
          return i({
            type: "warning",
            iconClass: a().iconClasses.warning,
            message: e,
            optionsOverride: n,
            title: t,
          });
        },
      };
    return p;
  })();
});
