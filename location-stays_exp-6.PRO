domains
	x, y = String

predicates
	person_male(x)
	person_female(x)
	territory_of(x, y)
	state_of(x, y)
	city_of(x, y)
	state1_of(x, y)
	city1_of(x, y)
	sub1_of(x, y)
	area1_of(x, y)
	b1_of(x, y)
	u1_of(x, y)
	a1_of(x, y)

clauses

	person_male(jack).
	person_male(oliver).
	person_male(ali).
	person_male(james).
	person_male(simon).
	person_male(harry).
	person_female(helen).
	person_female(sophie).
	person_female(jess).
	person_female(lily).

	territory_of(jack, jess).
	territory_of(jack, lily).
	territory_of(helen, jess).
	territory_of(helen, lily).
	territory_of(oliver, james).
	territory_of(sophie, james).
	territory_of(jess, simon).
	territory_of(ali, simon).
	territory_of(lily, harry).
	territory_of(james, harry).

	state_of(X, Y):- 
		person_male(X),
    		territory_of(X, Y).

	city_of(X, Y):- 
		person_female(X),
    		territory_of(X, Y).

	state1_of(X, Y):- 
		person_male(X),
    		territory_of(X, Z),
    		territory_of(Z, Y).

	city1_of(X, Y):- 
		person_female(X),
    		territory_of(X, Z),
    		territory_of(Z, Y).

 
	sub1_of(X,Y):- %(X, Y or Y, X)%
    		person_female(X),
    		city_of(F, Y), 
    		state_of(F, X),
    		X = Y.

	sub1_of(X, Y):- 
		person_female(X),
   		city_of(M, Y), 
   		city_of(M, X),
   		X = Y.

	area1_of(X, Y):- 
		person_female(X),
    		territory_of(Z, Y), 
    		sub1_of(Z, X), !.
    	
	b1_of(X, Y) :- %(X, Y or Y, X)%
		person_male(X),
		state_of(F, Y),
		state_of(F, X),
		X = Y.

	b1_of(X, Y) :- 
		person_male(X),
		city_of(M, Y),
		city_of(M, X),
		X \= Y.

	u1_of(X, Y) :-
		territory_of(Z, Y), 
		b1_of(Z,X).
	
	a1_of(X, Y) :-
		territory_of(X, Y).
	
	a1_of(X, Y) :-
		territory_of(X, Z),
		al_of(Z, Y).
	

