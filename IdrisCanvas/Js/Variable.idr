module IdrisCanvas.Js.Variable

import IdrisCanvas.Js

%access public export

data Variable : Type -> Type

ToRef val => ToRef (Variable val) where
    toRef = defaultToRef

FromRef val => FromRef (Variable val) where
    fromRef = defaultFromRef

ToRef val => ToIORef (Variable val) where
    toIORef = defaultToIORef

FromRef val => FromIORef (Variable val) where
    fromIORef = defaultFromIORef

new : ToRef val => FromRef val => val -> JS_IO (Variable val)
new val = fromIORef $ jscall "{ val : %0 }" (Ptr -> JS_IO Ptr) (toRef val)

put : ToRef val => val -> (var : Variable val) -> JS_IO ()
put val var = jscall "%0.val = %1" (Ptr -> Ptr -> JS_IO ()) (toRef val) (toRef var)

get : ToRef val => FromIORef val => (var : Variable val) -> JS_IO val
get var = fromIORef $ jscall "%0.val" (Ptr -> JS_IO Ptr) (toRef var)
