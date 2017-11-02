module Helpers.Launch

import IdrisCanvas

%access public export

prepare : (CanvasRenderingContext2D -> JS_IO ()) -> JS_IO ()
prepare render = do
    doc <- document
    canvasElem <- createElement "canvas" doc
    appendChildToBody canvasElem doc
    Just canvas <- canvasFromRef canvasElem
    | Nothing => pure ()
    setWidth 150 canvas
    setHeight 150 canvas
    Just ctx <- contextFromRef !(getContext canvas)
    | Nothing => pure ()
    render ctx

start : (CanvasRenderingContext2D -> JS_IO ()) -> JS_IO ()
start render = onload (\_ => prepare render) !window
