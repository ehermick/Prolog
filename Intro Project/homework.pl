% CSE 240 - Spring 2019
% Basic Prolog assignment for Logic Paradigm
% Assignment 5
% homework.pl
% 
% Completion Time: ~ 1 hour
% 
% Author - Emma Hermick
% 
% Version - 1

%--2--
% Weather is hot. If weather is hot, everyone likes it
hot(weather). % Fact
likes(_, weather) :- hot(weather). % Rule

%--3--
%They both produce the same result
% Prolog processes the "+" and "-" both in a normal order
% and this other order
% N is -(+(5,6),4). -- the same as saying 5+6-4 which is
% the equivalent of (5+6)-4

%--4--
% Facts & Rules
woman(jane). 	%(1)
man(john).		%(2)
healthy(john). 	%(3)
healthy(jane).	%(4)
wealthy(john).	%(5)
traveler(Person) :- healthy(Person), wealthy(Person).	%(6)
can_travel(Person) :- traveler(Person). 	%(7)

% Goals (queries)
% (8) Who can travel? -- can_travel(X).
	% john (X = john)
% (9) Who is healthy and wealthy? -- healthy(X), wealthy(X).
	% john (X = john)

%--5--
% Queries
% vegetable(X).
	% X = carrot AND X = egg_plant
% vegetable(potato).
	% false
% likes(jose, What).
	% What = carrot AND What = egg_plant
% likes(Who, egg_plant).
	% Who = jose
% loves(Who, egg_plant).
	% Who = jose AND Who = james

%--6--
% A) English statement for facts and rules
	% fib(1,1).
		%The fibonacci number of 1 is 1.
	% fib(2,1).
		%The fibonacci number of 2 is 1.
	% fib(N,R):- N >= 3,N1 is N-1,N2 is N-2,fib(N1,R1),fib(N2,R2),R is R1+R2. 
		%The fibonacci number of N is R IF N is greater than or equal to 3, 
		%AND N1 is N-1, AND N2 is N-2, AND the fibonacci number of N1 is R1,
		%AND the fibonacci number of N2 is R2, AND R is R1 + R2
		
% B) Step by step how the fib(3) is calculated
	% ~ fib(1,1) -- 3 is not equal to 1
	% ~ fib(2,1) -- 3 is not equal to 2
	% ~ fib(N,R) -- 3 sub in for N
		% ~ N >= 3 -- true (3 = 3)
		% ~ N1 is N-1 -- N1 is 2 (3-1)
		% ~ N2 is N-2 -- N2 is 1 (3-2)
		% ~ fib(N1,R1) -- N1 is 2
			% ~ fib(1,1) -- 2 is not equal to 1
			% ~ fib(2,1) -- 2 is equal to 2 -- R1 is 1
		% ~ fib(N2,R2) -- N2 is 1
			% ~ fib(1,1) -- 1 is equal to 1 -- R2 is 1
		% ~ R is R1+R2 -- R is 2
	% ~ fib(3,R) -- R is 2
	
% C) Answer and explanation of two queries
	% fib(9,R).
		% Answer - 34
		% 9th value in fibonacci sequence. Asks prolog what R would have
		% to be for the first argument of the fibonacci sequence to equal 9
	% fib (9,9).
		% Answer - false
		% This query is asking prolog if the first number can be 9 and also
		% the result is 9 - which does not exist. As found by the last question
		% if the first number is 9 then the result would be 34, not 9. Making this
		% statement false. 
		
%--7--
% Turn English sentences into applicable Prolog facts, rules & goals
% A) John reads programming book.
	reads_programming_book(john).
% B) Anyone likes sparky if he/she is an ASU student.
	likes(Person, sparky) :- asu_student(Person).
% C) Who likes sparky?
	% ?- likes(Who, sparky).
% D) Jane hates any city if it is big and crowdie.
	hates(jane, City) :- big(City), crowded(City).


%--8--
% Write the facts & rules that compute the sum of the first n numbers
sum(1,1). % base -- sum of 1 is 1
sum(N, R) :- N >= 2, N1 is N - 1,
    sum(N1, R1), R is N + R1.