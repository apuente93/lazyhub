$(document).on 'page:change', ->
  scrollTop: 0
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()