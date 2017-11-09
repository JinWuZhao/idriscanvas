module IdrisCanvas.Js

%access public export

JSRef : Type
JSRef = Ptr

data JSType = JSNumber
            | JSString
            | JSBoolean
            | JSFunction
            | JSNull
            | JSObject String
            | JSUndefined

Eq JSType where
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

%inline
defaultToRef : ToRef from => from -> JSRef
defaultToRef = believe_me

ToRef String where
    toRef = defaultToRef

ToRef Double where
    toRef = defaultToRef

ToRef Int where
    toRef = defaultToRef

ToRef Char where
    toRef = defaultToRef

ToRef Bool where
    toRef = defaultToRef

interface FromRef to where
    fromRef : JSRef -> to

%inline
defaultFromRef : FromRef to => JSRef -> to
defaultFromRef = believe_me

FromRef String where
    fromRef = defaultFromRef

FromRef Double where
    fromRef = defaultFromRef

FromRef Int where
    fromRef = defaultFromRef

FromRef Char where
    fromRef = defaultFromRef

FromRef Bool where
    fromRef = defaultFromRef

interface ToRef from => ToIORef from where
    toIORef : JS_IO from -> JS_IO JSRef

%inline
defaultToIORef : ToIORef from => JS_IO from -> JS_IO JSRef
defaultToIORef = believe_me

ToIORef String where
    toIORef = defaultToIORef

ToIORef Double where
    toIORef = defaultToIORef

ToIORef Int where
    toIORef = defaultToIORef

ToIORef Char where
    toIORef = defaultToIORef

ToIORef Bool where
    toIORef = defaultToIORef

interface FromRef to => FromIORef to where
    fromIORef : JS_IO JSRef -> JS_IO to

%inline
defaultFromIORef : FromIORef to => JS_IO JSRef -> JS_IO to
defaultFromIORef = believe_me

FromIORef String where
    fromIORef = defaultFromIORef

FromIORef Double where
    fromIORef = defaultFromIORef

FromIORef Int where
    fromIORef = defaultFromIORef

FromIORef Char where
    fromIORef = defaultFromIORef

FromIORef Bool where
    fromIORef = defaultFromIORef

interface FromRef to => SafeFromRef to where
    safeFromRef : JSRef -> JS_IO (Maybe to)

%inline
defaultSafeFromRef : SafeFromRef to => JSType -> JSRef -> JS_IO (Maybe to)
defaultSafeFromRef jstype ref = do
                              type <- typeof ref
                              if type == jstype
                              then pure $ Just (fromRef ref)
                              else pure Nothing

SafeFromRef String where
    safeFromRef = defaultSafeFromRef JSString

SafeFromRef Double where
    safeFromRef = defaultSafeFromRef JSNumber

SafeFromRef Int where
    safeFromRef = defaultSafeFromRef JSNumber

SafeFromRef Char where
    safeFromRef = defaultSafeFromRef JSString

SafeFromRef Bool where
    safeFromRef = defaultSafeFromRef JSBoolean
