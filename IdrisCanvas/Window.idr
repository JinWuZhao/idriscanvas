module IdrisCanvas.Window

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

onload : Window -> (Window -> JS_IO ()) -> JS_IO ()
onload wind f = jscall "%0.onload = %1"
                       (Ptr -> JsFn (() -> JS_IO ()) -> JS_IO ())
                       (toRef wind) (MkJsFn $ \_ => f wind)

requestAnimationFrame : Window -> (Window -> Int -> JS_IO ()) -> JS_IO Int
requestAnimationFrame wind f = jscall "%0.requestAnimationFrame(%1)"
                                      (Ptr -> JsFn (Int -> JS_IO ()) -> JS_IO Int)
                                      (toRef wind) (MkJsFn $ f wind)

cancelAnimationFrame : Int -> Window -> JS_IO ()
cancelAnimationFrame requestID wind = jscall "%0.cancelAnimationFrame(%1)"
                                            (Ptr -> Int -> JS_IO ())
                                            (toRef wind) requestID
