module IdrisCanvas.CanvasGradient

import IdrisCanvas.Js

%access public export

data CanvasGradient

JSCanvasGradient : JSType
JSCanvasGradient = JSObject "CanvasGradient"

ToRef CanvasGradient where
    toRef = defaultToRef

FromRef CanvasGradient where
    fromRef = defaultFromRef

ToIORef CanvasGradient where
    toIORef = defaultToIORef

FromIORef CanvasGradient where
    fromIORef = defaultFromIORef

SafeFromRef CanvasGradient where
    safeFromRef = defaultSafeFromRef JSCanvasGradient

%inline
gradientFromRef : JSRef -> JS_IO (Maybe CanvasGradient)
gradientFromRef = safeFromRef

addColorStop : (offset : Double) -> (color : String) -> CanvasGradient -> JS_IO ()
addColorStop offset color gradient = jscall "%0.addColorStop(%1, %2)"
                                            (Ptr -> Double -> String -> JS_IO ())
                                            (toRef gradient) offset color
