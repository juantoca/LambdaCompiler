module Internals.LambdaParserTest where

import CompiladorLambda

-- | Parsear la expresión lambda que representa a @x@ debe ser igual al propio @x@
prop_idemparseo :: LambdaTerm -> Bool
prop_idemparseo x = x == read (toString x)
