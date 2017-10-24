module Array

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

new : JS_IO Array
new = fromIORef $ jscall "[]" (JS_IO Ptr)

get : Array -> Int -> JS_IO JSRef
get array index = jscall "%0[%1]" (Ptr -> Int -> JS_IO Ptr) (toRef array) index

set : Array -> Int -> JSRef -> JS_IO JSRef
set array index value = jscall "%0[%1] = %2" (Ptr -> Int -> Ptr -> JS_IO Ptr) (toRef array) index value

push : Array -> JSRef -> JS_IO JSRef
push array value = jscall "%0.push(%1)" (Ptr -> Ptr -> JS_IO Ptr) (toRef array) value
