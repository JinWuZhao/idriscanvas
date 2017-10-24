module HelloWorld

import IdrisCanvas

%access public export

render : () -> JS_IO ()
render _ = do
         let maybeCanvas = the (Maybe HTMLCanvasElement) !(safeFromRef !(getElementById !document "myCanvas"))
         case maybeCanvas of
              Nothing => pure ()
              Just canvas => do
                          let maybeCtx = the (Maybe CanvasRenderingContext2D) !(safeFromRef !(getContext canvas))
                          case maybeCtx of
                               Nothing => pure ()
                               Just ctx => do
                                        fillStyle.set ctx (toRef "red")
                                        fillRect ctx 0 0 200 200

namespace Main

    main : JS_IO ()
    main = onload !window render
