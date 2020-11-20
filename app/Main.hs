module Main where

import System.Environment ( getArgs )
import Primes ( isPrime, primeFactors )
import Data.Maybe ( isNothing )
import Data.List ( intersperse )

primalityCheck :: IO String
primalityCheck = do
  putStrLn "Enter a number to check if it's prime:"
  n <- getLine
  let result = isPrime (read n :: Int)
  if result == Just True
    then return "It is prime!"
    else if result == Just False
      then return "It is not a prime number"
    else
      return "Sorry, this number is not a valid candidate for primality testing"


factorPrimes :: IO String
factorPrimes = do
  putStrLn "Enter a number to Factor:"
  n <- getLine
  let result@(Just lst) = primeFactors (read n :: Int)
  if isNothing result then
    do return ( "Sorry, this number is not"
              ++"a valid candidate for primality test")
    else
      do return ("The prime factor(s) of "
                <> show n
                <> " are " ++ lstToWord lst)
  where
    lstToWord = mconcat . intersperse ", " . map show


main :: IO ()
main = do
  args <- getArgs
  if "-f" `elem` take 1 args
    then do
      result <- factorPrimes
      putStrLn result
    else do
      result <- primalityCheck
      putStrLn result


