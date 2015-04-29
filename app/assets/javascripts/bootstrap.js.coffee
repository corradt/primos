jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip
  $('.carousel').carousel({
  cycle:3
  interval: 3000
   })

 