module IdrisCanvas.Js.Dictionary

import IdrisCanvas.Js

%access public export

data Dictionary

JSDictionary : JSType
JSDictionary = JSObject "Object"

ToRef Dictionary where
    toRef = defaultToRef

FromRef Dictionary where
    fromRef = defaultFromRef

ToIORef Dictionary where
    toIORef = defaultToIORef

FromIORef Dictionary where
    fromIORef = defaultFromIORef

SafeFromRef Dictionary where
    safeFromRef = defaultSafeFromRef JSDictionary

%inline
dictFromRef : JSRef -> JS_IO (Maybe Dictionary)
dictFromRef = safeFromRef

new : JS_IO Dictionary
new = fromIORef $ jscall "{}" (JS_IO Ptr)

get : String -> Dictionary -> JS_IO JSRef
get key dict = jscall "%0[%1]" (Ptr -> String -> JS_IO Ptr) (toRef dict) key

set : String -> JSRef -> Dictionary -> JS_IO ()
set key value dict = jscall "%0[%1] = %2" (Ptr -> String -> Ptr -> JS_IO ())
                            (toRef dict) key value
