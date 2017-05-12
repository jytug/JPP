{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParLang where
import AbsLang
import LexLang
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn12 :: (Integer) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> (Integer)
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: (Ident) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> (Ident)
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: (Prog) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> (Prog)
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: (Exp) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> (Exp)
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: (Exp) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> (Exp)
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: (Exp) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> (Exp)
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: ([Stm]) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> ([Stm])
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: ([Decl]) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> ([Decl])
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: (Stm) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> (Stm)
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: (Decl) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> (Decl)
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (Type) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> (Type)
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x3e\x01\x01\x00\x01\x00\x03\x00\x24\x01\xef\xff\x3e\x01\x17\x00\xf9\xff\x9b\x00\x00\x00\xa8\x00\x00\x00\x00\x00\xa8\x00\x98\x00\x98\x00\xa7\x00\xa5\x00\x97\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x0e\x01\x00\x00\x94\x00\x20\x00\x94\x00\x19\x00\x00\x00\x94\x00\x01\x00\x6b\x00\xf5\x00\xfe\xff\x00\x00\x00\x00\xa4\x00\x01\x00\x00\x00\x02\x00\xe6\x00\x67\x00\x00\x00\x03\x00\x03\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\xbc\x00\x56\x00\x01\x00\x00\x00\x00\x00\x78\x00\x00\x00\x19\x01\xf6\x00\xf6\x00\x33\x01\xf5\x00\xe1\x00\xf5\x00\xf5\x00\x49\x00\x5f\x00\x01\x00\x7c\x00\x00\x00\xf4\xff\xf5\x00\x54\x00\x3e\x01\x3e\x01\x4d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x64\x00\x60\x00\xab\x00\x9a\x00\xf5\x00\xf5\x00\xf5\x00\xf5\x00\xf5\x00\x89\x00\x89\x00\x00\x00\x00\x00\x59\x00\x00\x00\x00\x00\x00\x00\x4a\x00\x01\x00\x48\x00\x28\x00\x28\x00\x39\x00\x18\x00\x3e\x01\x41\x00\x3e\x01\x3e\x01\x00\x00\x00\x00\x01\x00\x00\x00\x3e\x01\x3e\x01\x00\x00\x00\x00\xcd\x00\x3e\x01\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x22\x00\xdb\x01\xd5\x01\x8f\x00\x7a\x00\xaa\x00\xe2\x00\x88\x00\x2c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x32\x00\x26\x00\x00\x00\x00\x00\x1d\x00\xcf\x01\xc9\x01\xc3\x01\xbd\x01\xb7\x01\x99\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5d\x00\x00\x00\x00\x00\xb1\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xab\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x79\x00\x6a\x00\xa5\x01\x9f\x01\x99\x01\x93\x01\x8d\x01\x87\x01\x81\x01\x7b\x01\x75\x01\x00\x00\x10\x00\x6f\x01\x00\x00\x00\x00\x00\x00\x00\x00\x57\x00\x42\x00\x12\x00\x36\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x69\x01\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\xd1\x00\xcf\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x18\x01\x00\x00\x06\x00\x04\x00\x00\x00\x00\x00\xc0\x00\x00\x00\xaf\x00\x9e\x00\x00\x00\x00\x00\xfa\x00\x00\x00\x86\x00\x38\x00\x00\x00\x00\x00\x00\x00\x37\x00\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\xda\xff\xd5\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf6\xff\x00\x00\xc4\xff\xc5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd5\xff\xf5\xff\x00\x00\xd4\xff\x00\x00\xd9\xff\xde\xff\x00\x00\x00\x00\xee\xff\x00\x00\xed\xff\xe6\xff\xe4\xff\x00\x00\x00\x00\xe5\xff\x00\x00\xed\xff\x00\x00\xf4\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xea\xff\x00\x00\x00\x00\xf0\xff\xef\xff\x00\x00\xdb\xff\xda\xff\xd5\xff\xd5\xff\xda\xff\xca\xff\x00\x00\xcb\xff\xcd\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc9\xff\x00\x00\xd2\xff\x00\x00\x00\x00\x00\x00\x00\x00\xd6\xff\xd3\xff\xd8\xff\xdd\xff\x00\x00\x00\x00\xeb\xff\xec\xff\xe1\xff\xe0\xff\xdf\xff\xe3\xff\xe2\xff\xf2\xff\xf3\xff\xe7\xff\xe8\xff\x00\x00\xf1\xff\xce\xff\xd1\xff\xd0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe9\xff\xcf\xff\x00\x00\xc8\xff\x00\x00\x00\x00\xc7\xff\xc6\xff\x00\x00\x00\x00\xcc\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x03\x00\x01\x00\x14\x00\x01\x00\x01\x00\x04\x00\x01\x00\x0a\x00\x07\x00\x1b\x00\x01\x00\x1d\x00\x14\x00\x1a\x00\x0d\x00\x0e\x00\x01\x00\x10\x00\x11\x00\x12\x00\x13\x00\x1d\x00\x23\x00\x17\x00\x07\x00\x02\x00\x09\x00\x0a\x00\x2e\x00\x01\x00\x1e\x00\x1f\x00\x2d\x00\x20\x00\x01\x00\x02\x00\x0c\x00\x06\x00\x01\x00\x27\x00\x09\x00\x08\x00\x14\x00\x2e\x00\x2c\x00\x2d\x00\x2c\x00\x2e\x00\x18\x00\x1b\x00\x01\x00\x1d\x00\x1c\x00\x0a\x00\x01\x00\x01\x00\x01\x00\x21\x00\x02\x00\x06\x00\x24\x00\x08\x00\x08\x00\x08\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x04\x00\x2d\x00\x2e\x00\x07\x00\x07\x00\x02\x00\x09\x00\x0a\x00\x04\x00\x0d\x00\x0e\x00\x07\x00\x10\x00\x11\x00\x12\x00\x13\x00\x2d\x00\x0d\x00\x0e\x00\x01\x00\x10\x00\x11\x00\x12\x00\x13\x00\x06\x00\x01\x00\x08\x00\x16\x00\x20\x00\x02\x00\x06\x00\x0b\x00\x08\x00\x02\x00\x26\x00\x04\x00\x20\x00\x00\x00\x07\x00\x01\x00\x19\x00\x25\x00\x05\x00\x05\x00\x0d\x00\x0e\x00\x08\x00\x10\x00\x11\x00\x12\x00\x13\x00\x2b\x00\x00\x00\x02\x00\x01\x00\x04\x00\x01\x00\x05\x00\x07\x00\x06\x00\x22\x00\x08\x00\x2d\x00\x20\x00\x0d\x00\x0e\x00\x01\x00\x10\x00\x11\x00\x12\x00\x13\x00\x03\x00\x04\x00\x08\x00\x00\x00\x07\x00\x09\x00\x0a\x00\x0a\x00\x05\x00\x2e\x00\x0d\x00\x0e\x00\x20\x00\x10\x00\x11\x00\x12\x00\x13\x00\x03\x00\x04\x00\x01\x00\x07\x00\x07\x00\x09\x00\x0a\x00\x0a\x00\x01\x00\x08\x00\x0d\x00\x0e\x00\x20\x00\x10\x00\x11\x00\x12\x00\x13\x00\x03\x00\x04\x00\x01\x00\x07\x00\x07\x00\x09\x00\x0a\x00\x0a\x00\x0f\x00\x08\x00\x0d\x00\x0e\x00\x20\x00\x10\x00\x11\x00\x12\x00\x13\x00\x03\x00\x04\x00\x01\x00\x2e\x00\x07\x00\x2d\x00\x2d\x00\x0a\x00\x2c\x00\x08\x00\x0d\x00\x0e\x00\x20\x00\x10\x00\x11\x00\x12\x00\x13\x00\x01\x00\x04\x00\x01\x00\x2e\x00\x07\x00\xff\xff\x2e\x00\x08\x00\xff\xff\x08\x00\x0d\x00\x0e\x00\x20\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\x01\x00\xff\xff\x04\x00\xff\xff\xff\xff\x07\x00\x03\x00\x08\x00\xff\xff\xff\xff\x20\x00\x0d\x00\x0e\x00\x0a\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x04\x00\x00\x00\x01\x00\x07\x00\x03\x00\x04\x00\x05\x00\xff\xff\x20\x00\x0d\x00\x0e\x00\xff\xff\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\x14\x00\xff\xff\xff\xff\xff\xff\x18\x00\xff\xff\xff\xff\x1b\x00\x1c\x00\x1d\x00\xff\xff\x20\x00\xff\xff\x21\x00\x00\x00\x01\x00\x24\x00\x03\x00\x04\x00\x05\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x14\x00\x2d\x00\x2e\x00\xff\xff\x18\x00\xff\xff\xff\xff\x1b\x00\x1c\x00\x1d\x00\xff\xff\xff\xff\xff\xff\x21\x00\xff\xff\x18\x00\x24\x00\xff\xff\xff\xff\x1c\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x21\x00\x2d\x00\x18\x00\x24\x00\xff\xff\xff\xff\x1c\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x21\x00\x2d\x00\x2e\x00\x24\x00\xff\xff\xff\xff\x18\x00\x28\x00\x29\x00\x2a\x00\x1c\x00\xff\xff\x2d\x00\x2e\x00\xff\xff\x21\x00\xff\xff\x18\x00\x24\x00\xff\xff\xff\xff\x1c\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x21\x00\x2d\x00\xff\xff\x24\x00\xff\xff\xff\xff\xff\xff\x28\x00\x29\x00\x2a\x00\x00\x00\x01\x00\x2d\x00\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\x00\x00\x01\x00\xff\xff\x03\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x2f\x00\x22\x00\x0d\x00\x22\x00\x6d\x00\x31\x00\x6e\x00\x30\x00\x32\x00\x11\x00\x6a\x00\x0e\x00\x0d\x00\x6c\x00\x33\x00\x34\x00\x58\x00\x35\x00\x36\x00\x37\x00\x38\x00\x0e\x00\x6d\x00\x27\x00\x53\x00\x78\x00\x1c\x00\x0f\x00\xd5\xff\x49\x00\x28\x00\x29\x00\x1b\x00\x39\x00\x11\x00\x2c\x00\x41\x00\x42\x00\x4b\x00\x2a\x00\x43\x00\x2d\x00\x0d\x00\xff\xff\x0b\x00\x1b\x00\x0b\x00\xff\xff\x14\x00\x11\x00\x4c\x00\x0e\x00\x15\x00\x0b\x00\x11\x00\x11\x00\x11\x00\x16\x00\x79\x00\x52\x00\x17\x00\x1e\x00\x7d\x00\x79\x00\x18\x00\x19\x00\x1a\x00\xd9\xff\x31\x00\x1b\x00\xd9\xff\x32\x00\x54\x00\x70\x00\x1c\x00\x0f\x00\x31\x00\x33\x00\x34\x00\x32\x00\x35\x00\x36\x00\x37\x00\x38\x00\x1b\x00\x33\x00\x34\x00\x11\x00\x35\x00\x36\x00\x37\x00\x38\x00\x55\x00\x11\x00\x1e\x00\x72\x00\x39\x00\x65\x00\x3f\x00\x73\x00\x1e\x00\x66\x00\x76\x00\x31\x00\x39\x00\x1f\x00\x32\x00\x3c\x00\x6a\x00\x51\x00\x62\x00\x3d\x00\x33\x00\x34\x00\x3e\x00\x35\x00\x36\x00\x37\x00\x38\x00\x67\x00\x1f\x00\x57\x00\x11\x00\x31\x00\x4e\x00\x63\x00\x32\x00\x1d\x00\x50\x00\x1e\x00\x1b\x00\x39\x00\x33\x00\x34\x00\x11\x00\x35\x00\x36\x00\x37\x00\x38\x00\x2f\x00\xed\xff\x7a\x00\x1f\x00\xed\xff\x0e\x00\x0f\x00\x30\x00\x20\x00\xff\xff\xed\xff\xed\xff\x39\x00\xed\xff\xed\xff\xed\xff\xed\xff\x2f\x00\xec\xff\x11\x00\x43\x00\xec\xff\x1c\x00\x0f\x00\x30\x00\x3b\x00\x73\x00\xec\xff\xec\xff\xed\xff\xec\xff\xec\xff\xec\xff\xec\xff\x2f\x00\xeb\xff\x11\x00\x1b\x00\xeb\xff\x1c\x00\x0f\x00\x30\x00\x4b\x00\x74\x00\xeb\xff\xeb\xff\xec\xff\xeb\xff\xeb\xff\xeb\xff\xeb\xff\x2f\x00\xea\xff\x11\x00\xff\xff\xea\xff\x1b\x00\x1b\x00\x30\x00\x0b\x00\x76\x00\xea\xff\xea\xff\xeb\xff\xea\xff\xea\xff\xea\xff\xea\xff\x11\x00\x31\x00\x11\x00\xff\xff\x32\x00\x00\x00\xff\xff\x67\x00\x00\x00\x68\x00\x33\x00\x34\x00\xea\xff\x35\x00\x36\x00\x37\x00\x38\x00\x00\x00\x7d\x00\x11\x00\x00\x00\x31\x00\x00\x00\x00\x00\x32\x00\x2f\x00\x12\x00\x00\x00\x00\x00\x39\x00\x33\x00\x34\x00\x30\x00\x35\x00\x36\x00\x37\x00\x38\x00\x00\x00\x52\x00\x00\x00\x00\x00\x31\x00\x1f\x00\x22\x00\x32\x00\x7b\x00\x2b\x00\x25\x00\x00\x00\x39\x00\x33\x00\x34\x00\x00\x00\x35\x00\x36\x00\x37\x00\x38\x00\x00\x00\x0d\x00\x00\x00\x00\x00\x00\x00\xd5\xff\x00\x00\x00\x00\x11\x00\xd5\xff\x0e\x00\x00\x00\x39\x00\x00\x00\xd5\xff\x1f\x00\x22\x00\xd5\xff\x70\x00\x2b\x00\x25\x00\xd5\xff\xd5\xff\xd5\xff\xd5\xff\x0d\x00\xd5\xff\xd5\xff\x00\x00\xd5\xff\x00\x00\x00\x00\x11\x00\xd5\xff\x0e\x00\x00\x00\x00\x00\x00\x00\xd5\xff\x00\x00\x14\x00\xd5\xff\x00\x00\x00\x00\x15\x00\xd5\xff\xd5\xff\xd5\xff\xd5\xff\x16\x00\xd5\xff\x14\x00\x17\x00\x00\x00\x00\x00\x15\x00\x18\x00\x19\x00\x1a\x00\xda\xff\x16\x00\x1b\x00\xda\xff\x17\x00\x00\x00\x00\x00\x14\x00\x18\x00\x19\x00\x1a\x00\x15\x00\x00\x00\x1b\x00\xda\xff\x00\x00\x16\x00\x00\x00\x14\x00\x17\x00\x00\x00\x00\x00\x15\x00\x18\x00\x19\x00\x1a\x00\xda\xff\x16\x00\x1b\x00\x00\x00\x17\x00\x00\x00\x00\x00\x00\x00\x18\x00\x19\x00\x1a\x00\x1f\x00\x22\x00\x1b\x00\x4e\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x57\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x23\x00\x59\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x23\x00\x5a\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x5b\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x5c\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x5d\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x5e\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x5f\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x23\x00\x60\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x23\x00\x61\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x23\x00\x39\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x3e\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x44\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x45\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x46\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x47\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x48\x00\x2b\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x23\x00\x24\x00\x25\x00\x1f\x00\x22\x00\x00\x00\x2a\x00\x2b\x00\x25\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (9, 59) [
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59)
	]

