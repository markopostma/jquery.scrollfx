(function() {
    $.fn.scrollFx = function(a) {
        var b, c, d, e, f, g;
        this.settings = $.extend({
            scaleElements: "",
            opacityElements: "",
            precision: 10
        }, a);
        b = this;
        b.win = $(window);
        b.doc = $(document);
        b.st = $(window).scrollTop();
        b.els = this;
        b.precision = b.settings.precision;
        b.scaleEls = b.settings.scaleElements;
        b.opacityEls = b.settings.opacityElements;
        $(function() {
            b.positions = f();
            return b.active_el = e();
        });
        g = function() {
            b.st = b.win.scrollTop();
            return b.active_el = e();
        };
        f = function() {
            var a;
            a = [];
            b.els.each(function(b, c) {
                var d, e;
                e = $(c).position().top;
                d = $(c).outerHeight();
                return a.push({
                    item: $(c),
                    top: e,
                    height: d,
                    bottom: e + d
                });
            });
            return a;
        };
        e = function() {
            var a, d;
            a = false;
            d = b.st;
            $(b.positions).each(function(b, e) {
                if (d >= e.top && d <= e.bottom) {
                    c(e);
                    return a = e.item;
                }
            });
            return a;
        };
        c = function(a) {
            var c, e, f;
            e = d(a);
            c = 1 - (e * .01).toFixed(b.precision);
            f = 1 - (e * .002).toFixed(b.precision);
            $(a.item).find(b.opacityEls).css("opacity", c);
            return $(a.item).find(b.scaleEls).css({
                transform: "scale(" + f + ")",
                "-webkit-transform": "scale(" + f + ")"
            });
        };
        d = function(a) {
            var c, d;
            c = b.st - a.top;
            d = (100 / a.height * c).toFixed(b.precision);
            return d;
        };
        b.win.scroll(function() {
            return g();
        });
        return b.win.resize(function() {
            b.positions = f();
            return g();
        });
    };
}).call(this);