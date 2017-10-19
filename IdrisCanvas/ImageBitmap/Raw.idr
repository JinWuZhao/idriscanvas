module IdrisCanvas.ImageBitmap.Raw

import IdrisCanvas.Tools

%access public export

namespace width

    get : Ptr -> JS_IO Int
    get img = jscall "%0.width" (Ptr -> JS_IO Int) img

namespace height

    get : Ptr -> JS_IO Int
    get img = jscall "%0.height" (Ptr -> JS_IO Int) img
