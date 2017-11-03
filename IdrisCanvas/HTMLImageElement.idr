module IdrisCanvas.HTMLImageElement

import IdrisCanvas.Js

%access public export

data HTMLImageElement

JSHTMLImageElement : JSType
JSHTMLImageElement = JSObject "HTMLImageElement"

ToRef HTMLImageElement where
    toRef = defaultToRef

FromRef HTMLImageElement where
    fromRef = defaultFromRef

ToIORef HTMLImageElement where
    toIORef = defaultToIORef

FromIORef HTMLImageElement where
    fromIORef = defaultFromIORef

SafeFromRef HTMLImageElement where
    safeFromRef = defaultSafeFromRef JSHTMLImageElement


newImage : JS_IO HTMLImageElement
newImage = fromIORef $ jscall "new Image()" (JS_IO Ptr)

getAlt : HTMLImageElement -> JS_IO String
getAlt image = jscall "%0.alt" (Ptr -> JS_IO String) (toRef image)

setAlt : String -> HTMLImageElement -> JS_IO ()
setAlt alt image = jscall "%0.alt = %1" (Ptr -> String -> JS_IO ()) (toRef image) alt

getComplete : HTMLImageElement -> JS_IO Bool
getComplete image = fromIORef $ jscall "%0.complete" (Ptr -> JS_IO Ptr) (toRef image)

getCrossOrigin : HTMLImageElement -> JS_IO String
getCrossOrigin image = jscall "%0.crossOrigin" (Ptr -> JS_IO String) (toRef image)

setCrossOrigin : String -> HTMLImageElement -> JS_IO ()
setCrossOrigin cors image = jscall "%0.crossOrigin = %1" (Ptr -> String -> JS_IO ()) (toRef image) cors

getHeight : HTMLImageElement -> JS_IO Int
getHeight image = jscall "%0.height" (Ptr -> JS_IO Int) (toRef image)

setHeight : Int -> HTMLImageElement -> JS_IO ()
setHeight height image = jscall "%0.height = %1" (Ptr -> Int -> JS_IO ()) (toRef image) height

getIsMap : HTMLImageElement -> JS_IO Bool
getIsMap image = fromIORef $ jscall "%0.isMap" (Ptr -> JS_IO Ptr) (toRef image)

setIsMap : Bool -> HTMLImageElement -> JS_IO ()
setIsMap value image = jscall "%0.isMap = %1" (Ptr -> Ptr -> JS_IO ()) (toRef image) (toRef value)

getNaturalHeight : HTMLImageElement -> JS_IO Int
getNaturalHeight image = jscall "%0.naturalHeight" (Ptr -> JS_IO Int) (toRef image)

getNaturalWidth : HTMLImageElement -> JS_IO Int
getNaturalWidth image = jscall "%0.naturalWidth" (Ptr -> JS_IO Int) (toRef image)

getSrc : HTMLImageElement -> JS_IO String
getSrc image = jscall "%0.src" (Ptr -> JS_IO String) (toRef image)

setSrc : String -> HTMLImageElement -> JS_IO ()
setSrc src image = jscall "%0.src = %1" (Ptr -> String -> JS_IO ()) (toRef image) src

getUseMap : HTMLImageElement -> JS_IO String
getUseMap image = jscall "%0.useMap" (Ptr -> JS_IO String) (toRef image)

setUseMap : String -> HTMLImageElement -> JS_IO ()
setUseMap useMap image = jscall "%0.useMap = %1" (Ptr -> String -> JS_IO ()) (toRef image) useMap

getWidth : HTMLImageElement -> JS_IO Int
getWidth image = jscall "%0.width" (Ptr -> JS_IO Int) (toRef image)

setWidth : Int -> HTMLImageElement -> JS_IO ()
setWidth width image = jscall "%0.width = %1" (Ptr -> Int -> JS_IO ()) (toRef image) width

onload : (() -> JS_IO ()) -> HTMLImageElement -> JS_IO ()
onload f img = jscall "%0.onload = %1"
                       (Ptr -> JsFn (() -> JS_IO ()) -> JS_IO ())
                       (toRef img) (MkJsFn f)
