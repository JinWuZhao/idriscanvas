module IdrisCanvas.Js.Array

import IdrisCanvas.Js

%access public export

data Array

JSArray : JSType
JSArray = JSObject "Array"

ToRef Array where
    toRef = defaultToRef

FromRef Array where
    fromRef = defaultFromRef

ToIORef Array where
    toIORef = defaultToIORef

FromIORef Array where
    fromIORef = defaultFromIORef

SafeFromRef Array where
    safeFromRef = defaultSafeFromRef JSArray

%inline
arrayFromRef : JSRef -> JS_IO (Maybe Array)
arrayFromRef = safeFromRef

new : JS_IO Array
new = fromIORef $ jscall "[]" (JS_IO Ptr)

get :  (index : Int) -> Array -> JS_IO JSRef
get index array = jscall "%0[%1]" (Ptr -> Int -> JS_IO Ptr) (toRef array) index

set : (index : Int) -> (value : JSRef) -> Array -> JS_IO ()
set index value array = jscall "%0[%1] = %2" (Ptr -> Int -> Ptr -> JS_IO ()) (toRef array) index value

push : (value : JSRef) -> Array -> JS_IO ()
push value array = jscall "%0.push(%1)" (Ptr -> Ptr -> JS_IO ()) (toRef array) value

length : Array -> JS_IO Int
length array = jscall "%0.length" (Ptr -> JS_IO Int) (toRef array)
