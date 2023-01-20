domains
	person = address(name, street, city, state, zip)
	name, street, city, state, zip = String

predicates
	readaddress(person)
	go

clauses
	go:- 
		readaddress(Address),
		nl, write(Address), nl, nl,
		write("Accept (y/n)? "),
		readchar(Reply), Reply = 'y', !.
	
	go:-
		nl,
		write("please re-enter : "),
		nl,go.
		
	readaddress(address(Name, Street, City, State, Zip)):-
		write("Name : "), readln(Name),
		write("Street : "), readln(Street),
		write("city : "), readln(City),
		write("State : "), readln(State),
		write("Zip : "), readln(Zip).
