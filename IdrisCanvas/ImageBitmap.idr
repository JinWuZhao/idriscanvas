module IdrisCanvas.ImageBitmap

import IdrisCanvas.Js

%access public export

data ImageBitmap

JSImageBitmap : JSType
JSImageBitmap = JSObject "ImageBitmap"

ToRef ImageBitmap where
    toRef = defaultToRef

FromRef ImageBitmap where
    fromRef = defaultFromRef

ToIORef ImageBitmap where
    toIORef = defaultToIORef

FromIORef ImageBitmap where
    fromIORef = defaultFromIORef

SafeFromRef ImageBitmap where
    safeFromRef = defaultSafeFromRef JSImageBitmap

%inline
imageBitmapFromRef : JSRef -> JS_IO (Maybe ImageBitmap)
imageBitmapFromRef = safeFromRef

getWidth : ImageBitmap -> JS_IO Int
getWidth img = jscall "%0.width" (Ptr -> JS_IO Int) (toRef img)

getHeight : ImageBitmap -> JS_IO Int
getHeight img = jscall "%0.height" (Ptr -> JS_IO Int) (toRef img)
