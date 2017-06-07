%Dummy is gramatyka('E', [prod('E', [[nt('E'), +, nt('T')], [nt('T')]]),
%                        prod('T', [[id], ['(', nt('E'), ')']]) ]).

% general, helpful predicates
set_sum(L1, [], L1).
set_sum(L1, [H2 | T2], Result) :-
    member(H2, L1),
    set_sum(L1, T2, Result), !.
    
set_sum(L1, [H2 | T2], Result) :-
    set_sum([H2 | L1], T2, Result).

% 'returns' a production list
% with an additional nonterminal Z and
% a production Z -> Starting
augment_grammar(gramatyka(S, ProdList),
                [prod('Z', [[nt(S)]]) | ProdList]).

% adds a dot on the beginning of productions
add_dot(prod(LHS, RHS), [prod(LHS, DRHS)]) :-
    add_dot_list(RHS, DRHS).

add_dot_list([], []).
add_dot_list([H|T], [[dot | H] | DT]) :-
    add_dot_list(T, DT).

% add all productions X -> _ to a list of productions
% we assume that the whole production list has no repetitions
add_dot_prods(_, [], List, List).

add_dot_prods(X, [prod(X, RHS1) | _],
              [prod(X, RHS2) | Rest2], [prod(X, DRHS) | Rest2]) :-
    add_dot_list(RHS1, DRHS1),
    set_sum(DRHS1, RHS2, DRHS), !.

add_dot_prods(X, [prod(X, RHS1) | _],
              [prod(Y, RHS2) | Rest2], [prod(Y, RHS2) | Result]) :-
    add_dot_prods(X, [prod(X, RHS1)], Rest2, Result), !.

add_dot_prods(X, [prod(X, RHS1) | _], [], [prod(X, DRHS1)]) :-
    add_dot_list(RHS1, DRHS1).

add_dot_prods(X, [prod(_, _) | Rest], List, Result) :-
    add_dot_prods(X, Rest, List, Result).

% the closure of a dot production
closure(ProdList, AllProds, Result) :-
    closure_step(ProdList, AllProds, Result).

% one step of the closure process
closure_step(Acc, _, Acc) :-
    dotted_nts(Acc, DottedNTs),
    all_on_lhs(DottedNTs, Acc),
    !.

closure_step(Acc, AllProds, Result) :-
    dotted_nts(Acc, DottedNTs),
    add_dot_prods_from_list(Acc, AllProds, DottedNTs, NewAcc),
    closure_step(NewAcc, AllProds, Result).

% finds the list of non-terminals with a dot
% on their right-hand side
dotted_nts(Prods, Result) :-
    dotted_tks(Prods, IntermediateResult),
    filter_nts(IntermediateResult, Result).

filter_nts([], []).
filter_nts([nt(S) | Rest], [S | ResRest]) :-
    filter_nts(Rest, ResRest), !.
filter_nts([_ | Rest], ResRest) :-
    filter_nts(Rest, ResRest).

dotted_tks([], []).
dotted_tks([prod(_, RHSs) | Prods], Result) :-
    dotted_tks_list1(RHSs, ResultHead),
    dotted_tks(Prods, ResultTail),
    set_sum(ResultHead, ResultTail, Result).

dotted_tks_list1([], []).
dotted_tks_list1([Head | Tail], Result) :-
    dotted_tks_list2(Head, ResultHead),
    dotted_tks_list1(Tail, ResultTail),
    set_sum(ResultHead, ResultTail, Result).
 
dotted_tks_list2([], []).
dotted_tks_list2([dot, Tk | Tail], [Tk | Rest]) :-
    dotted_tks_list2(Tail, Rest), !.
dotted_tks_list2([_ | Tail], Result) :-
    dotted_tks_list2(Tail, Result).

% adds all productions starting with elements of a list
add_dot_prods_from_list(Acc, _, [], Acc).
add_dot_prods_from_list(Acc, AllProds, [Head | Tail], Result) :-
    add_dot_prods(Head, AllProds, Acc, IntermediateResult),
    add_dot_prods_from_list(IntermediateResult, AllProds, Tail, Result).

% checks if all elements of a list are already
% as a left-hand side in a list of productions
all_on_lhs([], _).
all_on_lhs([H | T], Prods) :-
    on_lhs(H, Prods),
    all_on_lhs(T, Prods).

on_lhs(E, [prod(E, _) | _]).
on_lhs(E, [_ | L]) :- on_lhs(E, L).

% finds all transitions from a state (list of productions)
transitions(State, AllProds, Result) :-
    dotted_tks(State, AllProds, Tokens),
    list_transitions(State, Tokens, AllProds, IntermediateResult),
    closure(IntermediateResult, AllProds, Result).

list_transitions(_, [], _, []).
list_transitions(State, [HToken | TToken], AllProds, Result) :-
    shift_dot(State, HToken, newState),
    list_transitions(State, TToken, AllProds, OtherResults),
    Result = [trans(HToken, newState) | OtherResults].

shift_dot([], _, []).
shift_dot([prod(NT, LProd) | Rest], Token,
          [prod(NT, NewLProd) | TResult]) :-
    shift_dot_list1(LProd, Token, NewLProd),
    shift_dot(Rest, Token, TResult).

shift_dot_list1([], _, []).
shift_dot_list1([H | T], Token, [HResult | TResult]) :-
    shift_dot_list2(H, Token, HResult),
    shift_dot_list1(T, Token, TResult).

shift_dot_list2([], _, []).
shift_dot_list2([dot, Token | T], Token, [Token, dot | T]) :- !.
shift_dot_list2([X | T], Token, [X | Result]) :-
    shift_dot_list2(T, Token, Result).
