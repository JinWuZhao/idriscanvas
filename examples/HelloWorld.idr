module HelloWorld

import IdrisCanvas

%access public export

render : () -> JS_IO ()
render _ = do
         let maybeCanvas = !(toCanvas !(getElementById !document "myCanvas"))
         case maybeCanvas of
              Nothing => pure ()
              Just canvas => do
                          putStrLn' "hello world!"

namespace Main

    main : JS_IO ()
    main = onload !window render
