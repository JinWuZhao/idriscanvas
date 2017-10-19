module HelloWorld

import IdrisCanvas.WebSupport.Window.Raw
import IdrisCanvas.WebSupport.Document.Raw
import IdrisCanvas.HTMLCanvasElement.Raw
import IdrisCanvas.CanvasRenderingContext2D.Raw
import IdrisCanvas.Tools

%access public export

render : () -> JS_IO ()
render _ = do
         canvas <- getElementById !document "myCanvas"
         ctx <- getContext canvas
         fillStyle.set ctx (toPtr "red")
         fillRect ctx 0 0 200 200
         url <- toDataURL canvas "image/png" 0.92
         putStrLn' url

namespace Main

    main : JS_IO ()
    main = onload !window render
