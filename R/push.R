shinyEventsPushMessage.examples = function() {
  app = eventsApp()
  app$ui = fluidPage(
    push.js.headers(),
    p("Push Message Test"),
    simpleButton("pushBtn","Show Message")
  )
  buttonHandler("pushBtn",fun = function(...) {
    push.message("Hello World",body="My message body.")
    cat("\nYou pressed the button.")
  })
  viewApp(app)
}

#' Show a push message
#' @param msg the push message
#' @param ... named options as described here \href{https://pushjs.org/docs/options}{https://pushjs.org/docs/options}
push.message = function(msg,...) {
  args = list(...)
  if (length(args)==0) {
    callJS("Push.create",msg)
  } else {
    callJS("Push.create",msg,args)
  }
}

#' Add push.js.headers. Add this call to your ui
push.js.headers = function() {
  dir = system.file("www/push", package="shinyEventsPushMessage")

  htmlDependency("push.js", "1.0.9", c(file = dir),script = c("push.min.js"))
}

