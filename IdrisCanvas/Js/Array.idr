module Array

import IdrisCanvas.Js

export
Array : Type
Array = JSRef

toArray : JSRef -> JS_IO (Maybe Array)
toArray ref = do
            type <- typeof ref
            if type == JSArray
            then pure (Just ref)
            else pure Nothing

toRef : Array -> JSRef
toRef array = array

new : JS_IO Array
new = jscall "[]" (JS_IO Ptr)

get : Array -> Int -> JS_IO JSRef
get array index = jscall "%0[%1]" (Ptr -> Int -> JS_IO Ptr) array index

set : Array -> Int -> JSRef -> JS_IO JSRef
set array index value = jscall "%0[%1] = %2" (Ptr -> Int -> Ptr -> JS_IO Ptr) array index value

push : Array -> JSRef -> JS_IO JSRef
push array value = jscall "%0.push(%1)" (Ptr -> Ptr -> JS_IO Ptr) array value
