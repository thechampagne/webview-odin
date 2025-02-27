# webview-odin

[![](https://img.shields.io/github/v/tag/thechampagne/webview-odin?label=version)](https://github.com/thechampagne/webview-odin/releases/latest) [![](https://img.shields.io/github/license/thechampagne/webview-odin)](https://github.com/thechampagne/webview-odin/blob/main/LICENSE)

Odin binding for a tiny cross-platform **webview** library to build modern cross-platform GUIs.

<p align="center">
<img src="https://raw.githubusercontent.com/thechampagne/webview-odin/main/.github/assets/screenshot.png"/>
</p>

### API

```odin
VERSION_MAJOR :: 0
VERSION_MINOR :: 12
VERSION_PATCH :: 0
VERSION_NUMBER :: "0.12.0"

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

Hint :: enum c.int {
  None,
  Min,
  Max,
  Fixed
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

webview :: rawptr

create :: proc(debug: bool, window : rawptr) -> webview

destroy :: proc(w : webview) -> Error

run :: proc(w : webview) -> Error

terminate :: proc(w : webview) -> Error

dispatch :: proc(w : webview, fn: #type proc(w : webview, arg : rawptr), arg : rawptr) -> Error

get_window :: proc(w : webview) -> rawptr

get_native_handle :: proc(w : webview, kind: Native_Handle_Kind) -> rawptr

set_title :: proc(w : webview, title : cstring) -> Error

set_size :: proc(w : webview, width : c.int, height : c.int, hints : Hint) -> Error

navigate :: proc(w : webview, url : cstring) -> Error

set_html :: proc(w : webview, html : cstring) -> Error

init :: proc(w : webview, js : cstring) -> Error

eval :: proc(w : webview, js : cstring) -> Error

bind :: proc(w : webview, name : cstring, fn : #type proc(seq : cstring, req : cstring, arg : rawptr), arg : rawptr) -> Error

unbind :: proc(w : webview, name : cstring) -> Error

ret :: proc(w : webview, seq : cstring, status : c.int, result : cstring) -> Error

version :: proc() -> ^Version_Info
```

### References
 - [webview](https://github.com/webview/webview/tree/0.12.0) - **0.12.0**

### License

This repo is released under the [MIT License](https://github.com/thechampagne/webview-odin/blob/main/LICENSE).
