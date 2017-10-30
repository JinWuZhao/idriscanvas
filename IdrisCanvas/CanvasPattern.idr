module IdrisCanvas.CanvasPattern

import IdrisCanvas.Js

%access public export

data CanvasPattern

JSCanvasPattern : JSType
JSCanvasPattern = JSObject "CanvasPattern"

ToRef CanvasPattern where
    toRef = defaultToRef

FromRef CanvasPattern where
    fromRef = defaultFromRef

ToIORef CanvasPattern where
    toIORef = defaultToIORef

FromIORef CanvasPattern where
    fromIORef = defaultFromIORef

SafeFromRef CanvasPattern where
    safeFromRef = defaultSafeFromRef JSCanvasPattern

