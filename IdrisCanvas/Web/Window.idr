module IdrisCanvas.Web.Window

import IdrisCanvas.Js

%access public export

data Window

JSWindow : JSType
JSWindow = JSObject "Window"

ToRef Window where
    toRef = defaultToRef

FromRef Window where
    fromRef = defaultFromRef

ToIORef Window where
    toIORef = defaultToIORef

FromIORef Window where
    fromIORef = defaultFromIORef

SafeFromRef Window where
    safeFromRef = defaultSafeFromRef JSWindow

%inline
windowFromRef : JSRef -> JS_IO (Maybe Window)
windowFromRef = safeFromRef

window : JS_IO Window
window = fromIORef $ jscall "window" (JS_IO Ptr)

onload : (() -> JS_IO ()) -> Window -> JS_IO ()
onload f wind = jscall "%0.onload = %1"
                       (Ptr -> JsFn (() -> JS_IO ()) -> JS_IO ())
                       (toRef wind) (MkJsFn f)
