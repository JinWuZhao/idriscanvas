module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    img <- newImage
    setSrc "images/Canvas_createpattern.png" img
    onload img ready
where
    ready : HTMLImageElement -> JS_IO ()
    ready img = do
        ptrn <- createPattern (toRef img) RepetitionRepeat ctx
        setFillStyle ptrn ctx
        fillRect 0 0 150 150 ctx

main : JS_IO ()
main = start render