happy_n_terms = 47 :: Int
happy_n_nonterms = 11 :: Int

happyReduce_9 = happySpecReduce_1  0# happyReduction_9
happyReduction_9 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn12
		 ((read ( happy_var_1)) :: Integer
	)}

happyReduce_10 = happySpecReduce_1  1# happyReduction_10
happyReduction_10 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn13
		 (Ident happy_var_1
	)}

happyReduce_11 = happySpecReduce_1  2# happyReduction_11
happyReduction_11 happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (AbsLang.Program happy_var_1
	)}

happyReduce_12 = happySpecReduce_3  3# happyReduction_12
happyReduction_12 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (AbsLang.EAdd happy_var_1 happy_var_3
	)}}

happyReduce_13 = happySpecReduce_3  3# happyReduction_13
happyReduction_13 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (AbsLang.ESub happy_var_1 happy_var_3
	)}}

happyReduce_14 = happyReduce 4# 3# happyReduction_14
happyReduction_14 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (AbsLang.ECall happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_15 = happySpecReduce_2  3# happyReduction_15
happyReduction_15 happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (AbsLang.EInc happy_var_1
	)}

happyReduce_16 = happySpecReduce_2  3# happyReduction_16
happyReduction_16 happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (AbsLang.EDec happy_var_1
	)}

