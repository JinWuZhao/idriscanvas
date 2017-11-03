module IdrisCanvas.Blob

import IdrisCanvas.Js
import IdrisCanvas.Js.Array

%access public export

data Blob

JSBlob : JSType
JSBlob = JSObject "Blob"

ToRef Blob where
    toRef = defaultToRef

FromRef Blob where
    fromRef = defaultFromRef

ToIORef Blob where
    toIORef = defaultToIORef

FromIORef Blob where
    fromIORef = defaultFromIORef

SafeFromRef Blob where
    safeFromRef = defaultSafeFromRef JSBlob

%inline
blobFromRef : JSRef -> JS_IO (Maybe Blob)
blobFromRef = safeFromRef

record BlobOptions where
    constructor MkBlobOptions
    type : String
    endings : String

newBlob : (blobParts : Array) -> (options : BlobOptions) -> JS_IO Blob
newBlob array options = fromIORef $ jscall "new Blob(%0, { type : %1, endings : %2})"
                                           (Ptr -> String -> String -> JS_IO Ptr)
                                           (toRef array) (type options) (endings options)

getSize : Blob -> JS_IO Int
getSize blob = jscall "%0.size" (Ptr -> JS_IO Int) (toRef blob)

getType : Blob -> JS_IO String
getType blob = jscall "%0.type" (Ptr -> JS_IO String) (toRef blob)

slice : (start : Int) -> (end : Int) -> (contentType : String) -> Blob -> JS_IO Blob
slice start end type blob = fromIORef $ jscall "%0.slice(%1, %2, %3)"
                                               (Ptr -> Int -> Int -> String -> JS_IO Ptr)
                                               (toRef blob) start end type
