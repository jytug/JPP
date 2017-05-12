

module AbsLang where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data Prog = Program Stm
  deriving (Eq, Ord, Show, Read)

data Exp
    = EAdd Exp Exp
    | ESub Exp Exp
    | EMul Exp Exp
    | EDiv Exp Exp
    | EInt Integer
    | ECall Ident Exp
    | EInc Ident
    | EDec Ident
    | EVar Ident
    | BTrue
    | BFalse
    | BLe Exp Exp
    | BLt Exp Exp
    | BGe Exp Exp
    | BGt Exp Exp
    | BEq Exp Exp
    | BCon Exp Exp
    | BAlt Exp Exp
    | BNeg Exp
    | FLam Ident Stm
  deriving (Eq, Ord, Show, Read)

data Stm
    = SAss Ident Exp
    | SWhile Exp Stm
    | SIf Exp Stm
    | SIfEl Exp Stm Stm
    | SBlock [Decl] [Stm]
    | SPrint Exp
    | SFor Ident Exp Exp Stm
    | SRet Exp
    | SYield Exp
  deriving (Eq, Ord, Show, Read)

data Decl
    = DVar Type Ident
    | DFun Ident Ident Stm
    | DRFun Ident Ident Stm
    | DFFun Ident Ident Stm
  deriving (Eq, Ord, Show, Read)

data Type = TInt | TBool
  deriving (Eq, Ord, Show, Read)
