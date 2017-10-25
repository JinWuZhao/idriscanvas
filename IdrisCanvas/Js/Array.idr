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

%inline
arrayFromRef : JSRef -> JS_IO (Maybe Array)
arrayFromRef = safeFromRef

new : JS_IO Array
new = fromIORef $ jscall "[]" (JS_IO Ptr)

get :  Int -> Array -> JS_IO JSRef
get index array = jscall "%0[%1]" (Ptr -> Int -> JS_IO Ptr) (toRef array) index

set : Int -> Array -> JSRef -> JS_IO JSRef
set index array value = jscall "%0[%1] = %2" (Ptr -> Int -> Ptr -> JS_IO Ptr) (toRef array) index value

push : JSRef -> Array -> JS_IO JSRef
push value array = jscall "%0.push(%1)" (Ptr -> Ptr -> JS_IO Ptr) (toRef array) value