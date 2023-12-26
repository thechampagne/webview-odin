package webview

when ODIN_OS == .Windows do foreign import webview "webview.lib"
when ODIN_OS != .Windows do foreign import webview "system:webview"

import "core:c"

VERSION_MAJOR :: 0
VERSION_MINOR :: 10
VERSION_PATCH :: 0
VERSION_NUMBER :: "0.10.0"
HINT_NONE :: 0
HINT_MIN :: 1
HINT_MAX :: 2
HINT_FIXED :: 3

webview_t :: rawptr

webview_version_t :: struct {
    major : c.uint,
    minor : c.uint,
    patch : c.uint,
}

webview_version_info_t :: struct {
    version : webview_version_t,
    version_number : [32]c.char,
    pre_release : [48]c.char,
    build_metadata : [48]c.char,
}

@(default_calling_convention="c")
foreign webview {

    @(link_name="webview_create")
    create :: proc(debug : c.int, window : rawptr) -> webview_t ---

    @(link_name="webview_destroy")
    destroy :: proc(w : webview_t) ---

    @(link_name="webview_run")
    run :: proc(w : webview_t) ---

    @(link_name="webview_terminate")
    terminate :: proc(w : webview_t) ---

    @(link_name="webview_dispatch")
    dispatch :: proc(w : webview_t, fn: #type proc(w : webview_t, arg : rawptr), arg : rawptr) ---

    @(link_name="webview_get_window")
    get_window :: proc(w : webview_t) -> rawptr ---

    @(link_name="webview_set_title")
    set_title :: proc(w : webview_t, title : cstring) ---

    @(link_name="webview_set_size")
    set_size :: proc(w : webview_t, width : c.int, height : c.int, hints : c.int) ---

    @(link_name="webview_navigate")
    navigate :: proc(w : webview_t, url : cstring) ---

    @(link_name="webview_set_html")
    set_html :: proc(w : webview_t, html : cstring) ---

    @(link_name="webview_init")
    init :: proc(w : webview_t, js : cstring) ---

    @(link_name="webview_eval")
    eval :: proc(w : webview_t, js : cstring) ---

    @(link_name="webview_bind")
    bind :: proc(w : webview_t, name : cstring, fn : #type proc(seq : cstring, req : cstring, arg : rawptr), arg : rawptr) ---

    @(link_name="webview_unbind")
    unbind :: proc(w : webview_t, name : cstring) ---

    @(link_name="webview_return")
    ret :: proc(w : webview_t, seq : cstring, status : c.int, result : cstring) ---

    @(link_name="webview_version")
    version :: proc() -> ^webview_version_info_t ---

}
