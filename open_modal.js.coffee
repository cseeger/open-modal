HuntersAlley.directive "openModal", [ ->
  restrict: "A"
  link: (scope, elem, attrs) ->
    scope.$watch attrs["trigger"], (newValue, oldValue) ->
      if newValue
        elem.addClass("is-active")
        angular.element("html").addClass("has-overlay")

        elem.on "keyup", document, (event) ->
          # If key ESC is pressed
          if event.keyCode is 27
            scope.$apply ->
              scope[attrs.trigger] = false
            elem.removeClass('is-active')
            angular.element("html").removeClass("has-overlay")

        elem.focus()
      else
        elem.removeClass('is-active')
        angular.element("html").removeClass("has-overlay")
        elem.off "keyup"
]
