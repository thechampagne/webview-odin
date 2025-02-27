package webview

foreign import lib "system:webview"

import "core:c"

VERSION_MAJOR :: 0
VERSION_MINOR :: 12
VERSION_PATCH :: 0
VERSION_NUMBER :: "0.12.0"

Hint :: enum c.int {
  None,
  Min,
  Max,
  Fixed
}

webview :: rawptr

Version :: struct {
    major : c.uint,
    minor : c.uint,
    patch : c.uint,
}

Version_Info :: struct {
    version : Version,
    version_number : [32]c.char,
    pre_release : [48]c.char,
    build_metadata : [48]c.char,
}

Native_Handle_Kind :: enum c.int {
   UI_Window,
   UI_Widget,
   Browser_Controller
}

Error :: enum c.int {
  Missing_Dependency = -5,
  Canceled = -4,
  Invalid_State = -3,
  Invalid_Argument = -2,
  Unspecified = -1,
  Ok = 0,
  Duplicate = 1,
  Not_Found = 2
}
	
@(default_calling_convention="c")
foreign lib {

    webview_create :: proc(debug : c.int, window : rawptr) -> webview ---

    @(link_name="webview_destroy")
    destroy :: proc(w : webview) -> Error ---

    @(link_name="webview_run")
    run :: proc(w : webview) -> Error ---

    @(link_name="webviewerminate")
    terminate :: proc(w : webview) -> Error ---

    @(link_name="webview_dispatch")
    dispatch :: proc(w : webview, fn: #type proc(w : webview, arg : rawptr), arg : rawptr) -> Error ---

    @(link_name="webview_get_window")
    get_window :: proc(w : webview) -> rawptr ---

    @(link_name="webview_get_native_handle")
    get_native_handle :: proc(w : webview, kind: Native_Handle_Kind) -> rawptr ---

    @(link_name="webview_set_title")
    set_title :: proc(w : webview, title : cstring) -> Error ---

    @(link_name="webview_set_size")
    set_size :: proc(w : webview, width : c.int, height : c.int, hints : Hint) -> Error ---

    @(link_name="webview_navigate")
    navigate :: proc(w : webview, url : cstring) -> Error ---

    @(link_name="webview_set_html")
    set_html :: proc(w : webview, html : cstring) -> Error ---

    @(link_name="webview_init")
    init :: proc(w : webview, js : cstring) -> Error ---

    @(link_name="webview_eval")
    eval :: proc(w : webview, js : cstring) -> Error ---

    @(link_name="webview_bind")
    bind :: proc(w : webview, name : cstring, fn : #type proc(seq : cstring, req : cstring, arg : rawptr), arg : rawptr) -> Error ---

    @(link_name="webview_unbind")
    unbind :: proc(w : webview, name : cstring) -> Error ---

    @(link_name="webview_return")
    ret :: proc(w : webview, seq : cstring, status : c.int, result : cstring) -> Error ---

    @(link_name="webview_version")
    version :: proc() -> ^Version_Info ---

}

create :: proc(debug: bool, window : rawptr) -> webview {
       return webview_create(cast(c.int)debug, window)
}
