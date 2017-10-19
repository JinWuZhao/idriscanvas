module IdrisCanvas.Tools

%access public export

%inline
jscall : String -> (ty : Type) -> {auto fty : FTy FFI_JS [] ty} -> ty
jscall fname ty = foreign FFI_JS fname ty

interface ToPtr from where
    toPtr : from -> Ptr

implementation ToPtr String where
    toPtr str = believe_me str

implementation ToPtr Double where
    toPtr num = believe_me num

implementation ToPtr Int where
    toPtr num = believe_me num

implementation ToPtr Char where
    toPtr c = believe_me c

interface FromPtr to where
    fromPtr : Ptr -> to

implementation FromPtr String where
    fromPtr ptr = believe_me ptr

implementation FromPtr Double where
    fromPtr ptr = believe_me ptr

implementation FromPtr Int where
    fromPtr ptr = believe_me ptr

implementation FromPtr Char where
    fromPtr ptr = believe_me ptr

namespace JSArray

    new : JS_IO Ptr
    new = jscall "[]" (JS_IO Ptr)

    get : Ptr -> Int -> JS_IO Ptr
    get array index = jscall "%0[%1]" (Ptr -> Int -> JS_IO Ptr) array index

    set : Ptr -> Int -> Ptr -> JS_IO Ptr
    set array index value = jscall "%0[%1] = %2" (Ptr -> Int -> Ptr -> JS_IO Ptr) array index value

