module PSPS.Design.Function where

data Pass
  = Pass

data Word
  = Word

data NotSecure
  = NotSecure

pw :: Pass -> Word -> NotSecure
pw _ _ = NotSecure
