module Main

import IdrisCanvas

init : (CanvasRenderingContext2D -> JS_IO ()) -> JS_IO ()
init init = do
    Just canvas <- canvasFromRef !(getElementById "myCanvas" !document)
    | Nothing => pure ()
    setWidth 150 canvas
    setHeight 150 canvas
    Just ctx <- contextFromRef !(getContext canvas)
    | Nothing => pure ()
    init ctx

drawInCtx : CanvasRenderingContext2D -> JS_IO ()
drawInCtx ctx = do
    setFillStyle (rgbColor 200 0 0) ctx
    fillRect 10 10 55 50 ctx
    setFillStyle (rgbaColor 0 0 200 0.5) ctx
    fillRect 30 30 55 50 ctx

render : () -> JS_IO ()
render _ = do
    init drawInCtx

main : JS_IO ()
main = onload render !window
