{-# LANGUAGE LambdaCase #-}

import Test.Hspec
import System.Process
import System.Exit

main :: IO ()
main = hspec $ do
      it "installs a package" $ 
        rawSystem "nix-env" ["-q", "hello"] >>=
          (`shouldNotBe` ExitSuccess)