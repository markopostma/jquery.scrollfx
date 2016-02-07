# jquery.scrollfx (currently in development)

A jQuery plugin that adds some cool effects when a user scrolls down the page.
What is basically does is calculate the distance from the top and the bottom of the selector that the user has scrolled down to determine how the selector should change it's appearance.

I wrote the plugin for a private project, but I thought why not share it with the world.

# Installation

Find `jquery.scrollfx.js` in the `dist/` directory. Make sure to include it after jQuery.

# Usage

```javascript
$(selector).scrollFx(function() {
  scaleElements:    '',   // required
  opacityElements:  '',   // required
  precision:        ''    // optional
});
```

# Options

Here is a list of all available options.

### scaleElements (string, default: '')
The elements that should be scaled inside of the wrapper. Joined with a ','.

### opacityElements (string, default: '')
The elements that should change their opacity attribute. Joined with a ','.

### precision (integer, default: 10)
This option effects the overall performance of your website. The higher the precision, the 'smoother' the effects.
If you don't want to overheat your users' GPU or CPU your should reduce this number.

# Development

### v 0.0.1 (7 february 2016)
+ Added scalable elements
+ Added opacity elements
+ Added basic options
+ Added a demo
+ Added basic readme file
+ Used Grunt for local development

### Future development
+ Release the release available for npm
+ Add more effects
+ Add more options
+ Write unit tests
+ Do some Browser Compatibility tests