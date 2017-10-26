module IdrisCanvas.ImageData

import IdrisCanvas.Js

%access public export

data ImageData

JSImageData : JSType
JSImageData = JSObject "ImageData"

ToRef ImageData where
    toRef = defaultToRef

FromRef ImageData where
    fromRef = defaultFromRef

ToIORef ImageData where
    toIORef = defaultToIORef

FromIORef ImageData where
    fromIORef = defaultFromIORef

SafeFromRef ImageData where
    safeFromRef = defaultSafeFromRef JSImageData

%inline
imageDataFromRef : JSRef -> JS_IO (Maybe ImageData)
imageDataFromRef = safeFromRef

getImageData : ImageData -> JS_IO Ptr
getImageData imgdata = jscall "%0.data" (Ptr -> JS_IO Ptr) (toRef imgdata)

getHeight : ImageData -> JS_IO Int
getHeight imgdata = jscall "%0.height" (Ptr -> JS_IO Int) (toRef imgdata)

getWidth : ImageData -> JS_IO Int
getWidth imgdata = jscall "%0.width" (Ptr -> JS_IO Int) (toRef imgdata)
