###
	Landed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
###

(($) ->
  skel.breakpoints
    xlarge: '(max-width: 1680px)'
    large: '(max-width: 1280px)'
    medium: '(max-width: 980px)'
    small: '(max-width: 736px)'
    xsmall: '(max-width: 480px)'
  $ ->
    $window = $(window)
    $body = $('body')
    # Disable animations/transitions until the page has loaded.
    $body.addClass 'is-loading'
    $window.on 'load', ->
      window.setTimeout (->
        $body.removeClass 'is-loading'
        return
      ), 0
      return
    # Touch mode.
    if skel.vars.mobile
      $body.addClass 'is-touch'
    # Fix: Placeholder polyfill.
    $('form').placeholder()
    # Prioritize "important" elements on medium.
    skel.on '+medium -medium', ->
      $.prioritize '.important\\28 medium\\29', skel.breakpoint('medium').active
      return
    # Scrolly links.
    $('.scrolly').scrolly speed: 2000
    # Dropdowns.
    $('#nav > ul').dropotron
      alignment: 'right'
      hideDelay: 350
    # Off-Canvas Navigation.
    # Title Bar.
    $('<div id="titleBar">' + '<a href="#navPanel" class="toggle"></a>' + '<span class="title">' + $('#logo').html() + '</span>' + '</div>').appendTo $body
    # Navigation Panel.
    $('<div id="navPanel">' + '<nav>' + $('#nav').navList() + '</nav>' + '</div>').appendTo($body).panel
      delay: 500
      hideOnClick: true
      hideOnSwipe: true
      resetScroll: true
      resetForms: true
      side: 'left'
      target: $body
      visibleClass: 'navPanel-visible'
    # Fix: Remove navPanel transitions on WP<10 (poor/buggy performance).
    if skel.vars.os == 'wp' and skel.vars.osVersion < 10
      $('#titleBar, #navPanel, #page-wrapper').css 'transition', 'none'
    # Parallax.
    # Disabled on IE (choppy scrolling) and mobile platforms (poor performance).
    if skel.vars.browser == 'ie' or skel.vars.mobile

      $.fn._parallax = ->
        $ this

    else

      $.fn._parallax = ->
        $(this).each ->
          $this = $(this)
          on1 = undefined
          off1 = undefined

          on1 = ->
            $this.css 'background-position', 'center 0px'
            $window.on 'scroll._parallax', ->
              pos = parseInt($window.scrollTop()) - parseInt($this.position().top)
              $this.css 'background-position', 'center ' + pos * -0.15 + 'px'
              return
            return

          off1 = ->
            $this.css 'background-position', ''
            $window.off 'scroll._parallax'
            return

          skel.on 'change', ->
            if skel.breakpoint('medium').active
              off1()
            else
              on1()
            return
          return
        $ this

      $window.on 'load resize', ->
        $window.trigger 'scroll'
        return
    # Spotlights.
    $spotlights = $('.spotlight')
    $spotlights._parallax().each ->
      $this = $(this)
      on1 = undefined
      off1 = undefined

      on1 = ->
        # Use main <img>'s src as this spotlight's background.
        $this.css 'background-image', 'url("' + $this.find('.image.main > img').attr('src') + '")'
        # Enable transitions (if supported).
        if skel.canUse('transition')
          top = undefined
          bottom = undefined
          mode = undefined
          # Side-specific scrollex tweaks.
          if $this.hasClass('top')
            mode = 'top'
            top = '-20%'
            bottom = 0
          else if $this.hasClass('bottom')
            mode = 'bottom-only'
            top = 0
            bottom = '20%'
          else
            mode = 'middle'
            top = 0
            bottom = 0
          # Add scrollex.
          $this.scrollex
            mode: mode
            top: top
            bottom: bottom
            initialize: (t) ->
              $this.addClass 'inactive'
              return
            terminate: (t) ->
              $this.removeClass 'inactive'
              return
            enter: (t) ->
              $this.removeClass 'inactive'
              return
        return

      off1 = ->
        # Clear spotlight's background.
        $this.css 'background-image', ''
        # Disable transitions (if supported).
        if skel.canUse('transition')
          # Remove scrollex.
          $this.unscrollex()
        return

      skel.on 'change', ->
        if skel.breakpoint('medium').active
          off1()
        else
          on1()
        return
      return
    # Wrappers.
    $wrappers = $('.wrapper')
    $wrappers.each ->
      $this = $(this)
      on1 = undefined
      off1 = undefined

      on1 = ->
        if skel.canUse('transition')
          $this.scrollex
            top: 250
            bottom: 0
            initialize: (t) ->
              $this.addClass 'inactive'
              return
            terminate: (t) ->
              $this.removeClass 'inactive'
              return
            enter: (t) ->
              $this.removeClass 'inactive'
              return
        return

      off1 = ->
        if skel.canUse('transition')
          $this.unscrollex()
        return

      skel.on 'change', ->
        if skel.breakpoint('medium').active
          off1()
        else
          on1()
        return
      return
    # Banner.
    $banner = $('#banner')
    $banner._parallax()
    return
  return
) jQuery