happyReduce_17 = happySpecReduce_1  3# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (AbsLang.EVar happy_var_1
	)}

happyReduce_18 = happySpecReduce_1  3# happyReduction_18
happyReduction_18 happy_x_1
	 =  case happyOut16 happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (happy_var_1
	)}

happyReduce_19 = happySpecReduce_3  3# happyReduction_19
happyReduction_19 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (AbsLang.BCon happy_var_1 happy_var_3
	)}}

happyReduce_20 = happySpecReduce_3  3# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (AbsLang.BAlt happy_var_1 happy_var_3
	)}}

happyReduce_21 = happySpecReduce_2  3# happyReduction_21
happyReduction_21 happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_2 of { happy_var_2 -> 
	happyIn15
		 (AbsLang.BNeg happy_var_2
	)}

happyReduce_22 = happyReduce 6# 3# happyReduction_22
happyReduction_22 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_3 of { happy_var_3 -> 
	case happyOut20 happy_x_6 of { happy_var_6 -> 
	happyIn15
		 (AbsLang.FLam happy_var_3 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_23 = happySpecReduce_3  4# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsLang.EMul happy_var_1 happy_var_3
	)}}

happyReduce_24 = happySpecReduce_3  4# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsLang.EDiv happy_var_1 happy_var_3
	)}}

