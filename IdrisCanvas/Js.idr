module IdrisCanvas.Js

%access public export

export
JSRef : Type
JSRef = Ptr

%inline
jsref : Ptr -> JSRef
jsref ptr = ptr

%inline
iojsref : JS_IO Ptr -> JS_IO JSRef
iojsref ioptr = ioptr

%inline
jsptr : JSRef -> Ptr
jsptr ref = ref

%inline
iojsptr : JS_IO JSRef -> JS_IO Ptr
iojsptr ioref = ioref

data JSType = JSNumber
            | JSString
            | JSBoolean
            | JSFunction
            | JSNull
            | JSObject String
            | JSUndefined

JSArray : JSType
JSArray = JSObject "Array"

implementation Eq JSType where
    JSNumber      == JSNumber      = True
    JSString      == JSString      = True
    JSBoolean     == JSBoolean     = True
    JSFunction    == JSFunction    = True
    JSNull        == JSNull        = True
    (JSObject c)  == (JSObject c') = c == c'
    JSUndefined   == JSUndefined   = True
    _             == _             = False

%inline
jscall : String -> (ty : Type) -> {auto fty : FTy FFI_JS [] ty} -> ty
jscall fname ty = foreign FFI_JS fname ty

private
ctrName : JSRef -> JS_IO String
ctrName ref = jscall "%0.constructor.name" (JSRef -> JS_IO String) ref

typeof : JSRef -> JS_IO JSType
typeof ref = do
           res <- jscall checkType (Ptr -> JS_IO Int) ref
           case res of
                0 => pure JSNumber
                1 => pure JSString
                2 => pure JSBoolean
                3 => pure JSFunction
                4 => pure JSUndefined
                5 => pure (JSObject !(ctrName ref))
                _ => pure JSNull
       where
           checkType : String
           checkType = """(function(arg) {
                              if (typeof arg == 'number')
                                  return 0;
                              else if (typeof arg == 'string')
                                  return 1;
                              else if (typeof arg == 'boolean')
                                  return 2;
                              else if (typeof arg == 'function')
                                  return 3;
                              else if (typeof arg == 'undefined')
                                  return 4;
                              else if (typeof arg == 'object')
                                  return 5;
                              else
                                  return 6;
                          })(%0)"""

interface ToRef from where
    toRef : from -> JSRef

implementation ToRef String where
    toRef str = believe_me str

implementation ToRef Double where
    toRef num = believe_me num

implementation ToRef Int where
    toRef num = believe_me num

implementation ToRef Char where
    toRef c = believe_me c

interface FromRef to where
    fromRef : JSRef -> to

implementation FromRef String where
    fromRef ptr = believe_me ptr

implementation FromRef Double where
    fromRef ptr = believe_me ptr

implementation FromRef Int where
    fromRef ptr = believe_me ptr

implementation FromRef Char where
    fromRef ptr = believe_me ptr

namespace JSArray

    export
    Array : Type
    Array = JSRef

    toArray : JSRef -> JS_IO (Maybe Array)
    toArray ref = do
                type <- typeof ref
                if type == JSArray
                then pure (Just ref)
                else pure Nothing

    new : JS_IO Array
    new = jscall "[]" (JS_IO Ptr)

    get : Array -> Int -> JS_IO JSRef
    get array index = jscall "%0[%1]" (Ptr -> Int -> JS_IO Ptr) array index

    set : Array -> Int -> JSRef -> JS_IO JSRef
    set array index value = jscall "%0[%1] = %2" (Ptr -> Int -> Ptr -> JS_IO Ptr) array index value

    push : Array -> JSRef -> JS_IO JSRef
    push array value = jscall "%0.push(%1)" (Ptr -> Ptr -> JS_IO Ptr) array value
