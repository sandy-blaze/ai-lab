distance(a, b, 10).
distance(a, c, 20).
distance(a, d, 15).
distance(b, e, 14).
distance(b, f, 25).
distance(c, g, 30).
distance(c, h, 5).

find_distance(X, Y, Z):-
	distance(X, Y, D),
	Z is D.

find_distance(X, Y, Z1):-
	distance(X, Z, D1),
	find_distance(Z, Y, D2),
	Z1 is D1 + D2.
