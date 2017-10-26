module HelloWorld

import IdrisCanvas

%access public export

init : (CanvasRenderingContext2D -> JS_IO ()) -> JS_IO ()
init init = do
    Just canvas <- canvasFromRef !(getElementById "myCanvas" !document)
    | Nothing => pure ()
    Just ctx <- contextFromRef !(getContext canvas)
    | Nothing => pure ()
    init ctx

drawInCtx : CanvasRenderingContext2D -> JS_IO ()
drawInCtx ctx = do
    Just gradient <- gradientFromRef !(createLinearGradient 0 0 200 0 ctx)
    | Nothing => pure ()
    addColorStop 0 "green" gradient
    addColorStop 1 "white" gradient
    setFillStyle (toRef gradient) ctx
    fillRect 0 0 200 200 ctx

render : () -> JS_IO ()
render _ = do
    init drawInCtx

namespace Main

    main : JS_IO ()
    main = onload render !window
