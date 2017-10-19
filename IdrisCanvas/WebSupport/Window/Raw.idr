module IdrisCanvas.WebSupport.Window.Raw

import IdrisCanvas.Tools

%access public export

window : JS_IO Ptr
window = jscall "window" (JS_IO Ptr)

onload : Ptr -> (() -> JS_IO ()) -> JS_IO ()
onload wind f = jscall "%0.onload = %1"
                       (Ptr -> JsFn (() -> JS_IO ()) -> JS_IO ())
                       wind (MkJsFn f)
