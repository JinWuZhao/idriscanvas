module IdrisCanvas.ImageData.Raw

import IdrisCanvas.Tools

%access public export

namespace imageData

    get : Ptr -> JS_IO Ptr
    get imgdata = jscall "%0.data" (Ptr -> JS_IO Ptr) imgdata

namespace height

    get : Ptr -> JS_IO Int
    get imgdata = jscall "%0.height" (Ptr -> JS_IO Int) imgdata

namespace width

    get : Ptr -> JS_IO Int
    get imgdata = jscall "%0.width" (Ptr -> JS_IO Int) imgdata
