parent(a, b).
parent(a, c).
parent(a, d).
parent(a, x).
parent(b, e).
parent(b, f).
parent(c, g).
parent(c, h).
parent(c, i).
parent(d, j).
parent(e, k).
parent(f, l).
parent(f, m).
parent(h, n).
parent(i, o).
parent(i, p).
parent(j, q).
parent(j, r).
parent(j, s).
parent(m, t).

dfs(X):-
    format('~p ', [X]),
    parent(X, Y),
    dfs(Y).
