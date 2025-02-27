package main

import webview "../"

main :: proc() {
    w : webview.webview = webview.create(false, nil)
    defer webview.destroy(w)
    webview.set_title(w, "Basic Example")
    webview.set_size(w, 480, 320, .None) 
    webview.set_html(w, "Thanks for using webview!")
    webview.run(w)
}
