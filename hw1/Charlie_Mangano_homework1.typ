#import "@preview/mannot:0.3.0": *
#import "@preview/physica:0.9.6": *
#set document(
	author: "charlie mangano",
	date: auto,
	title: [quantum hw1],
)
#set page(
	paper: "a4",
	header: [
		_charlie mangano_ #h(1fr) #emph([#datetime.today().display("[day].[month].[year]")])
	],
	numbering: "1",
)
#show heading.where(level: 1): it => [#it.body]
#set heading(numbering: (..nums) => {
  if nums.pos().len() == 1 { return none }
	numbering("A.", ..nums.pos().slice(1))
  }
)
#let bish = rgb(80, 150, 150)
#show figure.where(kind: "aparte"): set align(start)
#show figure.where(kind: "aparte"): it => block(inset: (left: 8pt, top: 2pt, bottom: 2pt), width: 100%, breakable: false, stroke: (left: bish), spacing: 16pt, {
	strong({
    set text(size: 1.15em)
		it.supplement
		[]
		it.counter.display("1")
    []
  })
	[\ ]
  it.body
})
#show: super-plus-as-dagger
#let question = a => figure(kind: "aparte", supplement: "Exercise ")[#a]
#let Omeghat = $hat(Omega)$
#let Zhat = $hat(Z)$
#let Xhat = $hat(X)$
#let Hhat = $hat(H)$
#let Ihat = $hat(I)$
#let Yhat = $hat(Y)$
#let MXhat = $mat(0, 1; 1, 0)$
#let MYhat = $mat(0, -i; i, 0)$
#let MZhat = $mat(1, 0; 0, -1)$

#align(
	center, 
	text(1.5em)[
		*Homework 1* 
	]
)

= Part 1

== Qubit states and their representation in the Bloch sphere

#question[Construct $2 times 2$ matrix $Zhat$, the eigenvectors of which are $ket(0)$ and $ket(1)$ and the corresponding eigenvalues are $+1$ and $-1$. That is $Zhat ket(0) = +1 ket(0)$ and $Zhat ket(1) = -1 ket(1)$.]

Let $Zhat = mat(a, b; c ,d)$. Then:
$ Zhat ket(0) = +1 ket(0) &<=> mat(a, b; c ,d) mat(1;0) = mat(1;0) \ 
&<=> mat(a;c) = mat(1;0) \ 
&<=> a = 1 and c = 0 $

So $Zhat = mat(1, b; 0 ,d)$. In the same way, we find:
$ Zhat ket(0) = -1 ket(1) &<=> mat(a, b; c ,d) mat(0;1) = mat(0;-1) \ 
&<=> mat(b;d) = mat(0;-1) \ 
&<=> b = 0 and d = -1 $

#markhl[Therefore, we can build $Zhat = mat(1, 0; 0, -1)$.]


#question[Find the matrix for a linear operator $hat(X)$ which turns $ket(0)$ into $ket(1)$ and $ket(1)$ into $ket(0)$.]

Let $Xhat = mat(a, b; c, d)$. Then:

$ Xhat ket(0) = ket(1) &<=> mat(a, b; c, d) mat(1; 0) = mat(0; 1) \
&<=> mat(a; c) = mat(0; 1) \
&<=> a = 0 and c = 1 $

and:

$ Xhat ket(1) = ket(0) &<=> mat(a, b; c, d) mat(0; 1) = mat(1; 0) \
&<=> mat(b; d) = mat(1; 0) \ 
&<=> b = 1 and d = 0 $

#markhl[Therefore, we can build $Xhat = mat(0, 1;1, 0)$.]


#question[Mark the states $ket(+)$ and $ket(-)$ together with states $ket(0)$ and $ket(1)$ on the Bloch sphere.]

The states $ket(+) "and" ket(-)$ are at the intersections of the sphere with the $x$-axis, and $ket(0) "and" ket(1)$ are at the intersections of the sphere with the $z$-axis:

#figure(image("hw1_question3.jpg", width: 60%))


#question[Show that $ket(+)$ and $ket(-)$ also form a basis. What would be $ket(0)$ and $ket(1)$ in this new basis?]

We have:
$ braket(+) = mat(1/sqrt(2), 1/sqrt(2)) mat(1/sqrt(2); 1/sqrt(2)) = 1/2 + 1/2 = 1 $ 
and:
$	braket(-) = mat(1/sqrt(2), -1/sqrt(2)) mat(1/sqrt(2); -1/sqrt(2)) = 1/2 + 1/2 = 1 $
#markhl[So $ket(+)$ and $ket(-)$ are normal.]

