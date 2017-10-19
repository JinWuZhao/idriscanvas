module IdrisCanvas.CanvasRenderingContext2D.Raw

import IdrisCanvas.Tools

%access public export

clearRect : Ptr -> Double -> Double -> Double -> Double -> JS_IO ()
clearRect ctx x y width height = jscall "%0.clearRect(%1, %2, %3, %4)"
                                        (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                        ctx x y width height

fillRect : Ptr -> Double -> Double -> Double -> Double -> JS_IO ()
fillRect ctx x y width height = jscall "%0.fillRect(%1, %2, %3, %4)"
                                       (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                       ctx x y width height

strokeRect : Ptr -> Double -> Double -> Double -> Double -> JS_IO ()
strokeRect ctx x y width height = jscall "%0.strokeRect(%1, %2, %3, %4)"
                                         (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                         ctx x y width height

fillText : Ptr -> String -> Double -> Double -> Double -> JS_IO ()
fillText ctx text x y maxWidth = jscall "%0.fillText(%1, %2, %3, %4)"
                                        (Ptr -> String -> Double -> Double -> Double -> JS_IO ())
                                        ctx text x y maxWidth

strokeText : Ptr -> String -> Double -> Double -> Double -> JS_IO ()
strokeText ctx text x y maxWidth = jscall "%0.strokeText(%1, %2, %3, %4)"
                                          (Ptr -> String -> Double -> Double -> Double -> JS_IO ())
                                          ctx text x y maxWidth

measureText : Ptr -> String -> JS_IO Ptr
measureText ctx text = jscall "%0.measureText(%1)" (Ptr -> String -> JS_IO Ptr) ctx text

getLineDash : Ptr -> JS_IO Ptr
getLineDash ctx = jscall "%0.getLineDash()" (Ptr -> JS_IO Ptr) ctx

setLineDash : Ptr -> Ptr -> JS_IO ()
setLineDash ctx segments = jscall "%0.setLineDash(%1)" (Ptr -> Ptr -> JS_IO ()) ctx segments

createLinearGradient : Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr
createLinearGradient ctx x0 y0 x1 y1 = jscall "%0.createLinearGradient(%1, %2, %3, %4)"
                                              (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                              ctx x0 y0 x1 y1

createRadialGradient : Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO Ptr
createRadialGradient ctx x0 y0 r0 x1 y1 r1 = jscall "%0.createRadialGradient(%1, %2, %3, %4, %5, %6)"
                                                    (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                                    ctx x0 y0 r0 x1 y1 r1

createPattern : Ptr -> Ptr -> String -> JS_IO Ptr
createPattern ctx image repetition = jscall "%0.createPattern(%1, %2)"
                                            (Ptr -> Ptr -> String -> JS_IO Ptr)
                                            ctx image repetition

beginPath : Ptr -> JS_IO ()
beginPath ctx = jscall "%0.beginPath()" (Ptr -> JS_IO ()) ctx

closePath : Ptr -> JS_IO ()
closePath ctx = jscall "%0.closePath()" (Ptr -> JS_IO ()) ctx

moveTo : Ptr -> Double -> Double -> JS_IO ()
moveTo ctx x y = jscall "%0.moveTo(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) ctx x y

lineTo : Ptr -> Double -> Double -> JS_IO ()
lineTo ctx x y = jscall "%0.lineTo(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) ctx x y

bezierCurveTo : Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
bezierCurveTo ctx cp1x cp1y cp2x cp2y x y = jscall "%0.bezierCurveTo(%1, %2, %3, %4, %5, %6)"
                                                   (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                   ctx cp1x cp1y cp2x cp2y x y

quadraticCurveTo : Ptr -> Double -> Double -> Double -> Double -> JS_IO ()
quadraticCurveTo ctx cpx cpy x y = jscall "%0.quadraticCurveTo(%1, %2, %3, %4)"
                                          (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                          ctx cpx cpy x y

arc : Ptr -> Double -> Double -> Double -> Double -> Double -> Int -> JS_IO ()
arc ctx x y radius startAngle endAngle anticlockwise = jscall "%0.arc(%1, %2, %3, %4, %5, %6)"
                                                              (Ptr -> Double -> Double -> Double -> Double -> Double -> Int -> JS_IO ())
                                                              ctx x y radius startAngle endAngle anticlockwise

arcTo : Ptr -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
arcTo ctx x1 y1 x2 y2 radius = jscall "%0.arcTo(%1, %2, %3, %4, %5)"
                                      (Ptr -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                      ctx x1 y1 x2 y2 radius

rect : Ptr -> Double -> Double -> Double -> Double -> JS_IO ()
rect ctx x y width height = jscall "%0.rect(%1, %2, %3, %4)"
                                   (Ptr -> Double -> Double -> Double -> Double -> JS_IO ())
                                   ctx x y width height

fill : Ptr -> String -> JS_IO ()
fill ctx fillRule = jscall "%0.fill(%1)" (Ptr -> String -> JS_IO ()) ctx fillRule

stroke : Ptr -> JS_IO ()
stroke ctx = jscall "%0.stroke()" (Ptr -> JS_IO ()) ctx

drawFocusIfNeeded : Ptr -> Ptr -> JS_IO ()
drawFocusIfNeeded ctx element = jscall "%0.drawFocusIfNeeded(%1)" (Ptr -> Ptr -> JS_IO ()) ctx element

clip : Ptr -> String -> JS_IO ()
clip ctx fillRule = jscall "%0.clip(%1)" (Ptr -> String -> JS_IO ()) ctx fillRule

isPointInPath : Ptr -> Double -> Double -> String -> JS_IO Int
isPointInPath ctx x y fillRule = jscall "%0.isPointInPath(%1, %2, %3)"
                                        (Ptr -> Double -> Double -> String -> JS_IO Int)
                                        ctx x y fillRule

isPointInStroke : Ptr -> Double -> Double -> JS_IO Int
isPointInStroke ctx x y = jscall "%0.isPointInStroke(%1, %2)" (Ptr -> Double -> Double -> JS_IO Int) ctx x y

rotate : Ptr -> Double -> JS_IO ()
rotate ctx angle = jscall "%0.rotate(%1, %2)" (Ptr -> Double -> JS_IO ()) ctx angle

scale : Ptr -> Double -> Double -> JS_IO ()
scale ctx x y = jscall "%0.scale(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) ctx x y

translate : Ptr -> Double -> Double -> JS_IO ()
translate ctx x y = jscall "%0.translate(%1, %2)" (Ptr -> Double -> Double -> JS_IO ()) ctx x y

transform : Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
transform ctx m11 m12 m21 m22 dx dy = jscall "%0.transform(%1, %2, %3, %4, %5, %6)"
                                             (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                             ctx m11 m12 m21 m22 dx dy

setTransform : Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
setTransform ctx m11 m12 m21 m22 dx dy = jscall "%0.setTransform(%1, %2, %3, %4, %5, %6)"
                                             (Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                             ctx m11 m12 m21 m22 dx dy

drawImage : Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
drawImage ctx image sx sy sWidth sHeight dx dy dWidth dHeight = jscall "%0.drawImage(%1, %2, %3, %4, %5, %6, %7, %8, %9)"
                                                                       (Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                                       ctx image sx sy sWidth sHeight dx dy dWidth dHeight

createImageData : Ptr -> Ptr -> JS_IO Ptr
createImageData ctx imagedata = jscall "%0.createImageData(%1)" (Ptr -> Ptr -> JS_IO Ptr) ctx imagedata

createImageData2 : Ptr -> Double -> Double -> JS_IO Ptr
createImageData2 ctx width height = jscall "%0.createImageData2(%1, %2)" (Ptr -> Double -> Double -> JS_IO Ptr) ctx width height

getImageData : Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr
getImageData ctx sx sy sw sh = jscall "%0.getImageData(%1, %2, %3, %4)"
                                      (Ptr -> Double -> Double -> Double -> Double -> JS_IO Ptr)
                                      ctx sx sy sw sh

putImageData : Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ()
putImageData ctx imageData dx dy dirtyX dirtyY dirtyWidth dirtyHeight = jscall "%0.putImageData(%1, %2, %3, %4, %5, %6, %7)"
                                                                               (Ptr -> Ptr -> Double -> Double -> Double -> Double -> Double -> Double -> Double -> JS_IO ())
                                                                               ctx imageData dx dy dirtyX dirtyY dirtyWidth dirtyHeight

save : Ptr -> JS_IO ()
save ctx = jscall "%0.save()" (Ptr -> JS_IO ()) ctx

restore : Ptr -> JS_IO ()
restore ctx = jscall "%0.restore()" (Ptr -> JS_IO ()) ctx

namespace lineWidth

    get : Ptr -> JS_IO Double
    get ctx = jscall "%0.lineWidth" (Ptr -> JS_IO Double) ctx

    set : Ptr -> Double -> JS_IO ()
    set ctx value = jscall "%0.lineWidth = %1" (Ptr -> Double -> JS_IO ()) ctx value

namespace lineCap

    get : Ptr -> JS_IO String
    get ctx = jscall "%0.lineCap" (Ptr -> JS_IO String) ctx

    set : Ptr -> String -> JS_IO ()
    set ctx option = jscall "%0.lineCap = %1" (Ptr -> String -> JS_IO ()) ctx option

namespace lineJoin

    get : Ptr -> JS_IO String
    get ctx = jscall "%0.lineJoin" (Ptr -> JS_IO String) ctx

    set : Ptr -> String -> JS_IO ()
    set ctx option = jscall "%0.lineJoin = %1" (Ptr -> String -> JS_IO ()) ctx option

namespace miterLimit

    get : Ptr -> JS_IO Double
    get ctx = jscall "%0.miterLimit" (Ptr -> JS_IO Double) ctx

    set : Ptr -> Double -> JS_IO ()
    set ctx value = jscall "%0.miterLimit = %1" (Ptr -> Double -> JS_IO ()) ctx value

namespace lineDashOffset

    get : Ptr -> JS_IO Double
    get ctx = jscall "%0.lineDashOffset" (Ptr -> JS_IO Double) ctx

    set : Ptr -> Double -> JS_IO ()
    set ctx value = jscall "%0.lineDashOffset = %1" (Ptr -> Double -> JS_IO ()) ctx value

namespace font

    get : Ptr -> JS_IO Ptr
    get ctx = jscall "%0.font" (Ptr -> JS_IO Ptr) ctx

    set : Ptr -> Ptr -> JS_IO ()
    set ctx value = jscall "%0.font = %1" (Ptr -> Ptr -> JS_IO ()) ctx value

namespace textAlign

    get : Ptr -> JS_IO String
    get ctx = jscall "%0.textAlign" (Ptr -> JS_IO String) ctx

    set : Ptr -> String -> JS_IO ()
    set ctx option = jscall "%0.textAlign = %1" (Ptr -> String -> JS_IO ()) ctx option

namespace textBaseline

    get : Ptr -> JS_IO String
    get ctx = jscall "%0.textBaseline" (Ptr -> JS_IO String) ctx

    set : Ptr -> String -> JS_IO ()
    set ctx option = jscall "%0.textBaseline = %1" (Ptr -> String -> JS_IO ()) ctx option

namespace fillStyle

    get : Ptr -> JS_IO Ptr
    get ctx = jscall "%0.fillStyle" (Ptr -> JS_IO Ptr) ctx

    set : Ptr -> Ptr -> JS_IO ()
    set ctx option = jscall "%0.fillStyle = %1" (Ptr -> Ptr -> JS_IO ()) ctx option

namespace strokeStyle

    get : Ptr -> JS_IO Ptr
    get ctx = jscall "%0.strokeStyle" (Ptr -> JS_IO Ptr) ctx

    set : Ptr -> Ptr -> JS_IO ()
    set ctx option = jscall "%0.strokeStyle = %1" (Ptr -> Ptr -> JS_IO ()) ctx option

namespace shadowBlur

    get : Ptr -> JS_IO Double
    get ctx = jscall "%0.shadowBlur" (Ptr -> JS_IO Double) ctx

    set : Ptr -> Double -> JS_IO ()
    set ctx level = jscall "%0.shadowBlur = %1" (Ptr -> Double -> JS_IO ()) ctx level

namespace shadowColor

    get : Ptr -> JS_IO String
    get ctx = jscall "%0.shadowColor" (Ptr -> JS_IO String) ctx

    set : Ptr -> String -> JS_IO ()
    set ctx color = jscall "%0.shadowColor = %1" (Ptr -> String -> JS_IO ()) ctx color

namespace shadowOffsetX

    get : Ptr -> JS_IO Double
    get ctx = jscall "%0.shadowOffsetX" (Ptr -> JS_IO Double) ctx

    set : Ptr -> Double -> JS_IO ()
    set ctx offset = jscall "%0.shadowOffsetX = %1" (Ptr -> Double -> JS_IO ()) ctx offset

namespace shadowOffsetY

    get : Ptr -> JS_IO Double
    get ctx = jscall "%0.shadowOffsetY" (Ptr -> JS_IO Double) ctx

    set : Ptr -> Double -> JS_IO ()
    set ctx offset = jscall "%0.shadowOffsetY = %1" (Ptr -> Double -> JS_IO ()) ctx offset

namespace globalAlpha

    get : Ptr -> JS_IO Double
    get ctx = jscall "%0.globalAlpha" (Ptr -> JS_IO Double) ctx

    set : Ptr -> Double -> JS_IO ()
    set ctx value = jscall "%0.globalAlpha = %1" (Ptr -> Double -> JS_IO ()) ctx value

namespace globalCompositeOperation

    get : Ptr -> JS_IO String
    get ctx = jscall "%0.globalCompositeOperation" (Ptr -> JS_IO String) ctx

    set : Ptr -> String -> JS_IO ()
    set ctx type = jscall "%0.globalCompositeOperation = %1" (Ptr -> String -> JS_IO ()) ctx type

namespace canvas

    get : Ptr -> JS_IO Ptr
    get ctx = jscall "%0.canvas" (Ptr -> JS_IO Ptr) ctx
