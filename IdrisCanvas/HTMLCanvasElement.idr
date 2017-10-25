module IdrisCanvas.HTMLCanvasElement

import IdrisCanvas.Js

%access public export

data HTMLCanvasElement

JSHTMLCanvasElement : JSType
JSHTMLCanvasElement = JSObject "HTMLCanvasElement"

ToRef HTMLCanvasElement where
    toRef = defaultToRef

FromRef HTMLCanvasElement where
    fromRef = defaultFromRef

ToIORef HTMLCanvasElement where
    toIORef = defaultToIORef

FromIORef HTMLCanvasElement where
    fromIORef = defaultFromIORef

SafeFromRef HTMLCanvasElement where
    safeFromRef = defaultSafeFromRef JSHTMLCanvasElement

%inline
canvasFromRef : JSRef -> JS_IO (Maybe HTMLCanvasElement)
canvasFromRef = safeFromRef

namespace height

    get : HTMLCanvasElement -> JS_IO Int
    get canvas = jscall "%0.height" (Ptr -> JS_IO Int) (toRef canvas)

    set : Int -> HTMLCanvasElement -> JS_IO ()
    set h canvas = jscall "%0.height = %1" (Ptr -> Int -> JS_IO ()) (toRef canvas) h

namespace width

    get : HTMLCanvasElement -> JS_IO Int
    get canvas = jscall "%0.width" (Ptr -> JS_IO Int) (toRef canvas)

    set : Int -> HTMLCanvasElement -> JS_IO ()
    set w canvas = jscall "%0.width = %1" (Ptr -> Int -> JS_IO ()) (toRef canvas) w

getContext : HTMLCanvasElement -> JS_IO JSRef
getContext canvas = jscall "%0.getContext('2d')" (Ptr -> JS_IO Ptr) (toRef canvas)

toDataURL : String -> Double -> HTMLCanvasElement -> JS_IO String
toDataURL type encoderOptions canvas = jscall "%0.toDataURL(%1, %2)"
                                              (Ptr -> String -> Double -> JS_IO String)
                                              (toRef canvas) type encoderOptions

toBlob : (JSRef -> JS_IO ()) -> String -> Double -> HTMLCanvasElement -> JS_IO ()
toBlob callback mimeType qualityArgument canvas = jscall "%0.toBlob(%1, %2, %3)"
                                                         (Ptr -> JsFn (Ptr -> JS_IO ()) -> String -> Double -> JS_IO ())
                                                         (toRef canvas) (MkJsFn callback) mimeType qualityArgument