We also have:
$ braket(+, -) = mat(1/sqrt(2), 1/sqrt(2)) mat(1/sqrt(2); -1/sqrt(2)) = 1/2 - 1/2 = 0 $
and:
$ braket(-, +) = mat(1/sqrt(2), -1/sqrt(2)) mat(1/sqrt(2); 1/sqrt(2)) = - 1/2 + 1/2 = 0 $
#markhl[So $ket(+)$ and $ket(-)$ are orthogonal.]

#markhl[Therefore, they form a basis.]

Now, we want to express $ket(0)$ and $ket(1)$ in this new basis. Looking at the states on the Bloch sphere, we intuit that we might find #markhl[$ket(0) = 1/sqrt(2) ket(+) + 1/sqrt(2) ket(-)$]. We check this by substitution:

$ 1/sqrt(2) ket(+) + 1/sqrt(2) ket(-) &= 1/2 ket(0) + 1/2 ket(1) + 1/2 ket(0) - 1/2 ket(1) \
&= ket(0) + 1/2 ket(1) - 1/2 ket(1) \
&= ket(0) $

Similarly with #markhl[$ket(1) = 1/sqrt(2) ket(+) - 1/sqrt(2) ket(-)$]:

$ 1/sqrt(2) ket(+) - 1/sqrt(2) ket(-) &= 1/2 ket(0) + 1/2 ket(1) - 1/2 ket(0) + 1/2 ket(1) \
&= 1/2 ket(0) - 1/2 ket(0) + ket(1) \
&= ket(1) $


#question[Find the matrix for a linear operator $Xhat$ (int the computational basis), the eigenvectors of which are $ket(+)$ and $ket(-)$ and eigenvalues $+1$ and $-1$, respectively.]

We want to find $Xhat$ such that: 
 - $Xhat ket(+) = +1 ket(+)$
 - $Xhat ket(-) = -1 ket(-)$

Let $Xhat = mat(a, b; c, d)$. Then:
$ Xhat ket(+) = +1 ket(+) &<=> mat(a, b; c, d) mat(1/sqrt(2); 1/sqrt(2)) = mat(1/sqrt(2); 1/sqrt(2)) \
&<=> mat((a + b)/sqrt(2); (c + d)/sqrt(2)) = mat(1/sqrt(2); 1/sqrt(2)) \
&<=> mat(a + b; c + d) = mat(1; 1) \
&<=> a + b = 1 and c + d = 1 $ 

In the same way:
$ Xhat ket(-) = -1 ket(-) &<=> mat(a, b; c, d) mat(1/sqrt(2); -1/sqrt(2)) = mat(-1/sqrt(2); 1/sqrt(2)) \
&<=> mat((a - b)/sqrt(2); (c - d)/sqrt(2)) = mat(-1/sqrt(2); 1/sqrt(2)) \
&<=> mat(a - b; c - d) = mat(-1; 1) \
&<=> a - b = -1 and c - d = 1 $ 

Therefor we have: 
$ cases(a + b = 1, a - b = -1, c + d = 1, c - d = 1) <=> cases(a = 0, b = 1, c = 1, d = 0)   $

And we get: $markhl(Xhat = mat(0, 1; 1, 0))$. This is a linear operator since it's a matrix.


#question[Find out states $Xhat ket(0), Xhat ket(1), Zhat ket(+), Zhat ket(-)$.]

$ Xhat ket(0) = mat(0, 1; 1, 0) mat(1; 0) = markhl(mat(0; 1)) $
$ Xhat ket(1) = mat(0, 1; 1, 0) mat(0; 1) = markhl(mat(1; 0)) $
$ Zhat ket(+) = mat(1, 0; 0, -1) mat(1/sqrt(2); 1/sqrt(2)) = markhl(mat(1/sqrt(2); -1/sqrt(2))) $
$ Zhat ket(-) = mat(1, 0; 0, -1) mat(1/sqrt(2); -1/sqrt(2)) = markhl(mat(1/sqrt(2); 1/sqrt(2))) $


#question[Apply $Hhat$ to states $ket(0), ket(1), ket(+), ket(-)$. Check that $Hhat^2 = Ihat$]

