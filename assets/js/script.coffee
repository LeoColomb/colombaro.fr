---
---

###
 * {{ site.name }} v{{ site.version }}
 * {{ site.url }}
 * Copyright 2012-{{ site.time | date: "%Y" }} {{ site.author }}
 * Licensed under MIT LICENSE
###

(($) ->
  "use strict"
  $body = $ "html, body"
  content = $("#content").smoothState(
    prefetch: true
    pageCacheSize: 4
    onStart:
      duration: 250
      render: (url, $container) ->
        content.toggleAnimationClass "is-exiting"
        return
  ).data("smoothState")
  return
) jQuery
