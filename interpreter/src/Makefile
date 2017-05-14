all:
	happy -gca ParLang.y
	alex -g LexLang.x
	ghc --make Main.hs -o interpreter

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi TestLang interpreter

distclean: clean
	-rm -f DocLang.* LexLang.* ParLang.* LayoutLang.* SkelLang.* PrintLang.* TestLang.* AbsLang.* TestLang ErrM.* SharedString.* ComposOp.* lang.dtd XMLLang.* Makefile*
	