#columns(4)[
	$ &Hhat ket(0) \ &= 1/sqrt(2) mat(1, 1; 1, -1) mat(1; 0) \ &= mat(1/sqrt(2); 1/sqrt(2)) \ &= markhl(ket(+)) $
	#colbreak()
	$ &Hhat ket(1) \ &= 1/sqrt(2) mat(1, 1; 1, -1) mat(0; 1) \ &= mat(1/sqrt(2); -1/sqrt(2)) \ &= markhl(ket(-)) $
	#colbreak()
	$ &Hhat ket(+) \ &= 1/sqrt(2) mat(1, 1; 1, -1) mat(1/sqrt(2); 1/sqrt(2)) \ &= mat(1; 0) \ &= markhl(ket(0)) $
	#colbreak()
	$ &Hhat ket(-) \ &= 1/sqrt(2) mat(1, 1; 1, -1) mat(1/sqrt(2); -1/sqrt(2)) \ &= mat(0; 1) \ &= markhl(ket(1)) $
]

What's more: 
$ Hhat^2 &= 1/sqrt(2) mat(1, 1; 1, -1) 1/sqrt(2) mat(1, 1; 1, -1) \ &= 1/2 mat(2, 0; 0, 2) \ &= markhl(mat(1, 0; 0, 1) = Ihat) $


#question[Mark the states $ket(+i), ket(-i)$ on the Bloch sphere with respect to the states $ket(0), ket(1), ket(+), ket(-)$.]

The new states $ket(+i) "and" ket(-i)$ are at the intersections of the $y$-axis and the sphere:
#figure(image("hw1_question8.jpg", width: 60%))


#question[Write down the following vectors (as columns and rows): $ket(+i), bra(+i), ket(-i), bra(-i)$.]

We have:
#columns(2)[
	$ &ket(+i) \ &= 1/sqrt(2) mat(1; 0) + i/sqrt(2) mat(0; 1) \ &= markhl(mat(1/sqrt(2); i/sqrt(2))) $
	#colbreak()
	$ &bra(+i) \ &= ket(+i)^+ \ &= markhl(mat(1/sqrt(2), -i/sqrt(2))) $
]

And:
#columns(2)[
	$ &ket(-i) \ &= 1/sqrt(2) mat(1; 0) - i/sqrt(2) mat(0; 1) \ &= markhl(mat(1/sqrt(2); -i/sqrt(2))) $
	#colbreak()
	$ &bra(-i) \ &= ket(-i)^+ \ &= markhl(mat(1/sqrt(2), i/sqrt(2))) $
]


#question[Find the matrix for a linear operator $Yhat$, the eigenvalues of which are $+1$ and $-1$, and the corresponding eigenvectors are $ket(+i)$ and $ket(-i)$.]

We want to find $Yhat$ such that:
 - $Yhat ket(+i) = +1 ket(+i)$
 - $Yhat ket(-i) = -1 ket(-i)$

Let $Yhat = mat(a, b; c, d)$. Then:
$ Yhat ket(+i) = +1 ket(+i) &<=> mat(a, b; c, d) mat(1/sqrt(2); i/sqrt(2)) = mat(1/sqrt(2); i/sqrt(2)) \
&<=> mat((a + i b)/sqrt(2); (c + i d)/sqrt(2)) = mat(1/sqrt(2); i/sqrt(2)) \
&<=> mat(a + i b; c + i d) = mat(1; i) \
&<=> a + i b = 1 and c + i d = i $ 

In the same way:
$ Yhat ket(-i) = -1 ket(-i) &<=> mat(a, b; c, d) mat(1/sqrt(2); -i/sqrt(2)) = mat(-1/sqrt(2); i/sqrt(2)) \
&<=> mat((a - i b)/sqrt(2); (c - i d)/sqrt(2)) = mat(-1/sqrt(2); i/sqrt(2)) \
&<=> mat(a - i b; c - i d) = mat(-1; i) \
&<=> a - i b = -1 and c - i d = i $ 

Therefore, we have: 
$ cases(a + i b = 1, a - i b = -1, c + i d = i, c - i d = i) <=> cases(a = 0, b = -i, c = i, d = 0)   $

And we get: $markhl(Yhat = mat(0, -i; i, 0))$.


#question[Show that the pair of states $ket(+i)$ and $ket(-i)$ form a basis in the vector space of states of our qubit.]

