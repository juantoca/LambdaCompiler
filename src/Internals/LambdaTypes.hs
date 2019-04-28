{-# LANGUAGE FlexibleInstances #-}

module Internals.LambdaTypes
( LambdaTerm(..)
, Parametros(Parametros)
, toString
) where

newtype Parametros = Parametros [String]
    deriving (Eq, Show)

-- | @LambdaTerm a@ representa una expresión lambda ya parseada
data LambdaTerm = LambdaVariable String
                | LambdaFunction { variables :: Parametros
                                 , cuerpo :: LambdaTerm}
                | LambdaApplication LambdaTerm LambdaTerm
                | LambdaStub String
                deriving (Eq, Show)

{-
    Métodos para convertir la expresión lambda a un string
-}

toStringParams :: Parametros -> String
toStringParams (Parametros []) = ""
toStringParams (Parametros [x]) = x
toStringParams (Parametros (x:xs)) = x ++ " " ++ toStringParams (Parametros xs)

toString :: LambdaTerm -> String
toString (LambdaVariable x) = x
toString (LambdaStub x) = x
toString (LambdaApplication x y) = "(" ++ toString x ++ " " ++ toString y++")"
toString (LambdaFunction vars c) = "(λ"++ toStringParams vars ++ "."++ toString c++")"
