-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParLang where
import AbsLang
import LexLang
import ErrM

}

%name pProg Prog
%name pExp Exp
%name pExp1 Exp1
%name pExp2 Exp2
%name pListStm ListStm
%name pListDecl ListDecl
%name pStm Stm
%name pDecl Decl
%name pType Type
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '(' { PT _ (TS _ 1) }
  ')' { PT _ (TS _ 2) }
  '*' { PT _ (TS _ 3) }
  '+' { PT _ (TS _ 4) }
  '++' { PT _ (TS _ 5) }
  ',' { PT _ (TS _ 6) }
  '-' { PT _ (TS _ 7) }
  '--' { PT _ (TS _ 8) }
  '.' { PT _ (TS _ 9) }
  '/' { PT _ (TS _ 10) }
  ':' { PT _ (TS _ 11) }
  ';' { PT _ (TS _ 12) }
  '<' { PT _ (TS _ 13) }
  '<=' { PT _ (TS _ 14) }
  '=' { PT _ (TS _ 15) }
  '==' { PT _ (TS _ 16) }
  '>' { PT _ (TS _ 17) }
  '>=' { PT _ (TS _ 18) }
  'and' { PT _ (TS _ 19) }
  'bool' { PT _ (TS _ 20) }
  'do' { PT _ (TS _ 21) }
  'else' { PT _ (TS _ 22) }
  'false' { PT _ (TS _ 23) }
  'for' { PT _ (TS _ 24) }
  'from' { PT _ (TS _ 25) }
  'fun' { PT _ (TS _ 26) }
  'function' { PT _ (TS _ 27) }
  'if' { PT _ (TS _ 28) }
  'int' { PT _ (TS _ 29) }
  'lambda' { PT _ (TS _ 30) }
  'not' { PT _ (TS _ 31) }
  'or' { PT _ (TS _ 32) }
  'print' { PT _ (TS _ 33) }
  'ranging' { PT _ (TS _ 34) }
  'ref' { PT _ (TS _ 35) }
  'return' { PT _ (TS _ 36) }
  'then' { PT _ (TS _ 37) }
  'to' { PT _ (TS _ 38) }
  'true' { PT _ (TS _ 39) }
  'while' { PT _ (TS _ 40) }
  'yield' { PT _ (TS _ 41) }
  '{' { PT _ (TS _ 42) }
  '}' { PT _ (TS _ 43) }

L_integ  { PT _ (TI $$) }
L_ident  { PT _ (TV $$) }


%%

Integer :: { Integer } : L_integ  { (read ( $1)) :: Integer }
Ident   :: { Ident }   : L_ident  { Ident $1 }

Prog :: { Prog }
Prog : Stm { AbsLang.Program $1 }
Exp :: { Exp }
Exp : Exp '+' Exp1 { AbsLang.EAdd $1 $3 }
    | Exp '-' Exp1 { AbsLang.ESub $1 $3 }
    | Ident '(' Exp ')' { AbsLang.ECall $1 $3 }
    | Ident '++' { AbsLang.EInc $1 }
    | Ident '--' { AbsLang.EDec $1 }
    | Ident { AbsLang.EVar $1 }
    | Exp1 { $1 }
    | Exp 'and' Exp1 { AbsLang.BCon $1 $3 }
    | Exp 'or' Exp1 { AbsLang.BAlt $1 $3 }
    | 'not' Exp1 { AbsLang.BNeg $2 }
    | 'lambda' '(' Ident ')' ':' Stm { AbsLang.FLam $3 $6 }
Exp1 :: { Exp }
Exp1 : Exp1 '*' Exp2 { AbsLang.EMul $1 $3 }
     | Exp1 '/' Exp2 { AbsLang.EDiv $1 $3 }
     | Exp2 { $1 }
     | 'true' { AbsLang.BTrue }
     | 'false' { AbsLang.BFalse }
     | Exp '<=' Exp { AbsLang.BLe $1 $3 }
     | Exp '<' Exp { AbsLang.BLt $1 $3 }
     | Exp '>=' Exp { AbsLang.BGe $1 $3 }
     | Exp '>' Exp { AbsLang.BGt $1 $3 }
     | Exp '==' Exp { AbsLang.BEq $1 $3 }
Exp2 :: { Exp }
Exp2 : Integer { AbsLang.EInt $1 } | '(' Exp ')' { $2 }
ListStm :: { [Stm] }
ListStm : {- empty -} { [] }
        | Stm ListStm { (:) $1 $2 }
        | {- empty -} { [] }
        | Stm { (:[]) $1 }
        | Stm ';' ListStm { (:) $1 $3 }
ListDecl :: { [Decl] }
ListDecl : {- empty -} { [] }
         | Decl '.' ListDecl { (:) $1 $3 }
         | {- empty -} { [] }
         | Decl { (:[]) $1 }
         | Decl ',' ListDecl { (:) $1 $3 }
Stm :: { Stm }
Stm : Ident '=' Exp { AbsLang.SAss $1 $3 }
    | 'while' Exp 'do' Stm { AbsLang.SWhile $2 $4 }
    | 'if' Exp 'then' Stm { AbsLang.SIf $2 $4 }
    | 'if' Exp 'then' Stm 'else' Stm { AbsLang.SIfEl $2 $4 $6 }
    | '{' ListDecl ListStm '}' { AbsLang.SBlock $2 $3 }
    | 'print' Exp { AbsLang.SPrint $2 }
    | 'for' Ident 'ranging' 'from' Exp 'to' Exp 'do' Stm { AbsLang.SFor $2 $5 $7 $9 }
    | 'return' Exp { AbsLang.SRet $2 }
    | 'yield' Exp { AbsLang.SYield $2 }
Decl :: { Decl }
Decl : Type Ident { AbsLang.DVar $1 $2 }
     | 'function' Ident '(' Ident ')' Stm { AbsLang.DFun $2 $4 $6 }
     | 'function' Ident '(' 'ref' Ident ')' Stm { AbsLang.DRFun $2 $5 $7 }
     | 'function' Ident '(' 'fun' Ident ')' Stm { AbsLang.DFFun $2 $5 $7 }
Type :: { Type }
Type : 'int' { AbsLang.TInt } | 'bool' { AbsLang.TBool }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
}

