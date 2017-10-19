module IdrisCanvas.TextMetrics.Raw

import IdrisCanvas.Tools

%access public export

namespace width

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.width" (Ptr -> JS_IO Double) matrix

namespace actualBoundingBoxLeft

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.actualBoundingBoxLeft" (Ptr -> JS_IO Double) matrix

namespace actualBoundingBoxRight

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.actualBoundingBoxRight" (Ptr -> JS_IO Double) matrix

namespace fontBoundingBoxAscent

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.fontBoundingBoxAscent" (Ptr -> JS_IO Double) matrix

namespace fontBoundingBoxDescent

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.fontBoundingBoxDescent" (Ptr -> JS_IO Double) matrix

namespace actualBoundingBoxAscent

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.actualBoundingBoxAscent" (Ptr -> JS_IO Double) matrix

namespace actualBoundingBoxDescent

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.actualBoundingBoxDescent" (Ptr -> JS_IO Double) matrix

namespace emHeightAscent

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.emHeightAscent" (Ptr -> JS_IO Double) matrix

namespace emHeightDescent

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.emHeightDescent" (Ptr -> JS_IO Double) matrix

namespace hangingBaseline

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.hangingBaseline" (Ptr -> JS_IO Double) matrix

namespace alphabeticBaseline

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.alphabeticBaseline" (Ptr -> JS_IO Double) matrix

namespace ideographicBaseline

    get : Ptr -> JS_IO Double
    get matrix = jscall "%0.ideographicBaseline" (Ptr -> JS_IO Double) matrix
