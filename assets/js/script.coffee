---
---

###
 * {{ site.name }} v{{ site.version }}
 * {{ site.url }}
 * Copyright 2012-{{ site.time | date: "%Y" }} {{ site.author.name }}
 * Licensed under MIT LICENSE
###

(($) ->
  "use strict"
  $body = $ "html, body"
  from = ""
  content = $("#content").smoothState(
    prefetch: true
    pageCacheSize: 4
    onStart:
      duration: 250
      render: (url, $container) ->
        $container.removeClass "smooth-entering from" + from
        content.toggleAnimationClass "smooth-exiting to" + (url.split "/")[3]
        return
    onEnd:
      render: (url, $container, $content, $html) ->
        color = $html.find("meta[name=theme-color]").attr "content"
        from = $body.attr "class"
        $body
          .attr "class", $html.find("body").attr "class"
          .css "cursor", "auto"
          .find("a").css "cursor", "auto"
        $("meta[name=theme-color]").attr "content", color
        $("meta[name=msapplication-TileColor]").attr "content", color
        $container
          .addClass "smooth-entering from" + from
          .html $content
        return
  ).data "smoothState"
  return
) jQuery
