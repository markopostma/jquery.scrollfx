$.fn.scrollFx = (options) ->

  # set plugin defaults
  this.settings = $.extend({
    scaleElements:    ''
    opacityElements:  ''
    precision:        10
  }, options)

  $this             = this
  $this.win         = $(window)
  $this.doc         = $(document)
  $this.st          = $(window).scrollTop()
  $this.els         = this
  $this.precision   = $this.settings.precision
  $this.scaleEls    = $this.settings.scaleElements
  $this.opacityEls  = $this.settings.opacityElements

  $ ->
    $this.positions = getPositions()
    $this.active_el = getActive()

  update = ->
    $this.st        = $this.win.scrollTop()
    $this.active_el = getActive()

  getPositions = ->
    $positions = []

    $this.els.each (index, item) ->
      top         = $(item).position().top
      height      = $(item).outerHeight()

      $positions.push
        item:       $(item)
        top:        top
        height:     height
        bottom:     top + height

    return $positions

  getActive = ->
    $active = false
    $st     = $this.st

    $($this.positions).each (index, p) ->
      if ($st >= p.top && $st <= p.bottom)
        animate p
        $active = p.item

    return $active

  animate = (pos) ->
    percentage    = calculatePercentage pos
    opacity       = 1 - (percentage * 0.01).toFixed($this.precision)
    scaleDown     = 1 - (percentage * 0.002).toFixed($this.precision)

    $(pos.item).find($this.opacityEls).css 'opacity', opacity
    $(pos.item).find($this.scaleEls).css
      'transform':          "scale(#{scaleDown})"
      '-webkit-transform':  "scale(#{scaleDown})"

  calculatePercentage = (pos) ->
    offsetTop = $this.st - pos.top
    perc      = ((100 / pos.height) * offsetTop).toFixed($this.precision)

    return perc

  $this.win.scroll ->
    update()

  $this.win.resize ->
    $this.positions = getPositions()
    update()