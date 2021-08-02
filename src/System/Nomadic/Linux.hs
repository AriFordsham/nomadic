module System.Nomadic.Linux where

import Control.Monad
import System.Process

runCmds :: [(String, [String])] -> IO ()
runCmds = mapM_ $ uncurry callProcess

install :: String -> String -> IO ()
install repo pkg = runCmds [
    ("nix",     ["copy", "repo", "pkg"]),
    ("nix-env", ["-iA" , "nixpkgs." ++ pkg])
  ]

remove :: String -> IO ()
remove pkg = runCmds [
    ("nix-env", ["-e", pkg])
  ]