# ---
# generated by js2coffee 2.2.0


## <<<<------------ I brew my coffee here  ---->>>>


$(document).on "click", "input#brandField", ->
  email = $("input#brandField").is(':focus')
  if email
    $.ajax "/brands" ,
      type: 'GET'
      dataType: 'json'
      success:(data, jqxhr, textStatus) ->
        $("#brandsList").removeClass('hidden');
        if($("#brandsList ul").children().length <1)
          data.forEach (x) ->
            console.log(x.name)
            $("#brandsList ul").append('<li class=\"listView\" value='+x.id+' name='+x.name+'>'+x.name+'</li>')
        else
  else
    console.log 'naaaa'

$(document).on "click", "#brandsList li.listView", ->
  $("input#brandField").val(this.innerHTML)
  $.ajax "/models",
    type: 'GET'
    data: {
      brand_id: this.value
    }
    dataType: 'json'
    success:(data, jqxhr, textStatus) ->
      $('#brandsList').addClass('hidden');
      $('div#modelsList').removeClass('hidden');
      $('#modelsList ul').html('')
      console.log(data);
      console.log(this.innerHTML);
      if($("#modelsList ul").children().length <1)
        data.forEach (x) ->
          console.log(x.name)
          $("#modelsList ul").append('<li class=\"listView\" value='+x.id+' name='+x.name+'>'+x.name+'</li>')
      else


$(document).on "click", "#modelsList li.listView", ->
  if(!$("#modelField").val() == "")
  else

  $('#modelsList').addClass('hidden')
  $("input#modelField").val(this.innerHTML)
  $("#modelField")["0"].name = this.innerHTML
  $("#modelField")["0"].name = this.value
  $("#servicesList")["0"].value = this.value

$(document).on 'click', "#servicesList", ->
  $.ajax "/services",
    type :"GET"
    data: {
      model_id: this.value
    }
    dataType : 'json'
    success:(data, jqxhr, textStatus) ->
      console.log(data)
      if($("#servicesListDiv").hasClass('fadeOutRight'))
        $("#servicesListDiv").removeClass('fadeOutRight')
        $("#servicesListDiv").addClass('bounceInRight')
        $("#servicesListDiv").removeClass('hidden')
      else
        $("#servicesListDiv").addClass('animated bounceInRight')
        $("#servicesListDiv").removeClass('hidden')

      if($("#servicesListDiv table tbody").children().length > 0)
        $("#servBody").html("")
      if($("#servicesListDiv table tbody").children().length <1)
        data.forEach (x) ->
          console.log(x.name)
          $("#servBody").append("
            <tr>
              <td>" + x.name + "</td>
              <td>" + x.price + "</td>
            </tr>
          ")
      else
$(document).on 'click', ".closeButton", ->
  $("#servicesListDiv").removeClass('animated bounceInRight')
  $("#servicesListDiv").addClass('animated fadeOutRight')
