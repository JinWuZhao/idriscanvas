module Main

import IdrisCanvas
import Helpers.Launch

getSeconds : JS_IO Int
getSeconds = jscall "new Date().getSeconds()" (JS_IO Int)

getMilliseconds : JS_IO Int
getMilliseconds = jscall "new Date().getMilliseconds()" (JS_IO Int)

draw : (HTMLImageElement, HTMLImageElement, HTMLImageElement) -> CanvasRenderingContext2D -> JS_IO ()
draw (sun, moon, earth) ctx = do
    setGlobalCompositeOperation "destination-over" ctx
    clearRect 0 0 300 300 ctx
    setFillStyle (rgbaColor 0 0 0 0.4) ctx
    setStrokeStyle (rgbaColor 0 153 255 0.4) ctx
    save ctx
    translate 150 150 ctx
    -- Earth
    rotate (2 * pi / 60 * cast !getSeconds + 2 * pi / 60000 * cast !getMilliseconds) ctx
    translate 105 0 ctx
    fillRect 0 (-12) 50 24 ctx
    drawImage (toRef earth) (-12) (-12) ctx
    -- Moon
    save ctx
    rotate (2 * pi / 6 * cast !getSeconds + 2 * pi / 6000 * cast !getMilliseconds) ctx
    translate 0 28.5 ctx
    drawImage (toRef moon) (-3.5) (-3.5) ctx
    restore ctx
    restore ctx
    -- pathway
    beginPath ctx
    arc 150 150 105 0 (pi * 2) False ctx
    stroke ctx
    -- sun
    drawImage (toRef sun) 0 0 300 300 ctx

main : JS_IO ()
main = do
    sun <- newImage
    setSrc "images/Canvas_sun.png" sun
    moon <- newImage
    setSrc "images/Canvas_moon.png" moon
    earth <- newImage
    setSrc "images/Canvas_earth.png" earth
    flip onload !window $ \_ => do
        prepare $ \ctx => do
            requestAnimationFrame !window $ runLoop (sun, moon, earth) ctx
where
    runLoop : (HTMLImageElement, HTMLImageElement, HTMLImageElement) -> CanvasRenderingContext2D -> Window -> JS_IO ()
    runLoop images ctx wind = do
        draw images ctx
        requestAnimationFrame wind $ runLoop images ctx