We have:
$ braket(+i) = mat(1/sqrt(2), i/sqrt(2)) mat(1/sqrt(2); -i/sqrt(2)) = 1 $ 
and:
$	braket(-) = mat(1/sqrt(2), -i/sqrt(2)) mat(1/sqrt(2); i/sqrt(2)) = 1 $
#markhl[So $ket(+)$ and $ket(-)$ are normal.]

We also have:
$ braket(+, -) = mat(1/sqrt(2), i/sqrt(2)) mat(1/sqrt(2); i/sqrt(2)) = 0 $
and:
$ braket(-, +) = mat(1/sqrt(2), -i/sqrt(2)) mat(1/sqrt(2); -i/sqrt(2)) = 0 $
#markhl[So $ket(+)$ and $ket(-)$ are orthogonal.]

#markhl[Therefore, they form a basis.]


#question[Find the matrices (in the computational basis), which, by analogy with the Hadamard operator, would convert the basis states $ket(+i)$ and $ket(-i)$ into $ket(0)$ and $ket(1)$ and back.]

Let our matrix be $hat(M) = mat(a, b; c, d)$. Then:
$ hat(M) ket(+i) = ket(0) &<=> mat(a, b; c, d) mat(1/sqrt(2); i/sqrt(2)) = mat(1; 0) \
&<=> mat((a + i b)/sqrt(2); (c + i d)/sqrt(2)) = mat(1; 0) \
&<=> (a + i b)/sqrt(2) = 1 and (c + i d)/sqrt(2) = 0 $

And:
$ hat(M) ket(-i) = ket(1) &<=> mat(a, b; c, d) mat(1/sqrt(2); -i/sqrt(2)) = mat(0; 1) \
&<=> mat((a - i b)/sqrt(2); (c - i d)/sqrt(2)) = mat(0; 1) \
&<=> (a - i b)/sqrt(2) = 0 and (c - i d)/sqrt(2) = 1 $

Therefore, we have:
$ cases(a + i b = sqrt(2), a - i b = 0, c + i d = 0, c - i d = sqrt(2)) <=> cases(a = 1/sqrt(2), b = -i/sqrt(2), c = 1/sqrt(2), d = i/sqrt(2)) $

And our conversion matrix $markhl(hat(M) = 1/sqrt(2) mat(1, -i; 1, i))$. Let's check that it works the other way around as well:

#columns(2)[
	$ hat(M)^+ ket(0) &= 1/sqrt(2) mat(1, 1; i, -i) mat(1; 0) \
	&= 1/sqrt(2) mat(1; i) \
	&= mat(1/sqrt(2); i/sqrt(2)) $
	#colbreak()
	$ hat(M)^+ ket(1) &= 1/sqrt(2) mat(1, 1; i, -i) mat(0; 1) \
	&= 1/sqrt(2) mat(1; -i) \
	&= mat(1/sqrt(2); -i/sqrt(2)) $
	
]

#question[Same question as above but this time let's convert between the basis $ket(+), ket(-)$ into $ket(+i), ket(-i)$.]

Going from the basis $(ket(+), ket(-))$ to the basis $(ket(+i), ket(-i))$ is the same as going from $(ket(+), ket(-))$ into $(ket(0), ket(1))$ (using $Hhat$) and then into $(ket(+i), ket(-i))$ (using $M^+$). The final matrix is computed by composing the other two conversion matrices.

Let the final matrix be called $hat(N)$. Then:
$ hat(N) &= hat(M)^+ Hhat \ 
&= 1/sqrt(2) mat(1, 1; i, -i) 1/sqrt(2) mat(1, 1; 1, -1) \
&= 1/2 mat(2, 0; 0, 2 i) \
&= markhl(mat(1, 0; 0, i)) $

And the matrix going the other way around is $markhl(hat(N)^+ = mat(1, 0; 0, -i))$

== Quantum measurement rules

#question[Consider Pauli operators $Xhat = MXhat, Yhat = MYhat, Zhat = MZhat$ (with their matrices written in the computational basis). Consider also new operators, obtained from the Pauli operators: $Xhat plus.minus Zhat, Xhat plus.minus Yhat, Xhat plus.minus i Yhat$. Which one(s) cannot represent an observable?]

We check that they can represent an observable by looking at whether they're Hermitian operators:

