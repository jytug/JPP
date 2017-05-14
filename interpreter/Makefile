all: genPar compile

genPar:
	cd src && bnfc ../spec/lang.bnfc -haskell

compile:
	cd src && happy -gca ParLang.y && alex -g LexLang.x && \
	ghc --make Main.hs -o ../interpreter

clean:
	rm -f interpreter && cd src && rm -f *.log *.aux *.hi *.o *.dvi &&\
	rm -f DocLang.* LexLang.* ParLang.* LayoutLang.* SkelLang.* PrintLang.* TestLang.* AbsLang.* TestLang ErrM.* SharedString.* ComposOp.* lang.dtd XMLLang.* Makefile*
