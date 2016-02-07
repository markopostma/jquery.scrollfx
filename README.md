# jquery.scrollfx

A jQuery plugin that adds some cool CSS3 animations upon scroll.

See the homepage for directions and examples: <http://github.io/marksten/jquery.scrollfx.js>

# Installation

```bash
$ npm install jquery.scrollfx --save
```

# Usage

```javascript
$(selector).scrollFx(function() {
	scaleElements:    '', // elements that should scale down<br />
	opacityElements:  '', // elements that should change opacity
	precision:        ''  // default '10'
});
```

Find `jquery.scrollfx.js` in the `dist/` directory. Make sure to include it after jQuery.