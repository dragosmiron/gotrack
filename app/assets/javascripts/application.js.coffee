#This is a manifest file that'll be compiled into application.js, which will include all the files
#listed below.
#
#Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
#or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#compiled file.
#WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
#GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
#= require bootstrap

#  Custom unobtrusiveness helpers

$.unobtrusive = (callback) ->
  $(document).bind('activate-unobtrusive-javascript', (event, root) ->
    $(root).each(callback)
  )

$.fn.activateUnobtrusiveJavascript = () ->
  return this.each(() ->
    $(document).trigger('activate-unobtrusive-javascript', this)
  )

$(document).ready () ->
  $(document).activateUnobtrusiveJavascript()


$.unobtrusive () ->
  # only enable tooltips on non-touch devices
  return if ('ontouchstart' in document.documentElement)
  $('[title]').tooltip(
    delay: { show:350, hide:150 }
    html: true
  )
