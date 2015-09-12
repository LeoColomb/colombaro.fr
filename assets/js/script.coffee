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
    cacheLength: 4
    loadingClass: "smooth-loading"
    onStart:
      duration: 250
      render: ($container) ->
        content.toggleAnimationClass "to" + ($container.href.split "/")[3]
        return
    onReady:
      duration: 250
      render: ($container, $newContent) ->
        color = $newContent.find("meta[name=theme-color]").attr "content"
        from = $body.attr "class"
        $body
          .attr "class", $newContent.find("body").attr "class"
        $("meta[name=theme-color]").attr "content", color
        $("meta[name=msapplication-TileColor]").attr "content", color
        $container
          .addClass "smooth-entering from" + from
          .html $newContent
        return
    onAfter: ($container, $newContent) ->
      $container.removeClass "smooth-entering from" + from
      return
  ).data "smoothState"
  return
) jQuery
