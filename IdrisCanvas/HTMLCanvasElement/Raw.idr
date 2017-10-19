module IdrisCanvas.HTMLCanvasElement.Raw

import IdrisCanvas.Tools

%access public export

namespace height

    get : Ptr -> JS_IO Int
    get canvas = jscall "%0.height" (Ptr -> JS_IO Int) canvas

    set : Ptr -> Int -> JS_IO ()
    set canvas h = jscall "%0.height = %1" (Ptr -> Int -> JS_IO ()) canvas h

namespace width

    get : Ptr -> JS_IO Int
    get canvas = jscall "%0.width" (Ptr -> JS_IO Int) canvas

    set : Ptr -> Int -> JS_IO ()
    set canvas w = jscall "%0.width = %1" (Ptr -> Int -> JS_IO ()) canvas w

getContext : Ptr -> JS_IO Ptr
getContext canvas = jscall "%0.getContext('2d')" (Ptr -> JS_IO Ptr) canvas

toDataURL : Ptr -> String -> Double -> JS_IO String
toDataURL canvas type encoderOptions = jscall "%0.toDataURL(%1, %2)"
                                              (Ptr -> String -> Double -> JS_IO String)
                                              canvas type encoderOptions

toBlob : Ptr -> (Ptr -> JS_IO ()) -> String -> Double -> JS_IO ()
toBlob canvas callback mimeType qualityArgument = jscall "%0.toBlob(%1, %2, %3)"
                                                         (Ptr -> JsFn (Ptr -> JS_IO ()) -> String -> Double -> JS_IO ())
                                                         canvas (MkJsFn callback) mimeType qualityArgument


