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

measureText : String -> CanvasRenderingContext2D -> JS_IO JSRef
measureText text ctx = jscall "%0.measureText(%1)" (Ptr -> String -> JS_IO Ptr) (toRef ctx) text

getLineDash : CanvasRenderingContext2D -> JS_IO JSRef
getLineDash ctx = jscall "%0.getLineDash()" (Ptr -> JS_IO Ptr) (toRef ctx)

setLineDash : JSRef -> CanvasRenderingContext2D -> JS_IO ()
setLineDash segments ctx = jscall "%0.setLineDash(%1)" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) segments

createLinearGradient : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO JSRef
createLinearGradient x0 y0 x1 y1 ctx = jscall "%0.createLinearGradient(%1, %2, %3, %4)"
                                              (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                              (toRef ctx) x0 y0 x1 y1

createRadialGradient : Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO JSRef
createRadialGradient x0 y0 r0 x1 y1 r1 ctx = jscall "%0.createRadialGradient(%1, %2, %3, %4, %5, %6)"
                                                    (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                                    (toRef ctx) x0 y0 r0 x1 y1 r1

createPattern : JSRef -> String -> CanvasRenderingContext2D -> JS_IO JSRef
createPattern image repetition ctx = jscall "%0.createPattern(%1, %2)"
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

arc : Double -> Double -> Double -> Double -> Double -> Int -> CanvasRenderingContext2D -> JS_IO ()
arc x y radius startAngle endAngle anticlockwise ctx = jscall "%0.arc(%1, %2, %3, %4, %5, %6)"
                                                              (Ptr -> Double -> Double -> Double -> Double -> Double -> Int -> JS_IO ())
                                                              (toRef ctx) x y radius startAngle endAngle anticlockwise

arcTo : Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
arcTo x1 y1 x2 y2 radius ctx = jscall "%0.arcTo(%1, %2, %3, %4, %5)"
                                      (Ptr -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                      (toRef ctx) x1 y1 x2 y2 radius

rect : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
rect x y width height ctx = jscall "%0.rect(%1, %2, %3, %4)"
                                   (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                   (toRef ctx) x y width height

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

createImageData : JSRef -> CanvasRenderingContext2D -> JS_IO JSRef
createImageData imagedata ctx = jscall "%0.createImageData(%1)" (Ptr -> Ptr -> JS_IO Ptr) (toRef ctx) imagedata

createImageData2 : Double -> Double -> CanvasRenderingContext2D -> JS_IO JSRef
createImageData2 width height ctx = jscall "%0.createImageData2(%1, %2)" (Ptr -> Double -> Double -> JS_IO Ptr) (toRef ctx) width height

getImageData : Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO JSRef
getImageData sx sy sw sh ctx = jscall "%0.getImageData(%1, %2, %3, %4)"
                                      (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                      (toRef ctx) sx sy sw sh

putImageData : JSRef -> Double -> Double -> Double -> Double -> Double -> Double -> CanvasRenderingContext2D -> JS_IO ()
putImageData imageData dx dy dirtyX dirtyY dirtyWidth dirtyHeight ctx = jscall "%0.putImageData(%1, %2, %3, %4, %5, %6, %7)"
                                                                               (Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                                               (toRef ctx) imageData dx dy dirtyX dirtyY dirtyWidth dirtyHeight

save : CanvasRenderingContext2D -> JS_IO ()
save ctx = jscall "%0.save()" (Ptr -> JS_IO ()) (toRef ctx)

restore : CanvasRenderingContext2D -> JS_IO ()
restore ctx = jscall "%0.restore()" (Ptr -> JS_IO ()) (toRef ctx)

namespace lineWidth

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.lineWidth" (Ptr -> JS_IO Double) (toRef ctx)

    set : Double -> CanvasRenderingContext2D -> JS_IO ()
    set value ctx = jscall "%0.lineWidth = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace lineCap

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.lineCap" (Ptr -> JS_IO String) (toRef ctx)

    set : String -> CanvasRenderingContext2D -> JS_IO ()
    set option ctx = jscall "%0.lineCap = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace lineJoin

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.lineJoin" (Ptr -> JS_IO String) (toRef ctx)

    set : String -> CanvasRenderingContext2D -> JS_IO ()
    set option ctx = jscall "%0.lineJoin = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace miterLimit

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.miterLimit" (Ptr -> JS_IO Double) (toRef ctx)

    set : Double -> CanvasRenderingContext2D -> JS_IO ()
    set value ctx = jscall "%0.miterLimit = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace lineDashOffset

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.lineDashOffset" (Ptr -> JS_IO Double) (toRef ctx)

    set : Double -> CanvasRenderingContext2D -> JS_IO ()
    set value ctx = jscall "%0.lineDashOffset = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace font

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.font" (Ptr -> JS_IO Ptr) (toRef ctx)

    set : JSRef -> CanvasRenderingContext2D -> JS_IO ()
    set value ctx = jscall "%0.font = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) value

namespace textAlign

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.textAlign" (Ptr -> JS_IO String) (toRef ctx)

    set : String -> CanvasRenderingContext2D -> JS_IO ()
    set option ctx = jscall "%0.textAlign = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace textBaseline

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.textBaseline" (Ptr -> JS_IO String) (toRef ctx)

    set : String -> CanvasRenderingContext2D -> JS_IO ()
    set option ctx = jscall "%0.textBaseline = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) option

namespace fillStyle

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.fillStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    set : JSRef -> CanvasRenderingContext2D -> JS_IO ()
    set option ctx = jscall "%0.fillStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) option

namespace strokeStyle

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.strokeStyle" (Ptr -> JS_IO Ptr) (toRef ctx)

    set : JSRef -> CanvasRenderingContext2D -> JS_IO ()
    set option ctx = jscall "%0.strokeStyle = %1" (Ptr -> Ptr -> JS_IO ()) (toRef ctx) option

namespace shadowBlur

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.shadowBlur" (Ptr -> JS_IO Double) (toRef ctx)

    set : Double -> CanvasRenderingContext2D -> JS_IO ()
    set level ctx = jscall "%0.shadowBlur = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) level

namespace shadowColor

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.shadowColor" (Ptr -> JS_IO String) (toRef ctx)

    set : String -> CanvasRenderingContext2D -> JS_IO ()
    set color ctx = jscall "%0.shadowColor = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) color

namespace shadowOffsetX

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.shadowOffsetX" (Ptr -> JS_IO Double) (toRef ctx)

    set : Double -> CanvasRenderingContext2D -> JS_IO ()
    set offset ctx = jscall "%0.shadowOffsetX = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) offset

namespace shadowOffsetY

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.shadowOffsetY" (Ptr -> JS_IO Double) (toRef ctx)

    set : Double -> CanvasRenderingContext2D -> JS_IO ()
    set offset ctx = jscall "%0.shadowOffsetY = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) offset

namespace globalAlpha

    get : CanvasRenderingContext2D -> JS_IO Double
    get ctx = jscall "%0.globalAlpha" (Ptr -> JS_IO Double) (toRef ctx)

    set : Double -> CanvasRenderingContext2D -> JS_IO ()
    set value ctx = jscall "%0.globalAlpha = %1" (Ptr -> Double -> JS_IO ()) (toRef ctx) value

namespace globalCompositeOperation

    get : CanvasRenderingContext2D -> JS_IO String
    get ctx = jscall "%0.globalCompositeOperation" (Ptr -> JS_IO String) (toRef ctx)

    set : String -> CanvasRenderingContext2D -> JS_IO ()
    set type ctx = jscall "%0.globalCompositeOperation = %1" (Ptr -> String -> JS_IO ()) (toRef ctx) type

namespace canvas

    get : CanvasRenderingContext2D -> JS_IO JSRef
    get ctx = jscall "%0.canvas" (Ptr -> JS_IO Ptr) (toRef ctx)