#columns(3)[
	$ Xhat = MXhat = Xhat^+ $ 
	#colbreak()
	$ Yhat = MYhat = Yhat^+ $
	#colbreak()
	$ Zhat = MZhat = Zhat^+ $
]
#columns(3)[
	$ Xhat + Zhat &= MXhat + MZhat \
	&= mat(1, 1; 1, -1) \
	&= Hhat \
	&= Hhat^+ $
	#colbreak()
	$ Xhat + Yhat &= MXhat + MYhat \
	&= mat(0, 1 - i; 1 + i, 0) \
	&= mat(0, 1 - i; 1 + i, 0)^+ $
	#colbreak()
	$ Xhat + i Yhat &= MXhat + i MYhat \
	&= MXhat + mat(0, 1; -1, 0) \
	&= mat(0, 2; 0, 0) \
	&!= mat(0, 0; 2, 0) $
	#colbreak()
	
]
#columns(3)[
	$ Xhat - Zhat &= MXhat - MZhat \ 
	&= mat(-1, 1; 1, 1) \
	&= -Hhat \
	&= -Hhat^+ $
	#colbreak()
	$ Xhat - Yhat &= MXhat - MYhat \ 
	&= mat(0, 1 + i; 1 - i, 0) \
	&= mat(0, 1 + i; 1 - i, 0)^+ $
	#colbreak()
	$ Xhat - i Yhat &= MXhat - i MYhat \ 
	&= MXhat - mat(0, 1; -1, 0) \
	&= mat(0, 0; 2, 0) \
	&!= mat(0, 2; 0, 0) $
]

#markhl[The two matrices that cannot represent an observable are $Xhat plus.minus i Yhat$.]


#question[Cosnider many copies of a qubit prepared in state $ket(+)$. We measure $Zhat$ for each qubit. What would be the mean value of the outcome? Same question for state $ket(-)$.]

The probability of reading $+1$ is given by:
$ braket(0, +)^2 &= [mat(1, 0) mat(1/sqrt(2); 1/sqrt(2))]^2 \
&= [1/sqrt(2)]^2 \
&= 1/2 $ 

The probability of reading $-1$ is given by:
$ braket(1, +)^2 &= [mat(0, 1) mat(1/sqrt(2); 1/sqrt(2))]^2 \
&= [1/sqrt(2)]^2 \
&= 1/2 $ 

#markhl[Therefore, the mean value of the outcome for states in $ket(+)$ is $1/2 dot (+1) + 1/2 dot (-1) = 0$.]

In the same way, we get that the probabilities of reading $+1$, $-1$ in the case of states $ket(-)$ are both $1/2$.

#markhl[Therefore, the mean value of the outcome for states in $ket(-)$ is $1/2 dot (+1) + 1/2 dot (-1) = 0$.]


#question[Consider the same experiment as in the exercise above but the qubit state is now a general qubit state $ket(Psi)$. Plot the mean value of the measurement outcome as a function of $theta$. Is the answer somewhat consistent with the interpretation of our qubit as a classical arrow oriented at an angle $theta$ with respect to the $Z$-axis?]

Let $ket(Psi) = cos(theta/2) ket(0) + exp(i phi.alt) sin(theta/2) ket(1)$. The probability of measuring $+1$ is $p(+1) = cos^2(theta/2)$, and the probability of measuring $-1$ is $p(-1) = sin^2(theta/2)$. The mean value of the outcome is given by:
$ p(+1) dot (+1) + p(-1) dot (-1) = markhl(cos^2(theta/2) - sin^2(theta/2) ) $

Here is a plot of that function with respect to angle $theta$:
#figure(image("hw1_question16.png", width: 80%))

This is consistent with what we expect of a classical arrow.


#question[Show that the average measurement value for the $Z$-projection in the previous exercise can be compactly written as $braket(Psi, Zhat, Psi)$.]

We have:
$ braket(Psi, Zhat, Psi) &= bra(Psi)(Zhat ket(Psi)) \
&= bra(Psi)( mat(1, 0; 0, -1) mat(cos(theta/2); exp(i phi.alt)sin(theta/2)) ) \
&= bra(Psi) mat(cos(theta/2); -exp(i phi.alt)sin(theta/2)) \
&= mat(cos(theta/2), exp(-i phi.alt)sin(theta/2)) mat(cos(theta/2); -exp(i phi.alt)sin(theta/2)) \
&= cos^2(theta/2) - exp(-i phi.alt) exp(i phi.alt) sin^2(theta/2) \
&= markhl(cos^2(theta/2) - sin^2(theta/2)) $


