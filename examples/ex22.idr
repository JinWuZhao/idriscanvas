module Main

import IdrisCanvas
import Helpers.Launch

render : CanvasRenderingContext2D -> JS_IO ()
render ctx = do
    source <- newImage
    setSrc "images/rhino.jpg" source
    flip onload source $ \_ => do
        drawImage (toRef source) 33 71 104 124 21 20 87 104 ctx
    frame <- newImage
    setSrc "images/Canvas_picture_frame.png" frame
    flip onload frame $ \_ => do
        drawImage (toRef frame) 0 0 ctx

main : JS_IO ()
main = start render
