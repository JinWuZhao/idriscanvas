module IdrisCanvas.HTMLCanvasElement

import IdrisCanvas.Js

%access public export

export
HTMLCanvasElement : Type
HTMLCanvasElement = JSRef

toCanvas : JSRef -> JS_IO (Maybe HTMLCanvasElement)
toCanvas ref = do
             type <-typeof ref
             if type == JSObject "HTMLCanvasElement"
             then pure (Just ref)
             else pure Nothing


namespace height

    get : HTMLCanvasElement -> JS_IO Int
    get canvas = jscall "%0.height" (Ptr -> JS_IO Int) (jsptr canvas)

    set : HTMLCanvasElement -> Int -> JS_IO ()
    set canvas h = jscall "%0.height = %1" (Ptr -> Int -> JS_IO ()) (jsptr canvas) h

namespace width

    get : HTMLCanvasElement -> JS_IO Int
    get canvas = jscall "%0.width" (Ptr -> JS_IO Int) (jsptr canvas)

    set : HTMLCanvasElement -> Int -> JS_IO ()
    set canvas w = jscall "%0.width = %1" (Ptr -> Int -> JS_IO ()) (jsptr canvas) w

getContext : HTMLCanvasElement -> JS_IO JSRef
getContext canvas = iojsref (jscall "%0.getContext('2d')" (Ptr -> JS_IO Ptr) (jsptr canvas))

toDataURL : HTMLCanvasElement -> String -> Double -> JS_IO String
toDataURL canvas type encoderOptions = jscall "%0.toDataURL(%1, %2)"
                                              (Ptr -> String -> Double -> JS_IO String)
                                              (jsptr canvas) type encoderOptions

toBlob : HTMLCanvasElement -> (JSRef -> JS_IO ()) -> String -> Double -> JS_IO ()
toBlob canvas callback mimeType qualityArgument = jscall "%0.toBlob(%1, %2, %3)"
                                                         (Ptr -> JsFn (Ptr -> JS_IO ()) -> String -> Double -> JS_IO ())
                                                         (jsptr canvas) (MkJsFn (\ptr => callback (jsref ptr))) mimeType qualityArgument


