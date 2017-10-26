module IdrisCanvas.TextMetrics

import IdrisCanvas.Js

%access public export

data TextMetrics

JSTextMetrics : JSType
JSTextMetrics = JSObject "TextMetrics"

ToRef TextMetrics where
    toRef = defaultToRef

FromRef TextMetrics where
    fromRef = defaultFromRef

ToIORef TextMetrics where
    toIORef = defaultToIORef

FromIORef TextMetrics where
    fromIORef = defaultFromIORef

SafeFromRef TextMetrics where
    safeFromRef = defaultSafeFromRef JSTextMetrics

%inline
textMetricsFromRef : JSRef -> JS_IO (Maybe TextMetrics)
textMetricsFromRef = safeFromRef

getWidth : TextMetrics -> JS_IO Double
getWidth matrix = jscall "%0.width" (Ptr -> JS_IO Double) (toRef matrix)

getActualBoundingBoxLeft : TextMetrics -> JS_IO Double
getActualBoundingBoxLeft matrix = jscall "%0.actualBoundingBoxLeft" (Ptr -> JS_IO Double) (toRef matrix)

getActualBoundingBoxRight : TextMetrics -> JS_IO Double
getActualBoundingBoxRight matrix = jscall "%0.actualBoundingBoxRight" (Ptr -> JS_IO Double) (toRef matrix)

getFontBoundingBoxAscent : TextMetrics -> JS_IO Double
getFontBoundingBoxAscent matrix = jscall "%0.fontBoundingBoxAscent" (Ptr -> JS_IO Double) (toRef matrix)

getFontBoundingBoxDescent : TextMetrics -> JS_IO Double
getFontBoundingBoxDescent matrix = jscall "%0.fontBoundingBoxDescent" (Ptr -> JS_IO Double) (toRef matrix)

getActualBoundingBoxAscent : TextMetrics -> JS_IO Double
getActualBoundingBoxAscent matrix = jscall "%0.actualBoundingBoxAscent" (Ptr -> JS_IO Double) (toRef matrix)

getActualBoundingBoxDescent : TextMetrics -> JS_IO Double
getActualBoundingBoxDescent matrix = jscall "%0.actualBoundingBoxDescent" (Ptr -> JS_IO Double) (toRef matrix)

getEmHeightAscent : TextMetrics -> JS_IO Double
getEmHeightAscent matrix = jscall "%0.emHeightAscent" (Ptr -> JS_IO Double) (toRef matrix)

getEmHeightDescent : TextMetrics -> JS_IO Double
getEmHeightDescent matrix = jscall "%0.emHeightDescent" (Ptr -> JS_IO Double) (toRef matrix)

getHangingBaseline : TextMetrics -> JS_IO Double
getHangingBaseline matrix = jscall "%0.hangingBaseline" (Ptr -> JS_IO Double) (toRef matrix)

getAlphabeticBaseline : TextMetrics -> JS_IO Double
getAlphabeticBaseline matrix = jscall "%0.alphabeticBaseline" (Ptr -> JS_IO Double) (toRef matrix)

getIdeographicBaseline : TextMetrics -> JS_IO Double
getIdeographicBaseline matrix = jscall "%0.ideographicBaseline" (Ptr -> JS_IO Double) (toRef matrix)
