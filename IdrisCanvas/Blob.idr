module IdrisCanvas.Blob

import IdrisCanvas.Js

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

newBlob : JSRef -> JSRef -> JS_IO Blob
newBlob = ?todo


