module IdrisCanvas.CanvasRenderingContext2D

import IdrisCanvas.Js

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

clearRect : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> JS_IO ()
clearRect ctx x y width height = jscall "%0.clearRect(%1, %2, %3, %4)"
                                        (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                        (toRef ctx) x y width height

fillRect : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> JS_IO ()
fillRect ctx x y width height = jscall "%0.fillRect(%1, %2, %3, %4)"
                                       (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                       (toRef ctx) x y width height

strokeRect : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> JS_IO ()
strokeRect ctx x y width height = jscall "%0.strokeRect(%1, %2, %3, %4)"
                                         (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                         (toRef ctx) x y width height

fillText : CanvasRenderingContext2D -> String -> Double -> Double -> Double -> JS_IO ()
fillText ctx text x y maxWidth = jscall "%0.fillText(%1, %2, %3, %4)"
                                        (Ptr -> String -> Double -> Double -> Double -> JS_IO ())
                                        (toRef ctx) text x y maxWidth

strokeText : CanvasRenderingContext2D -> String -> Double -> Double -> Double -> JS_IO ()
strokeText ctx text x y maxWidth = jscall "%0.strokeText(%1, %2, %3, %4)"
                                          (Ptr -> String -> Double -> Double -> Double -> JS_IO ())
                                          (toRef ctx) text x y maxWidth

measureText : CanvasRenderingContext2D -> String -> JS_IO JSRef
measureText ctx text = jscall "%0.measureText(%1)" (Ptr -> String -> JS_IO Ptr) (toRef ctx) text

getLineDash : CanvasRenderingContext2D -> JS_IO JSRef
getLineDash ctx = jscall "%0.getLineDash()" (Ptr -> JS_IO Ptr) (toRef ctx)

setLineDash : CanvasRenderingContext2D -> JSRef -> JS_IO ()
setLineDash ctx segments = jscall "%0.setLineDash(%1)" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) segments

createLinearGradient : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> JS_IO JSRef
createLinearGradient ctx x0 y0 x1 y1 = jscall "%0.createLinearGradient(%1, %2, %3, %4)"
                                              (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                              (toRef ctx) x0 y0 x1 y1

createRadialGradient : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO JSRef
createRadialGradient ctx x0 y0 r0 x1 y1 r1 = jscall "%0.createRadialGradient(%1, %2, %3, %4, %5, %6)"
                                                    (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                                    (toRef ctx) x0 y0 r0 x1 y1 r1

createPattern : CanvasRenderingContext2D -> JSRef -> String -> JS_IO JSRef
createPattern ctx image repetition = jscall "%0.createPattern(%1, %2)"
                                            (Ptr -> Ptr -> String -> JS_IO Ptr)
                                            (toRef ctx) image repetition

beginPath : CanvasRenderingContext2D -> JS_IO ()
beginPath ctx = jscall "%0.beginPath()" (Ptr -> JS_IO ()) (toRef ctx)

closePath : CanvasRenderingContext2D -> JS_IO ()
closePath ctx = jscall "%0.closePath()" (Ptr -> JS_IO ()) (toRef ctx)

moveTo : CanvasRenderingContext2D -> Double -> Double -> JS_IO ()
moveTo ctx x y = jscall "%0.moveTo(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

lineTo : CanvasRenderingContext2D -> Double -> Double -> JS_IO ()
lineTo ctx x y = jscall "%0.lineTo(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

bezierCurveTo : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
bezierCurveTo ctx cp1x cp1y cp2x cp2y x y = jscall "%0.bezierCurveTo(%1, %2, %3, %4, %5, %6)"
                                                   (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                   (toRef ctx) cp1x cp1y cp2x cp2y x y

quadraticCurveTo : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> JS_IO ()
quadraticCurveTo ctx cpx cpy x y = jscall "%0.quadraticCurveTo(%1, %2, %3, %4)"
                                          (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                          (toRef ctx) cpx cpy x y

arc : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> Double -> Int -> JS_IO ()
arc ctx x y radius startAngle endAngle anticlockwise = jscall "%0.arc(%1, %2, %3, %4, %5, %6)"
                                                              (Ptr -> Double -> Double -> Double -> Double -> Double -> Int -> JS_IO ())
                                                              (toRef ctx) x y radius startAngle endAngle anticlockwise

arcTo : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
arcTo ctx x1 y1 x2 y2 radius = jscall "%0.arcTo(%1, %2, %3, %4, %5)"
                                      (Ptr -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                      (toRef ctx) x1 y1 x2 y2 radius

rect : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> JS_IO ()
rect ctx x y width height = jscall "%0.rect(%1, %2, %3, %4)"
                                   (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                   (toRef ctx) x y width height

fill : CanvasRenderingContext2D -> String -> JS_IO ()
fill ctx fillRule = jscall "%0.fill(%1)" (Ptr -> String -> JS_IO ()) (toRef ctx) fillRule

stroke : CanvasRenderingContext2D -> JS_IO ()
stroke ctx = jscall "%0.stroke()" (Ptr -> JS_IO ()) (toRef ctx)

drawFocusIfNeeded : CanvasRenderingContext2D -> JSRef -> JS_IO ()
drawFocusIfNeeded ctx element = jscall "%0.drawFocusIfNeeded(%1)" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) element

clip : CanvasRenderingContext2D -> String -> JS_IO ()
clip ctx fillRule = jscall "%0.clip(%1)" (Ptr -> String -> JS_IO ()) (toRef ctx) fillRule

isPointInPath : CanvasRenderingContext2D -> Double -> Double -> String -> JS_IO Int
isPointInPath ctx x y fillRule = jscall "%0.isPointInPath(%1, %2, %3)"
                                        (Ptr -> Double -> Double -> String -> JS_IO Int)
                                        (toRef ctx) x y fillRule

isPointInStroke : CanvasRenderingContext2D -> Double -> Double -> JS_IO Int
isPointInStroke ctx x y = jscall "%0.isPointInStroke(%1, %2)" (Ptr -> Double -> Double -> JS_IO Int) (toRef ctx) x y

rotate : CanvasRenderingContext2D -> Double -> JS_IO ()
rotate ctx angle = jscall "%0.rotate(%1, %2)" (Ptr -> Double -> JS_IO ()) (toRef ctx) angle

scale : CanvasRenderingContext2D -> Double -> Double -> JS_IO ()
scale ctx x y = jscall "%0.scale(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

translate : CanvasRenderingContext2D -> Double -> Double -> JS_IO ()
translate ctx x y = jscall "%0.translate(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) (toRef ctx) x y

transform : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
transform ctx m11 m12 m21 m22 dx dy = jscall "%0.transform(%1, %2, %3, %4, %5, %6)"
                                             (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                             (toRef ctx) m11 m12 m21 m22 dx dy

setTransform : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
setTransform ctx m11 m12 m21 m22 dx dy = jscall "%0.setTransform(%1, %2, %3, %4, %5, %6)"
                                             (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                             (toRef ctx) m11 m12 m21 m22 dx dy

drawImage : CanvasRenderingContext2D -> JSRef -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
drawImage ctx image sx sy sWidth sHeight dx dy dWidth dHeight = jscall "%0.drawImage(%1, %2, %3, %4, %5, %6, %7, %8, %9)"
                                                                       (Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                                       (toRef ctx) image sx sy sWidth sHeight dx dy dWidth dHeight

createImageData : CanvasRenderingContext2D -> JSRef -> JS_IO JSRef
createImageData ctx imagedata = jscall "%0.createImageData(%1)" (Ptr -> Ptr -> JS_IO Ptr) (toRef ctx) imagedata

createImageData2 : CanvasRenderingContext2D -> Double -> Double -> JS_IO JSRef
createImageData2 ctx width height = jscall "%0.createImageData2(%1, %2)" (Ptr -> Double -> Double -> JS_IO Ptr) (toRef ctx) width height

getImageData : CanvasRenderingContext2D -> Double -> Double -> Double -> Double -> JS_IO JSRef
getImageData ctx sx sy sw sh = jscall "%0.getImageData(%1, %2, %3, %4)"
                                      (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                      (toRef ctx) sx sy sw sh

putImageData : CanvasRenderingContext2D -> JSRef -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
putImageData ctx imageData dx dy dirtyX dirtyY dirtyWidth dirtyHeight = jscall "%0.putImageData(%1, %2, %3, %4, %5, %6, %7)"
                                                                               (Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                                               (toRef ctx) imageData dx dy dirtyX dirtyY dirtyWidth dirtyHeight

save : CanvasRenderingContext2D -> JS_IO ()
save ctx = jscall "%0.save()" (Ptr -> JS_IO ()) (toRef ctx)

restore : CanvasRenderingContext2D -> JS_IO ()
restore ctx = jscall "%0.restore()" (Ptr -> JS_IO ()) (toRef ctx)

namespace lineWidth

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.lineWidth" (Ptr -> JS_IO Double) (toRef ctx)

    set : CanvasRenderingContext2D -> Double -> JS_IO ()
    set ctx value = jscall "%0.lineWidth = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace lineCap

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.lineCap" (Ptr -> JS_IO String) (toRef ctx)

    set : CanvasRenderingContext2D -> String -> JS_IO ()
    set ctx option = jscall "%0.lineCap = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace lineJoin

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.lineJoin" (Ptr -> JS_IO String) (toRef ctx)

    set : CanvasRenderingContext2D -> String -> JS_IO ()
    set ctx option = jscall "%0.lineJoin = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace miterLimit

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.miterLimit" (Ptr -> JS_IO Double) (toRef ctx)

    set : CanvasRenderingContext2D -> Double -> JS_IO ()
    set ctx value = jscall "%0.miterLimit = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace lineDashOffset

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.lineDashOffset" (Ptr -> JS_IO Double) (toRef ctx)

    set : CanvasRenderingContext2D -> Double -> JS_IO ()
    set ctx value = jscall "%0.lineDashOffset = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace font

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.font" (Ptr -> JS_IO Ptr) (toRef ctx)

    set : CanvasRenderingContext2D -> JSRef -> JS_IO ()
    set ctx value = jscall "%0.font = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) value

namespace textAlign

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.textAlign" (Ptr -> JS_IO String) (toRef ctx)

    set : CanvasRenderingContext2D -> String -> JS_IO ()
    set ctx option = jscall "%0.textAlign = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace textBaseline

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.textBaseline" (Ptr -> JS_IO String) (toRef ctx)

    set : CanvasRenderingContext2D -> String -> JS_IO ()
    set ctx option = jscall "%0.textBaseline = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace fillStyle

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.fillStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    set : CanvasRenderingContext2D -> JSRef -> JS_IO ()
    set ctx option = jscall "%0.fillStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) option

namespace strokeStyle

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.strokeStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    set : CanvasRenderingContext2D -> JSRef -> JS_IO ()
    set ctx option = jscall "%0.strokeStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) option

namespace shadowBlur

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.shadowBlur" (Ptr -> JS_IO Double) (toRef ctx)

    set : CanvasRenderingContext2D -> Double -> JS_IO ()
    set ctx level = jscall "%0.shadowBlur = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) level

namespace shadowColor

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.shadowColor" (Ptr -> JS_IO String) (toRef ctx)

    set : CanvasRenderingContext2D -> String -> JS_IO ()
    set ctx color = jscall "%0.shadowColor = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) color

namespace shadowOffsetX

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.shadowOffsetX" (Ptr -> JS_IO Double) (toRef ctx)

    set : CanvasRenderingContext2D -> Double -> JS_IO ()
    set ctx offset = jscall "%0.shadowOffsetX = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) offset

namespace shadowOffsetY

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.shadowOffsetY" (Ptr -> JS_IO Double) (toRef ctx)

    set : CanvasRenderingContext2D -> Double -> JS_IO ()
    set ctx offset = jscall "%0.shadowOffsetY = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) offset

namespace globalAlpha

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.globalAlpha" (Ptr -> JS_IO Double) (toRef ctx)

    set : CanvasRenderingContext2D -> Double -> JS_IO ()
    set ctx value = jscall "%0.globalAlpha = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace globalCompositeOperation

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.globalCompositeOperation" (Ptr -> JS_IO String) (toRef ctx)

    set : CanvasRenderingContext2D -> String -> JS_IO ()
    set ctx type = jscall "%0.globalCompositeOperation = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) type

namespace canvas

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.canvas" (Ptr -> JS_IO Ptr) (toRef ctx)