happyReduce_25 = happySpecReduce_1  4# happyReduction_25
happyReduction_25 happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	happyIn16
		 (happy_var_1
	)}

happyReduce_26 = happySpecReduce_1  4# happyReduction_26
happyReduction_26 happy_x_1
	 =  happyIn16
		 (AbsLang.BTrue
	)

happyReduce_27 = happySpecReduce_1  4# happyReduction_27
happyReduction_27 happy_x_1
	 =  happyIn16
		 (AbsLang.BFalse
	)

happyReduce_28 = happySpecReduce_3  4# happyReduction_28
happyReduction_28 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsLang.BLe happy_var_1 happy_var_3
	)}}

happyReduce_29 = happySpecReduce_3  4# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsLang.BLt happy_var_1 happy_var_3
	)}}

happyReduce_30 = happySpecReduce_3  4# happyReduction_30
happyReduction_30 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsLang.BGe happy_var_1 happy_var_3
	)}}

happyReduce_31 = happySpecReduce_3  4# happyReduction_31
happyReduction_31 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsLang.BGt happy_var_1 happy_var_3
	)}}

happyReduce_32 = happySpecReduce_3  4# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsLang.BEq happy_var_1 happy_var_3
	)}}

happyReduce_33 = happySpecReduce_1  5# happyReduction_33
happyReduction_33 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (AbsLang.EInt happy_var_1
	)}

