module IdrisCanvas.CanvasRenderingContext2D

import IdrisCanvas.Js
import IdrisCanvas.Js.Array
import IdrisCanvas.TextMetrics
import IdrisCanvas.CanvasGradient
import IdrisCanvas.CanvasPattern
import IdrisCanvas.ImageData

%access public export

data CanvasRenderingContext2D

JSCanvasRenderingContext2D : JSType
JSCanvasRenderingContext2D = JSObject "CanvasRenderingContext2D"

ToRef CanvasRenderingContext2D where
    toRef = defaultToRef

FromRef CanvasRenderingContext2D where
    fromRef = defaultFromRef

ToIORef CanvasRenderingContext2D where
    toIORef = defaultToIORef

FromIORef CanvasRenderingContext2D where
    fromIORef = defaultFromIORef

SafeFromRef CanvasRenderingContext2D where
    safeFromRef = defaultSafeFromRef JSCanvasRenderingContext2D

%inline
contextFromRef : JSRef -> JS_IO (Maybe CanvasRenderingContext2D)
contextFromRef = safeFromRef

clearRect : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
clearRect x y width height ctx = jscall "%0.clearRect(%1, %2, %3, %4)"
                                        (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                        (toRef ctx) x y width height

fillRect : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
fillRect x y width height ctx = jscall "%0.fillRect(%1, %2, %3, %4)"
                                       (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                       (toRef ctx) x y width height

strokeRect : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
strokeRect x y width height ctx = jscall "%0.strokeRect(%1, %2, %3, %4)"
                                         (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                         (toRef ctx) x y width height

fillText : String -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
fillText text x y maxWidth ctx = jscall "%0.fillText(%1, %2, %3, %4)"
                                        (Ptr -> String -> Double -> Double -> Double -> JS_IO ())
                                        (toRef ctx) text x y maxWidth

strokeText : String -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
strokeText text x y maxWidth ctx = jscall "%0.strokeText(%1, %2, %3, %4)"
                                          (Ptr -> String -> Double -> Double -> Double -> JS_IO ())
                                          (toRef ctx) text x y maxWidth

measureText : String -> CanvasRenderingContext2D -> JS_IO TextMetrics
measureText text ctx = fromIORef $ jscall "%0.measureText(%1)" (Ptr -> String -> JS_IO Ptr) (toRef ctx) text

getLineDash : CanvasRenderingContext2D -> JS_IO Array
getLineDash ctx = fromIORef $ jscall "%0.getLineDash()" (Ptr -> JS_IO Ptr) (toRef ctx)

setLineDash : Array -> CanvasRenderingContext2D -> JS_IO ()
setLineDash segments ctx = jscall "%0.setLineDash(%1)" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) (toRef segments)

createLinearGradient : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO CanvasGradient
createLinearGradient x0 y0 x1 y1 ctx = fromIORef $ jscall "%0.createLinearGradient(%1, %2, %3, %4)"
                                                          (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                                          (toRef ctx) x0 y0 x1 y1

createRadialGradient : Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO CanvasGradient
createRadialGradient x0 y0 r0 x1 y1 r1 ctx = fromIORef $ jscall "%0.createRadialGradient(%1, %2, %3, %4, %5, %6)"
                                                                (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                                                (toRef ctx) x0 y0 r0 x1 y1 r1

RepetitionRepeat : String
RepetitionRepeat = "repeat"

RepetitionRepeatX : String
RepetitionRepeatX = "repeat-x"

RepetitionRepeatY : String
RepetitionRepeatY = "repeat-y"

RepetitionNoRepeat : String
RepetitionNoRepeat = "no-repeat"

createPattern : JSRef -> String -> CanvasRenderingContext2D -> JS_IO CanvasPattern
createPattern image repetition ctx = fromIORef $ jscall "%0.createPattern(%1, %2)"
                                                        (Ptr -> Ptr -> String -> JS_IO Ptr)
                                                        (toRef ctx) image repetition

beginPath : CanvasRenderingContext2D -> JS_IO ()
beginPath ctx = jscall "%0.beginPath()" (Ptr -> JS_IO ()) (toRef ctx)

closePath : CanvasRenderingContext2D -> JS_IO ()
closePath ctx = jscall "%0.closePath()" (Ptr -> JS_IO ()) (toRef ctx)

moveTo : Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
moveTo x y ctx = jscall "%0.moveTo(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

lineTo : Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
lineTo x y ctx = jscall "%0.lineTo(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

bezierCurveTo : Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
bezierCurveTo cp1x cp1y cp2x cp2y x y ctx = jscall "%0.bezierCurveTo(%1, %2, %3, %4, %5, %6)"
                                                   (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                   (toRef ctx) cp1x cp1y cp2x cp2y x y

quadraticCurveTo : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
quadraticCurveTo cpx cpy x y ctx = jscall "%0.quadraticCurveTo(%1, %2, %3, %4)"
                                          (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                          (toRef ctx) cpx cpy x y

arc : Double -> Double -> Double -> Double -> Double -> Bool -> CanvasRenderingContext2D -> JS_IO ()
arc x y radius startAngle endAngle anticlockwise ctx = jscall "%0.arc(%1, %2, %3, %4, %5, %6)"
                                                              (Ptr -> Double -> Double -> Double -> Double -> Double -> Ptr -> JS_IO ())
                                                              (toRef ctx) x y radius startAngle endAngle (toRef anticlockwise)

arcTo : Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
arcTo x1 y1 x2 y2 radius ctx = jscall "%0.arcTo(%1, %2, %3, %4, %5)"
                                      (Ptr -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                      (toRef ctx) x1 y1 x2 y2 radius

rect : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
rect x y width height ctx = jscall "%0.rect(%1, %2, %3, %4)"
                                   (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                   (toRef ctx) x y width height

FillRuleNonZero : String
FillRuleNonZero = "nonzero"

FillRuleEvenOdd : String
FillRuleEvenOdd = "evenodd"

namespace fillV1

    fill : CanvasRenderingContext2D -> JS_IO ()
    fill ctx = jscall "%0.fill()" (Ptr -> JS_IO ()) (toRef ctx)

namespace fillV2

    fill : String -> CanvasRenderingContext2D -> JS_IO ()
    fill fillRule ctx = jscall "%0.fill(%1)" (Ptr -> String -> JS_IO ()) (toRef ctx) fillRule

stroke : CanvasRenderingContext2D -> JS_IO ()
stroke ctx = jscall "%0.stroke()" (Ptr -> JS_IO ()) (toRef ctx)

drawFocusIfNeeded : JSRef -> CanvasRenderingContext2D -> JS_IO ()
drawFocusIfNeeded element ctx = jscall "%0.drawFocusIfNeeded(%1)" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) element

clip : String -> CanvasRenderingContext2D -> JS_IO ()
clip fillRule ctx = jscall "%0.clip(%1)" (Ptr -> String -> JS_IO ()) (toRef ctx) fillRule

isPointInPath : Double -> Double -> String -> CanvasRenderingContext2D -> JS_IO Int
isPointInPath x y fillRule ctx = jscall "%0.isPointInPath(%1, %2, %3)"
                                        (Ptr -> Double -> Double -> String -> JS_IO Int)
                                        (toRef ctx) x y fillRule

isPointInStroke : Double -> Double -> CanvasRenderingContext2D -> JS_IO Int
isPointInStroke x y ctx = jscall "%0.isPointInStroke(%1, %2)" (Ptr -> Double -> Double -> JS_IO Int) (toRef ctx) x y

rotate : Double -> CanvasRenderingContext2D -> JS_IO ()
rotate angle ctx = jscall "%0.rotate(%1, %2)" (Ptr -> Double -> JS_IO ()) (toRef ctx) angle

scale : Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
scale x y ctx = jscall "%0.scale(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

translate : Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
translate x y ctx = jscall "%0.translate(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

transform : Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
transform m11 m12 m21 m22 dx dy ctx = jscall "%0.transform(%1, %2, %3, %4, %5, %6)"
                                             (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                             (toRef ctx) m11 m12 m21 m22 dx dy

setTransform : Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
setTransform m11 m12 m21 m22 dx dy ctx = jscall "%0.setTransform(%1, %2, %3, %4, %5, %6)"
                                             (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                             (toRef ctx) m11 m12 m21 m22 dx dy

drawImage : JSRef -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
drawImage image sx sy sWidth sHeight dx dy dWidth dHeight ctx = jscall "%0.drawImage(%1, %2, %3, %4, %5, %6, %7, %8, %9)"
                                                                       (Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                                       (toRef ctx) image sx sy sWidth sHeight dx dy dWidth dHeight

namespace ImageDataV1

    createImageData : ImageData -> CanvasRenderingContext2D -> JS_IO JSRef
    createImageData imagedata ctx = jscall "%0.createImageData(%1)" (Ptr -> Ptr -> JS_IO Ptr) (toRef ctx) (toRef imagedata)

namespace ImageDataV2

    createImageData : Double -> Double -> CanvasRenderingContext2D -> JS_IO JSRef
    createImageData width height ctx = jscall "%0.createImageData2(%1, %2)" (Ptr -> Double -> Double -> JS_IO Ptr) (toRef ctx) width height

getImageData : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ImageData
getImageData sx sy sw sh ctx = fromIORef $ jscall "%0.getImageData(%1, %2, %3, %4)"
                                                  (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                                  (toRef ctx) sx sy sw sh

putImageData : ImageData -> Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
putImageData imageData dx dy dirtyX dirtyY dirtyWidth dirtyHeight ctx = jscall "%0.putImageData(%1, %2, %3, %4, %5, %6, %7)"
                                                                               (Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                                               (toRef ctx) (toRef imageData) dx dy dirtyX dirtyY dirtyWidth dirtyHeight

save : CanvasRenderingContext2D -> JS_IO ()
save ctx = jscall "%0.save()" (Ptr -> JS_IO ()) (toRef ctx)

restore : CanvasRenderingContext2D -> JS_IO ()
restore ctx = jscall "%0.restore()" (Ptr -> JS_IO ()) (toRef ctx)

getLineWidth : CanvasRenderingContext2D -> JS_IO Double
getLineWidth ctx = jscall "%0.lineWidth" (Ptr -> JS_IO Double) (toRef ctx)

setLineWidth : Double -> CanvasRenderingContext2D -> JS_IO ()
setLineWidth value ctx = jscall "%0.lineWidth = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

LineCapButt : String
LineCapButt = "butt"

LineCapRound : String
LineCapRound = "round"

LineCapSquare : String
LineCapSquare = "square"

getLineCap : CanvasRenderingContext2D -> JS_IO String
getLineCap ctx = jscall "%0.lineCap" (Ptr -> JS_IO String) (toRef ctx)

setLineCap : String -> CanvasRenderingContext2D -> JS_IO ()
setLineCap option ctx = jscall "%0.lineCap = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

LineJoinBevel : String
LineJoinBevel = "bevel"

LineJoinRound : String
LineJoinRound = "round"

LineJoinMiter : String
LineJoinMiter = "miter"

getLineJoin : CanvasRenderingContext2D -> JS_IO String
getLineJoin ctx = jscall "%0.lineJoin" (Ptr -> JS_IO String) (toRef ctx)

setLineJoin : String -> CanvasRenderingContext2D -> JS_IO ()
setLineJoin option ctx = jscall "%0.lineJoin = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

getMiterLimit : CanvasRenderingContext2D -> JS_IO Double
getMiterLimit ctx = jscall "%0.miterLimit" (Ptr -> JS_IO Double) (toRef ctx)

setMiterLimit : Double -> CanvasRenderingContext2D -> JS_IO ()
setMiterLimit value ctx = jscall "%0.miterLimit = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

getLineDashOffset : CanvasRenderingContext2D -> JS_IO Double
getLineDashOffset ctx = jscall "%0.lineDashOffset" (Ptr -> JS_IO Double) (toRef ctx)

setLineDashOffset : Double -> CanvasRenderingContext2D -> JS_IO ()
setLineDashOffset value ctx = jscall "%0.lineDashOffset = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

getFont : CanvasRenderingContext2D -> JS_IO String
getFont ctx = jscall "%0.font" (Ptr -> JS_IO String) (toRef ctx)

setFont : String -> CanvasRenderingContext2D -> JS_IO ()
setFont value ctx = jscall "%0.font = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) value

TextAlignLeft : String
TextAlignLeft = "left"

TextAlignRight : String
TextAlignRight = "right"

TextAlignCenter : String
TextAlignCenter = "center"

TextAlignStart : String
TextAlignStart = "start"

TextAlignEnd : String
TextAlignEnd = "end"

getTextAlign : CanvasRenderingContext2D -> JS_IO String
getTextAlign ctx = jscall "%0.textAlign" (Ptr -> JS_IO String) (toRef ctx)

setTextAlign : String -> CanvasRenderingContext2D -> JS_IO ()
setTextAlign option ctx = jscall "%0.textAlign = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

TextBaselineTop : String
TextBaselineTop = "top"

TextBaselineHanging : String
TextBaselineHanging = "hanging"

TextBaselineMiddle : String
TextBaselineMiddle = "middle"

TextBaselineAlphabetic : String
TextBaselineAlphabetic = "alphabetic"

TextBaselineIdeographic : String
TextBaselineIdeographic = "ideographic"

TextBaselineBottom : String
TextBaselineBottom = "bottom"

getTextBaseline : CanvasRenderingContext2D -> JS_IO String
getTextBaseline ctx = jscall "%0.textBaseline" (Ptr -> JS_IO String) (toRef ctx)

setTextBaseline : String -> CanvasRenderingContext2D -> JS_IO ()
setTextBaseline option ctx = jscall "%0.textBaseline = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

rgbColor : Int -> Int -> Int -> String
rgbColor r g b = unsafePerformIO $ jscall "'rgb('+%0 +', '+%1+', '+%2+')'"
                                              (Int -> Int -> Int -> JS_IO String)
                                              r g b

rgbColor' : Int -> Int -> Int -> String
rgbColor' r g b = unsafePerformIO $ jscall "'rgb('+%0 +'%, '+%1+'%, '+%2+'%)'"
                                               (Int -> Int -> Int -> JS_IO String)
                                               r g b

rgbaColor : Int -> Int -> Int -> Double -> String
rgbaColor r g b a = unsafePerformIO $ jscall "'rgba('+%0 +', '+%1+', '+%2+', '+%3+')'"
                                                  (Int -> Int -> Int -> Double -> JS_IO String)
                                                  r g b a
rgbaColor' : Int -> Int -> Int -> Int -> String
rgbaColor' r g b a = unsafePerformIO $ jscall "'rgb('+%0 +', '+%1+', '+%2+', '+%3+'%)'"
                                                   (Int -> Int -> Int -> Int -> JS_IO String)
                                                   r g b a

namespace RGBColor

    getFillStyle : CanvasRenderingContext2D -> JS_IO String
    getFillStyle ctx = jscall "%0.fillStyle" (Ptr -> JS_IO String) (toRef ctx)

    setFillStyle : String -> CanvasRenderingContext2D -> JS_IO ()
    setFillStyle option ctx = jscall "%0.fillStyle = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

    getStrokeStyle : CanvasRenderingContext2D -> JS_IO String
    getStrokeStyle ctx = jscall "%0.strokeStyle" (Ptr -> JS_IO String) (toRef ctx)

    setStrokeStyle : String -> CanvasRenderingContext2D -> JS_IO ()
    setStrokeStyle option ctx = jscall "%0.strokeStyle = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace CanvasGradient

    getFillStyle : CanvasRenderingContext2D -> JS_IO CanvasGradient
    getFillStyle ctx = fromIORef $ jscall "%0.fillStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    setFillStyle : CanvasGradient -> CanvasRenderingContext2D -> JS_IO ()
    setFillStyle option ctx = jscall "%0.fillStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) (toRef option)

    getStrokeStyle : CanvasRenderingContext2D -> JS_IO CanvasGradient
    getStrokeStyle ctx = fromIORef $ jscall "%0.strokeStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    setStrokeStyle : CanvasGradient -> CanvasRenderingContext2D -> JS_IO ()
    setStrokeStyle option ctx = jscall "%0.strokeStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) (toRef option)

namespace CanvasPattern

    getFillStyle : CanvasRenderingContext2D -> JS_IO CanvasPattern
    getFillStyle ctx = fromIORef $ jscall "%0.fillStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    setFillStyle : CanvasPattern -> CanvasRenderingContext2D -> JS_IO ()
    setFillStyle option ctx = jscall "%0.fillStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) (toRef option)

    getStrokeStyle : CanvasRenderingContext2D -> JS_IO CanvasPattern
    getStrokeStyle ctx = fromIORef $ jscall "%0.strokeStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    setStrokeStyle : CanvasPattern -> CanvasRenderingContext2D -> JS_IO ()
    setStrokeStyle option ctx = jscall "%0.strokeStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) (toRef option)

getShadowBlur : CanvasRenderingContext2D -> JS_IO Double
getShadowBlur ctx = jscall "%0.shadowBlur" (Ptr -> JS_IO Double) (toRef ctx)

setShadowBlur : Double -> CanvasRenderingContext2D -> JS_IO ()
setShadowBlur level ctx = jscall "%0.shadowBlur = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) level

getShadowColor : CanvasRenderingContext2D -> JS_IO String
getShadowColor ctx = jscall "%0.shadowColor" (Ptr -> JS_IO String) (toRef ctx)

setShadowColor : String -> CanvasRenderingContext2D -> JS_IO ()
setShadowColor color ctx = jscall "%0.shadowColor = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) color

getShadowOffsetX : CanvasRenderingContext2D -> JS_IO Double
getShadowOffsetX ctx = jscall "%0.shadowOffsetX" (Ptr -> JS_IO Double) (toRef ctx)

setShadowOffsetX : Double -> CanvasRenderingContext2D -> JS_IO ()
setShadowOffsetX offset ctx = jscall "%0.shadowOffsetX = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) offset

getShadowOffsetY : CanvasRenderingContext2D -> JS_IO Double
getShadowOffsetY ctx = jscall "%0.shadowOffsetY" (Ptr -> JS_IO Double) (toRef ctx)

setShadowOffsetY : Double -> CanvasRenderingContext2D -> JS_IO ()
setShadowOffsetY offset ctx = jscall "%0.shadowOffsetY = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) offset

getGlobalAlpha : CanvasRenderingContext2D -> JS_IO Double
getGlobalAlpha ctx = jscall "%0.globalAlpha" (Ptr -> JS_IO Double) (toRef ctx)

setGlobalAlpha : Double -> CanvasRenderingContext2D -> JS_IO ()
setGlobalAlpha value ctx = jscall "%0.globalAlpha = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

getGlobalCompositeOperation : CanvasRenderingContext2D -> JS_IO String
getGlobalCompositeOperation ctx = jscall "%0.globalCompositeOperation" (Ptr -> JS_IO String) (toRef ctx)

setGlobalCompositeOperation : String -> CanvasRenderingContext2D -> JS_IO ()
setGlobalCompositeOperation type ctx = jscall "%0.globalCompositeOperation = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) type

getCanvas : CanvasRenderingContext2D -> JS_IO JSRef
getCanvas ctx = jscall "%0.canvas" (Ptr -> JS_IO Ptr) (toRef ctx)
