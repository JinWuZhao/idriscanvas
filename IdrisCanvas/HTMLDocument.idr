module IdrisCanvas.HTMLDocument

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

%inline
documentFromRef : JSRef -> JS_IO (Maybe HTMLDocument)
documentFromRef = safeFromRef

document : JS_IO HTMLDocument
document = fromIORef $ jscall "document" (JS_IO Ptr)

getElementById : (idName : String) -> HTMLDocument -> JS_IO JSRef
getElementById idName doc = jscall "%0.getElementById(%1)"
                                   (Ptr -> String -> JS_IO Ptr)
                                   (toRef doc) idName

createElement : (tagname : String) -> HTMLDocument -> JS_IO JSRef
createElement tagname doc = jscall "%0.createElement(%1)" (Ptr -> String -> JS_IO Ptr) (toRef doc) tagname

appendChildToBody : (element : JSRef) -> HTMLDocument -> JS_IO ()
appendChildToBody element doc = jscall "%0.body.appendChild(%1)" (Ptr -> Ptr -> JS_IO ()) (toRef doc) element
