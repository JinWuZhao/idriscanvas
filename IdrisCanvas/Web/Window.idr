module IdrisCanvas.Web.Window

import IdrisCanvas.Js

%access public export

export
Window : Type
Window = JSRef

window : JS_IO Window
window = jscall "window" (JS_IO Ptr)

onload : Window -> (() -> JS_IO ()) -> JS_IO ()
onload wind f = jscall "%0.onload = %1"
                       (Ptr -> JsFn (() -> JS_IO ()) -> JS_IO ())
                       wind (MkJsFn f)
