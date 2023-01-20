next(_, 1):- true.
next(_, 2):- true.
next(_, 3):- true.
next(_, 4):- true.
next(_, 5):- true.
next(_, 6):- true.
next(_, 7):- true.
next(_, 8):- true.

safe([], _, _).
safe([(X, Y)|T], R, C):-
    not(X == R), not(Y == C),
    XD is X - R, YD is Y - C, NXD is R - X,
    not(XD == YD), not(NXD == YD),
    safe(T, R, C).

solve(L, 9, L):- true.
solve(L, R, A):-
    next(R, C),
    safe(L, R, C),
    RN is R + 1,
    solve([(R, C)|L], RN, A).

print([], X):- write(X).
print([(_, C)|T], X):-
    print(T, [C|X]).

solve_8_queens():- 
    solve([], 1, A), 
    print(A, []).
