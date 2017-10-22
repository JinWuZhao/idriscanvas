module IdrisCanvas.Web.HTMLDocument

import IdrisCanvas.Js

%access public export

export
HTMLDocument : Type
HTMLDocument = JSRef

document : JS_IO HTMLDocument
document = iojsref (jscall "document" (JS_IO Ptr))

getElementById : HTMLDocument -> String -> JS_IO JSRef
getElementById doc name = iojsref (jscall "%0.getElementById(%1)"
                                          (Ptr -> String -> JS_IO Ptr)
                                          (jsptr doc) name)
