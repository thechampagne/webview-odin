package main

import "webview"

main :: proc() {
    w := webview.create(0, nil)
    defer webview.destroy(w)
    webview.set_title(w, "Basic Example")
    webview.set_size(w, 480, 320, webview.HINT_NONE)
    webview.set_html(w, "Thanks for using webview!")
    webview.run(w)
}