#question[Plot $braket(Psi, Xhat, Psi)$ as a function of the angles $theta$ and $phi.alt$. Compare it to the previously calculated $braket(Psi, Xhat, Psi)$. Do both quantities behave as $X$- and $Z$-projections of a classical arrow with a unit length?]

$ braket(Psi, Xhat, Psi) &= mat(cos(theta/2), exp(-i phi.alt)sin(theta/2)) MXhat mat(cos(theta/2); exp(i phi.alt)sin(theta/2)) \
&= mat(cos(theta/2), exp(-i phi.alt)sin(theta/2)) mat(exp(i phi.alt)sin(theta/2); cos(theta/2)) \
&= exp(i phi.alt)cos(theta/2)sin(theta/2) + exp(-i phi.alt)cos(theta/2)sin(theta/2) \
&= markhl(cos(theta/2)sin(theta/2)(exp(i phi.alt) + exp(-i phi.alt))) $

In a plot, this gives us (with $theta$ on the $x$-axis and $phi.alt$ on the $y$-axis):
#figure(image("hw1_question18.png", width: 80%))

This also is the expected behavior!


#question[Consider a qubit in state $ket(0)$ and a measurement of $Zhat$ and $Xhat$. We know that if we repeat each measurement many times (each time with a fresh qubit initialized to state $ket(0)$), the mean value for $Zhat$ would be $+1$ and the mean value for $Xhat$ would be $0$, that is $braket(0, Zhat, 0) = +1$ and $braket(0, Xhat, 0) = 0$. Let's calculate the variance of the measurement outcome, that is $braket(0, Zhat^2, 0) - braket(0, Zhat, 0)^2$ and $braket(0, Xhat^2, 0)$.]

We have:
$ braket(0, Zhat^2, 0) - braket(0, Zhat, 0)^2 &= mat(1, 0) MZhat^2 mat(1; 0) - (+1)^2 \
&= mat(1, 0) mat(1, 0; 0, 1) mat(1; 0) - 1 \
&= mat(1, 0) mat(1; 0) - 1 \
&= 1 - 1 \
&= markhl(0) $

And:
$ braket(0, Xhat^2, 0) &= mat(1, 0) MXhat^2 mat(1; 0) \
&= mat(1, 0) mat(1, 0; 0, 1) mat(1; 0) \
&= mat(1, 0) mat(1; 0) \
&= markhl(1) $


#question[Suppose we have qubit in state $ket(+)$ and measure operator $Yhat$ (measure the spin's $Y$-projection). What reading would we get after one measurement, and what would be the mean value of the readings after many measurements (each time starting with a fresh qubit in state $ket(+)$)?]

#markhl[After one measurement, we would get $+1$ (collapsed onto $ket(+i)$) or $-1$ (collapsed onto $ket(-i)$)] 

#v(-0.57em) #markhl[with probability $1/2$.] This would happen with all the fresh qubits. Therefore, after many measurements each on fresh qubits, #markhl[the mean value would be $0$.]


#question[Suppose you have a qubit prepared in state $ket(0)$. What do we get if we alternate the measurements $Zhat, Xhat, Zhat, Xhat, dots$?]

Measuring the qubit along the $Z$-axis the first time would yield $+1$, since the qubit is exactly in state $ket(0)$. Measuring it along the $X$-axis would output $plus.minus 1$ with probability $1/2$ and make it collapse towards the associated $ket(+)$ or $ket(-)$ state. Measuring again along the $Z$-axis would therefore yield $plus.minus 1$ at random, and make it collapse to the associated $ket(0)$ or $ket(1)$ state. 

#markhl[Alternating the measurements like this would always give us a random sequence of $+1$ or $-1$] (except for the first measurement since we are measuring $ket(0)$ along the $Z$-axis).


#question[Let's take a fresh qubit in state $Psi$ every time we measure. We measure the sequence $Zhat, Xhat, Zhat, Xhat, dots$. Compare to averaging the outcome in the experimental protocol of the previous exercise.]

Here, the average value of all $Xhat$ (or $Zhat$) readings would be $braket(Psi, Xhat, Psi)$ (or $Zhat$), which depends on $theta$ and $phi.alt$. However, #markhl[in the previous exercise, the average value would be $0$], since the outcomes of the measurements are randomly chosen between $plus.minus 1$.


== Unitary and Hermitian operators




