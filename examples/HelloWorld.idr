module HelloWorld

import IdrisCanvas

%access public export

initCanvas : (HTMLCanvasElement -> JS_IO ()) -> JS_IO ()
initCanvas init = do
    let maybeCanvas = !(canvasFromRef !(getElementById "myCanvas" !document))
    case maybeCanvas of
        Nothing => pure ()
        Just canvas => init canvas

initCtx : (CanvasRenderingContext2D -> JS_IO ()) -> HTMLCanvasElement -> JS_IO ()
initCtx init canvas = do
    let maybeCtx = !(contextFromRef !(getContext canvas))
    case maybeCtx of
        Nothing => pure ()
        Just ctx => init ctx

drawInCtx : CanvasRenderingContext2D -> JS_IO ()
drawInCtx ctx = do
    fillStyle.set (toRef "red") ctx
    fillRect 0 0 200 200 ctx

render : () -> JS_IO ()
render _ = do
    initCanvas $ initCtx drawInCtx

namespace Main

    main : JS_IO ()
    main = onload render !window