happyReduce_34 = happySpecReduce_3  5# happyReduction_34
happyReduction_34 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_2 of { happy_var_2 -> 
	happyIn17
		 (happy_var_2
	)}

happyReduce_35 = happySpecReduce_0  6# happyReduction_35
happyReduction_35  =  happyIn18
		 ([]
	)

happyReduce_36 = happySpecReduce_2  6# happyReduction_36
happyReduction_36 happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	case happyOut18 happy_x_2 of { happy_var_2 -> 
	happyIn18
		 ((:) happy_var_1 happy_var_2
	)}}

happyReduce_37 = happySpecReduce_0  6# happyReduction_37
happyReduction_37  =  happyIn18
		 ([]
	)

happyReduce_38 = happySpecReduce_1  6# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	happyIn18
		 ((:[]) happy_var_1
	)}

happyReduce_39 = happySpecReduce_3  6# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	case happyOut18 happy_x_3 of { happy_var_3 -> 
	happyIn18
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_40 = happySpecReduce_0  7# happyReduction_40
happyReduction_40  =  happyIn19
		 ([]
	)

happyReduce_41 = happySpecReduce_3  7# happyReduction_41
happyReduction_41 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_3 of { happy_var_3 -> 
	happyIn19
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_42 = happySpecReduce_0  7# happyReduction_42
happyReduction_42  =  happyIn19
		 ([]
	)

happyReduce_43 = happySpecReduce_1  7# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	happyIn19
		 ((:[]) happy_var_1
	)}

