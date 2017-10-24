module IdrisCanvas.Web.HTMLDocument

import IdrisCanvas.Js

%access public export

data HTMLDocument

JSHTMLDocument : JSType
JSHTMLDocument = JSObject "HTMLDocument"

ToRef HTMLDocument where
    toRef = defaultToRef

FromRef HTMLDocument where
    fromRef = defaultFromRef

ToIORef HTMLDocument where
    toIORef = defaultToIORef

FromIORef HTMLDocument where
    fromIORef = defaultFromIORef

SafeFromRef HTMLDocument where
    safeFromRef = defaultSafeFromRef JSHTMLDocument

document : JS_IO HTMLDocument
document = fromIORef $ jscall "document" (JS_IO Ptr)

getElementById : HTMLDocument -> String -> JS_IO JSRef
getElementById doc name = jscall "%0.getElementById(%1)"
                                 (Ptr -> String -> JS_IO Ptr)
                                 (toRef doc) name
