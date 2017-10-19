module IdrisCanvas.WebSupport.Document.Raw

import IdrisCanvas.Tools

%access public export

document : JS_IO Ptr
document = jscall "document" (JS_IO Ptr)

getElementById : Ptr -> String -> JS_IO Ptr
getElementById doc name = jscall "%0.getElementById(%1)"
                                 (Ptr -> String -> JS_IO Ptr)
                                 doc name