happyReduce_44 = happySpecReduce_3  7# happyReduction_44
happyReduction_44 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_3 of { happy_var_3 -> 
	happyIn19
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_45 = happySpecReduce_3  8# happyReduction_45
happyReduction_45 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsLang.SAss happy_var_1 happy_var_3
	)}}

happyReduce_46 = happyReduce 4# 8# happyReduction_46
happyReduction_46 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut15 happy_x_2 of { happy_var_2 -> 
	case happyOut20 happy_x_4 of { happy_var_4 -> 
	happyIn20
		 (AbsLang.SWhile happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_47 = happyReduce 4# 8# happyReduction_47
happyReduction_47 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut15 happy_x_2 of { happy_var_2 -> 
	case happyOut20 happy_x_4 of { happy_var_4 -> 
	happyIn20
		 (AbsLang.SIf happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_48 = happyReduce 6# 8# happyReduction_48
happyReduction_48 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut15 happy_x_2 of { happy_var_2 -> 
	case happyOut20 happy_x_4 of { happy_var_4 -> 
	case happyOut20 happy_x_6 of { happy_var_6 -> 
	happyIn20
		 (AbsLang.SIfEl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_49 = happyReduce 4# 8# happyReduction_49
happyReduction_49 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut19 happy_x_2 of { happy_var_2 -> 
	case happyOut18 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsLang.SBlock happy_var_2 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_50 = happySpecReduce_2  8# happyReduction_50
happyReduction_50 happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_2 of { happy_var_2 -> 
	happyIn20
		 (AbsLang.SPrint happy_var_2
	)}

happyReduce_51 = happyReduce 9# 8# happyReduction_51
happyReduction_51 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_2 of { happy_var_2 -> 
	case happyOut15 happy_x_5 of { happy_var_5 -> 
	case happyOut15 happy_x_7 of { happy_var_7 -> 
	case happyOut20 happy_x_9 of { happy_var_9 -> 
	happyIn20
		 (AbsLang.SFor happy_var_2 happy_var_5 happy_var_7 happy_var_9
	) `HappyStk` happyRest}}}}

happyReduce_52 = happySpecReduce_2  8# happyReduction_52
happyReduction_52 happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_2 of { happy_var_2 -> 
	happyIn20
		 (AbsLang.SRet happy_var_2
	)}

happyReduce_53 = happySpecReduce_2  8# happyReduction_53
happyReduction_53 happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_2 of { happy_var_2 -> 
	happyIn20
		 (AbsLang.SYield happy_var_2
	)}

happyReduce_54 = happySpecReduce_2  9# happyReduction_54
happyReduction_54 happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	case happyOut13 happy_x_2 of { happy_var_2 -> 
	happyIn21
		 (AbsLang.DVar happy_var_1 happy_var_2
	)}}

happyReduce_55 = happyReduce 6# 9# happyReduction_55
happyReduction_55 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_2 of { happy_var_2 -> 
	case happyOut13 happy_x_4 of { happy_var_4 -> 
	case happyOut20 happy_x_6 of { happy_var_6 -> 
	happyIn21
		 (AbsLang.DFun happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_56 = happyReduce 7# 9# happyReduction_56
happyReduction_56 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_2 of { happy_var_2 -> 
	case happyOut13 happy_x_5 of { happy_var_5 -> 
	case happyOut20 happy_x_7 of { happy_var_7 -> 
	happyIn21
		 (AbsLang.DRFun happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest}}}

happyReduce_57 = happyReduce 7# 9# happyReduction_57
happyReduction_57 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut13 happy_x_2 of { happy_var_2 -> 
	case happyOut13 happy_x_5 of { happy_var_5 -> 
	case happyOut20 happy_x_7 of { happy_var_7 -> 
	happyIn21
		 (AbsLang.DFFun happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest}}}

happyReduce_58 = happySpecReduce_1  10# happyReduction_58
happyReduction_58 happy_x_1
	 =  happyIn22
		 (AbsLang.TInt
	)

happyReduce_59 = happySpecReduce_1  10# happyReduction_59
happyReduction_59 happy_x_1
	 =  happyIn22
		 (AbsLang.TBool
	)

happyNewToken action sts stk [] =
	happyDoAction 46# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TS _ 38) -> cont 38#;
	PT _ (TS _ 39) -> cont 39#;
	PT _ (TS _ 40) -> cont 40#;
	PT _ (TS _ 41) -> cont 41#;
	PT _ (TS _ 42) -> cont 42#;
	PT _ (TS _ 43) -> cont 43#;
	PT _ (TI happy_dollar_dollar) -> cont 44#;
	PT _ (TV happy_dollar_dollar) -> cont 45#;
	_ -> happyError' (tk:tks)
	}

happyError_ 46# tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => [(Token)] -> Err a
happyError' = happyError

pProg tks = happySomeParser where
  happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut14 x))

pExp tks = happySomeParser where
  happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (happyOut15 x))

pExp1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (happyOut16 x))

pExp2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (happyOut17 x))

pListStm tks = happySomeParser where
  happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (happyOut18 x))

pListDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (happyOut19 x))

pStm tks = happySomeParser where
  happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (happyOut20 x))

pDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (happyOut21 x))

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (happyOut22 x))

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 11 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4










































{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}





-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 46 "templates/GenericTemplate.hs" #-}


data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList





{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}


          case action of
                0#           -> {- nothing -}
                                     happyFail i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}


                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = indexShortOffAddr happyActOffsets st
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st


indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#





data HappyAddr = HappyA# Happy_GHC_Exts.Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 170 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = indexShortOffAddr happyGotoOffsets st1
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i



          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = indexShortOffAddr happyGotoOffsets st
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
