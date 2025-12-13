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
#let Lhat = $hat(L)$
#let Ihat = $hat(I)$
#let Yhat = $hat(Y)$
#let Uhat = $hat(U)$
#let MXhat = $mat(0, 1; 1, 0)$
#let MYhat = $mat(0, -i; i, 0)$
#let MZhat = $mat(1, 0; 0, -1)$
#let MIhat = $mat(1, 0; 0, 1)$
#let pdvt = $pdv(, t)$

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

#question[Check that any unitary operator $Uhat$ applied to a state $ket(Psi)$ creates a state $ket(Psi') = alpha_0 ket(0) + alpha_1 ket(1)$ where $alpha_0 alpha_0^* + alpha_1 alpha_1^* = 1$.]

We know that $braket(psi) = alpha_psi alpha_psi^* + beta_psi beta_psi^*$.

We have $ket(Psi') = Uhat ket(Psi)$ and $bra(Psi') = bra(Psi)Uhat^+$. Then:
$ alpha_0 alpha_0^* + alpha_1 alpha_1^* &= braket(Psi') \
&= braket(Psi, Uhat^+ Uhat, Psi) \
&= braket(Psi, Ihat, Psi) \
&= braket(Psi) \
&= cos^2(theta/2) + sin^2(theta/2) \
&= markhl(1) $


#question[Check that the Pauli operators $Xhat, Yhat, Zhat$ are both hermitian and unitary. Illustrate both properties of $Xhat, Yhat$, and $Zhat$ using vectors $ket(0), ket(1), ket(+), ket(-), ket(+i), ket(-i)$.]

We have:
#columns(2)[
	Hermitian:
	$	Xhat^+ = MXhat^+ = MXhat = markhl(Xhat) $
	$	Yhat^+ = MYhat^+ = MYhat = markhl(Yhat) $
	$	Zhat^+ = MZhat^+ = MZhat = markhl(Zhat) $

	#colbreak()
	Unitary:
	$ Xhat^+ Xhat = Xhat^2 = MXhat MXhat = markhl(Ihat) $
	$ Yhat^+ Yhat = Yhat^2 = MYhat MYhat = markhl(Ihat) $
	$ Zhat^+ Zhat = Zhat^2 = MZhat MZhat = markhl(Ihat) $
]

What's more, we check the hermitian and unitary properties (resp. real eigenvalues and orthogonal eigenvectors, and inner product preservation):

#columns(3)[
	$ Xhat: &"eigenvvectors:" ket(+), ket(-) \ 
	&"eigenvalues:" markhl[$+1, -1 in RR$] \
	&"orthogonal:" markhl(braket(+, -) = 0) \
	&"inner product preservation:" \
	&markhl(braket(Xhat +, Xhat +) = 1 = braket(+, +)) \
	&markhl(braket(Xhat -, Xhat -) = -1 = braket(-, -)) $
	#colbreak()
	$ Yhat: &"eigenvvectors:" ket(+i), ket(-i) \ 
	&"eigenvalues:" markhl[$+1, -1 in RR$] \
	&"orthogonal:" markhl(braket(+i, -i) = 0) \
	&"inner product preservation:" \
	&markhl(braket(Yhat +i, Yhat +i) = 1 = braket(+i, +i)) \
	&markhl(braket(Yhat -i, Yhat -i) = -1 = braket(-i, -i)) $
	#colbreak()
	$ Zhat: &"eigenvvectors:" ket(0), ket(1) \ 
	&"eigenvalues:" markhl[$+1, -1 in RR$] \
	&"orthogonal:" markhl(braket(0, 1) = 0) \
	&"inner product preservation:" \
	&markhl(braket(Zhat 0, Zhat 0) = 1 = braket(0, 0)) \
	&markhl(braket(Zhat 1, Zhat 1) = -1 = braket(1, 1)) $
]


#question[Repeat the steps above for finding the matrix for $Xhat$-operator using its eigenvectors $ket(plus.minus)$ and eigenvalues $plus.minus 1$.]

The eigenvectors for $Xhat$ are $h_0 = ket(+) = mat(1/sqrt(2); 1/sqrt(2))$ and $h_1 = ket(-) = mat(1/sqrt(2); -1/sqrt(2))$, with eigenvalues $h_0 = +1, h_1 = -1$ respectively. Then:

$ Xhat &= sum_(i=0)^1 h_i ketbra(h_i) \
&= h_0 ketbra(h_0) + h_1 ketbra(h_1) \
&= ketbra(+) - ketbra(-) \
&= 1/2 mat(1, 1; 1, 1) - 1/2 mat(1, -1; -1, 1) \
&= markhl(MXhat) $

#question[Do the same as above but for $Yhat$, using its eigenvectors $ket(plus.minus i)$ and eigenvalues $plus.minus 1$.]

The eigenvectors for $Yhat$ are $h_0 = ket(+i) = mat(1/sqrt(2); i/sqrt(2))$ and $h_1 = ket(-i) = mat(1/sqrt(2); -i/sqrt(2))$, with eigenvalues $h_0 = +1, h_1 = -1$ respectively. Then:

$ Yhat &= sum_(i=0)^1 h_i ketbra(h_i) \
&= h_0 ketbra(h_0) + h_1 ketbra(h_1) \
&= ketbra(+i) - ketbra(-i) \
&= 1/2 mat(1, -i; i, 1) - 1/2 mat(1, i; -i, -1) \
&= markhl(MYhat) $


#question[Use the representation of a Hermitian operator above to prove that $Hhat^n = sum_("all eigenstates") h_i^n ketbra(h_i)$.]

The Hermitian is defined as: $cases(Hhat ket(h_i) = h_i ket(h_i), Hhat = sum_("all eigenstates") h_i ketbra(h_i))$, with $f(Hhat) = sum_("all eigenstates") f(h_i) ketbra(h_i)$. A Hermitian matrix of size $N times N$ has $N$ eigenvectors and associated eigenvalues.

$ Hhat^n = (sum_(i = 0)^(N-1) h_i ketbra(h_i) )^n $

We note that since eigenvectors are orthogonal, we have that $markhl(forall i != j\,  ketbra(h_i, h_j) = braket(h_i, h_j) = 0)$. Therefore, when developping the product, every term mixing $i != j$ is equal to zero. #markhl[We only keep the terms where $i = j$]:

$ Hhat^n = h_0^n (ketbra(h_0))^n + h_1^n (ketbra(h_1))^n + dots + h_(N-1)^n (ketbra(h_(N-1)))^n $

We also note that:

$ (ketbra(a))^n &= (ketbra(a))(ketbra(a))(ketbra(a)) dots (ketbra(a)) \
&= ket(a) braket(a) braket(a) bra(a) dots ket(a) bra(a) \
&= markhl(ketbra(a)) $

Therefore:

$ Hhat^n &= h_0^n ketbra(h_0) + h_1^n ketbra(h_1) + dots + h_(N-1)^n ketbra(h_(N-1)) \
&= markhl(sum_(i = 0)^(N-1) h_i^n ketbra(h_i)) $

#question[Show that any unitary operator $Uhat$ (represented by an $N times N$ matrix) can be written as $Uhat = exp(i alpha Hhat)$, where $alpha$ is a real number and $Hhat$ is some hermitian operator matrix.]

Let $lambda_0, dots lambda_(N-1)$ the eigenvalues of $Uhat$. We can write $Uhat = dmat(lambda_0, dots, lambda_(N-1))$ since $Uhat$ diagonalizable. We have:
$ Uhat Uhat^+ = Ihat &<=> dmat(lambda_0, dots, lambda_(N-1)) dmat(lambda_0^*, dots, lambda_(N-1)^*) = dmat(1, dots, 1) \
&<=> lambda_i lambda_i^* = 1 \
&=> norm(lambda_i) = 1 \
&=> markhl("we can write" lambda_i "in their exponential forms:" lambda_i = exp(i theta_i)\, theta_i in RR) $

Since $ket(u_i)$ are orthonormal (eigenvectors of $Uhat$), and $theta_i in RR$, we can write:
$ Hhat &= sum_(i = 0)^(N-1) theta_i ketbra(u_i) $

Now we use $f(Hhat) = sum_i f(h_i) ketbra(h_i)$ to find $Uhat$ in the basis of eigenvectors of $Hhat$. Let $f(x) = exp(i alpha x) $. Then:
$ f(Hhat) &= sum_(i = 0)^(N-1) f(theta_i) ketbra(U_i) \
&= markhl(sum_(i = 0)^(N-1) exp(i alpha theta_i) ketbra(u_i)) $

For $alpha = 1$, we get:
$ f(Hhat) &= exp(i Hhat) = sum_(i = 0)^(N-1) exp(i theta_i) ketbra(u_i) \
&= sum_(i = 0)^(N-1) lambda_i ketbra(u_i) \
&= markhl(Uhat) $

If we want a general $alpha$ ($alpha != 1$), we can define $Hhat' = 1/alpha Hhat$ and use that instead.


== Rotating the qubit state on the Bloch sphere

#question[Show that $exp(-i alpha/2 Xhat)$ is a rotation of the Bloch vector by an angle $alpha$ around $X$-axis.]

We know that:
$ exp(-i alpha/2 Xhat) &= Ihat cos(alpha/2) - i Xhat sin(alpha/2) \ 
&= markhl(mat(cos(alpha/2), -i sin(alpha/2); -i sin(alpha/2), cos(alpha/2))) $

We apply $exp(-i alpha/2 Xhat)$ to a pair of basis states $ket(+)$ and $ket(-)$:
#columns(2)[
	$ &exp(-i alpha/2 Xhat) ket(+) \
	&= mat(cos(alpha/2), -i sin(alpha/2); -i sin(alpha/2), cos(alpha/2)) mat(1/sqrt(2); 1/sqrt(2)) \
	&= 1/sqrt(2) (cos(alpha/2) - i sin(-alpha/2)) mat(1; 1) \
	&= exp(-i alpha/2) mat(1/sqrt(2); 1/sqrt(2)) \
	&= markhl(exp(-i alpha/2) ket(+)) $
	#colbreak()
	$ &exp(-i alpha/2 Xhat) ket(-) \
	&= mat(cos(alpha/2), -i sin(alpha/2); -i sin(alpha/2), cos(alpha/2)) mat(1/sqrt(2); -1/sqrt(2)) \
	&= 1/sqrt(2) (cos(alpha/2) + i sin(alpha/2)) mat(1; -1) \
	&= exp(i alpha/2) mat(1/sqrt(2); -1/sqrt(2)) \
	&= markhl(exp(i alpha/2) ket(-)) $
]

Therefore, #markhl[this operator rotates the state in the $Y Z$-plane.]


#question[Show that $exp(-i alpha/2 Yhat)$ is a rotation of the Bloch vector by an angle $alpha$ around $Y$-axis.]

In the same way, we find: 
$ cases(
	exp(-i alpha/2 Yhat) ket(+i) = markhl(exp(-i alpha/2) ket(+i)),
	exp(-i alpha/2 Yhat) ket(-i) = markhl(exp(i alpha/2) ket(-i))
) $

Therefore, #markhl[this operator rotates the state in the $X Z$-plane.]


#question[Show that a general qubit state $ket(Psi)$ can be obtained by first rotating $ket(0)$ by an angle $theta$ around $Y$-axis and then rotating by angle $phi.alt$ around $Z$-axis: 
$ ket(Phi) = exp(-i phi.alt/2 Zhat) exp(-i theta/2 Yhat) ket(0) $]

Let $ket(Psi) = cos(theta/2) ket(0) + exp(i phi.alt) sin(theta/2) ket(1)$.

We first apply the rotation around the $Y$-axis. Let $alpha = theta$: 
$ -i alpha/2 Yhat = -i theta/2 Yhat = mat(0, -theta/2; theta/2, 0) $

And, using matrix exponentiation in the same way as earlier::
$ exp(-i alpha/2 Yhat) &= exp(-i theta/2 Yhat) \
&= markhl(rot2mat(theta/2)) $

So we find:
$ ket(Psi_("intermediary")) &= exp(-i alpha/2 Yhat) ket(0) \
&= rot2mat(theta/2) mat(1; 0) \
&= markhl(cos(theta/2) ket(0) + sin(theta) ket(1)) $

In the same way, we rotate the obtained $ket(Psi_("intermediary"))$ by $phi.alt$ around $Z$-axis. Let $alpha = phi.alt$:
$ -i alpha/2 Zhat = -i phi.alt/2 Zhat = mat(-phi.alt/2, 0; 0, phi.alt/2) $

Since this matrix is diagonal, its exponentiation is just the exponentiation of its diagonal coefficents, we have:
$ exp(-i alpha/2 Zhat) &= exp(-i theta/2 Zhat) \
&= markhl(dmat(exp(-i phi.alt/2), exp(i phi.alt/2))) $

So we get:
$ exp(-i phi.alt/2 Zhat) ket(Psi_("intermediate")) &= exp(-i phi.alt/2 Zhat) (cos(theta/2) ket(0) + sin(theta) ket(1)) \
&= exp(-i phi.alt/2) cos(theta/2) ket(0) + exp(i phi.alt/2) sin(theta/2) ket(1) \
&= exp(-i phi.alt/2) (cos(theta/2) ket(0) + exp(i phi.alt) sin(theta/2) ket(1)) \
&= markhl(ket(Psi)) "up to the global phase" $


#question[Is the order of rotations important in the previous exercise?]

#markhl[The order of rotations is important] since rotations about different axes do not commute.

#question[Let $hat(M) = (Xhat + Zhat)/sqrt(2)$ a hermitian operator and define a rotation $exp(-i alpha/2 hat(M))$. Figure out what it does.]

$hat(M) = 1/sqrt(2) mat(1, 1; 1, -1)$ is the Hadamard operator (this is the matrix that converts from basis $(ket(0), ket(1))$ to $(ket(+), ket(-))$ and back). We saw that $exp(-i alpha/2 hat(M))$ is the rotation matrix about the axis defined by the eigenvectors of $hat(M)$. Let's find its eigenvectors $ket(m_0), ket(m_1)$:

#columns(2)[
	$ &hat(M) ket(m_0) = ket(m_0) \
	&<=> 1/sqrt(2) mat(1, 1; 1, -1) mat(a; b) = mat(a; b)  \
	&<=> cases(
		a/sqrt(2) + b/sqrt(2) = a, 
		a/sqrt(2) - b/sqrt(2) = b
	) \
	&<=> a = 1 + sqrt(2) and b = 1 $ 
	#colbreak()
	$ &hat(M) ket(m_1) = ket(m_1) \ 
	&<=> 1/sqrt(2) mat(1, 1; 1, -1) mat(c; d) = mat(-c; -d) \
	&<=> cases(
		c/sqrt(2) + d/sqrt(2) = -c, 
		c/sqrt(2) - d/sqrt(2) = -d
	) \
	&<=> c = 1 - sqrt(2) and d = 1 $
]

We get the eigenvectors $markhl(ket(m_0) = mat(1 + sqrt(2); 1))$ and $markhl(ket(m_1) = mat(1 - sqrt(2); 1))$.  Therefore, $exp(-i alpha/2 hat(M))$ is the #markhl[rotation around the axis defined by $ket(m_0) = mat(1 + sqrt(2); 1)$ and $ket(m_1) = mat(1 - sqrt(2); 1)$.]


#question[Based on the previous two exercises, is it true that $exp(-i alpha (Xhat + Zhat)) = exp(-i alpha Xhat) exp(-i alpha Zhat)$?]

#markhl[No]: 
$ exp(-i alpha (Xhat + Zhat)) = exp(-i alpha (Zhat + Xhat)) $ 

But we saw that:
$ exp(-i alpha Xhat) exp(-i alpha Zhat) != exp(-i alpha Zhat) exp(-i alpha Xhat) $


#question[Consider another unitary operator $exp(-i alpha/2 hat(M))$, where $hat(M) = (Xhat + Yhat)/sqrt(2)$. What kind of rotation on the Bloch sphere is it?]

This is a #markhl[rotation around the axis defined by the eigenvectors of $(Xhat + Yhat)/sqrt(2) = mat(0, (1 - i)/sqrt(2); (1 + i)/sqrt(2), 0)$] (by analogy with the Hadamard matrix we saw earlier).


== Qubit state tomography

#question[Write down the values of $theta$ and $phi.alt$ in terms of the mean values $braket(Psi, Xhat, Psi)$, $braket(Psi, Yhat, Psi)$ and $braket(Psi, Zhat, Psi)$. Do we really need to know both $X$- and $Y$-projections?]

We have:
$ braket(Psi, Zhat, Psi) = cos(theta) \
<=> markhl(theta = arccos(braket(Psi, Zhat, Psi))) $

And:
$ braket(Psi, Xhat, Psi) &= sin(theta) cos(phi.alt) \
&= sin(arccos(braket(Psi, Zhat, Psi))) cos(phi.alt) $
$ <=> markhl(phi.alt = arccos(braket(Psi, Xhat, Psi) / sin(arccos(braket(Psi, Zhat, Psi))))) $

#markhl[We need both projection to differenciate between $plus.minus phi.alt$.]


#question[Come up with a specific protocol for measuring $braket(Psi, Xhat, Psi)$ using an instrument that can only measures $Zhat$.]

We can #markhl[use the Hadamard matrix] since it converts from a measurement of $Zhat$ to a measurement of $Xhat$ and back. Therefore, #markhl[we apply $Hhat$ to our qubit and measure $Zhat$]. We get:
$ cases(
	"outcome" = +1 <=> "measurement of" Xhat = +1,
	"outcome" = -1 <=> "measurement of" Xhat = -1
) $

And therefore, we have:
$ markhl(braket(Psi, Xhat, Psi) = braket(Hhat Psi, Zhat, Hhat Psi)) $


= Part 2
#counter(figure.where(kind: "aparte")).update(0)

== Time-evolution of the qubit state

#question[Verify the following equation for the time evolution of the _mean value_ of a measurement outcome of some hermitian operator $Lhat$: 
$ pdv(, t) braket(Psi(t), Lhat, Psi(t)) = braket(Psi(t), (-i/hbar [Lhat, Hhat]), Psi(t)), $
where $[Lhat, Hhat] = Lhat Hhat - Hhat Lhat$.]

We have:
$ pdv(, t) ket(Psi(t)) = -i/hbar Hhat ket(Psi(t)) $
$ pdv(, t) bra(Psi(t)) = i/hbar bra(Psi(t)) Hhat $

In the mean value, $Lhat$ is not time-dependant, so it acts as a scalar, and we can use the product rule on the $Psi(t)$ braket. We get:
$ pdv(, t) braket(Psi(t), Lhat, Psi(t)) &= braket(pdv(, t) Psi(t), Lhat, Psi(t)) + braket(Psi(t), Lhat, pdv(, t) Psi(t)) \
&= braket(i/hbar Psi(t), Hhat Lhat, Psi(t)) + braket(Psi(t), Lhat Hhat, -i/hbar ket(Psi(t))) \
&= i/hbar braket(Psi(t), Hhat Lhat, Psi(t)) - i/hbar braket(Psi(t), Lhat Hhat, ket(Psi(t))) \
&= i/hbar (braket(Psi(t), Hhat Lhat, Psi(t)) - braket(Psi(t), Lhat Hhat, ket(Psi(t)))) \
&= i/hbar braket(Psi(t), Hhat Lhat - Lhat Hhat, Psi(t)) \
&= markhl(i/hbar braket(Psi(t), [Lhat, Hhat], Psi(t))) $


#question[Plug the above wave funtion into Eq. 1 and obtain the following solution of the Schrodinger's equation: 
$ ket(Psi(t)) = exp(-i E_0/hbar t) times alpha_0(t=0) ket(E_0) + exp(-i E_1/hbar t) times alpha_1(t=0) ket(E_1) $]

Pluging $ket(Psi(t)) = alpha_0(t) ket(E_0) + alpha_1(t) ket(E_1)$ into both sides of Eq. 1 separately, we get:
$ pdv(, t) ket(Psi) &= pdv(, t) (alpha_0(t) ket(E_0) + alpha_1(t) ket(E_1)) \
&= pdvt alpha_0(t) ket(E_0) + pdvt alpha_1(t) ket(E_1) $
And: 
$ -i/hbar Hhat ket(Psi) &= -i/hbar Hhat (alpha_0(t) ket(E_0) + alpha_1(t) ket(E_1)) \
&= -i/hbar alpha_0(t) Hhat ket(E_0) - i/hbar alpha_1(t) Hhat ket(E_1) \
&= -i/hbar alpha_0(t) E_0 ket(E_0) - i/hbar alpha_1(t) E_1 ket(E_1) $

Therefore, we get:
$ cases(pdvt alpha_0(t) = -i/hbar alpha_0(t) E_0, pdvt alpha_1(t) = -i/hbar alpha_1(t) E_1) => markhl(cases(alpha_0(t) = K_0 exp(-i/hbar E_0 t), alpha_1(t) = K_1 exp(-i/hbar E_1 t))) $


#question[Show that if a qubit starts in an energy eigenstate $ket(E_0)$ or $ket(E_1)$, it stays in that state, no time-evolution takes place.]

Let $ket(Psi(0)) = ket(E_0)$. Then:
$ ket(Psi(0)) = ket(E_0) = 1 dot ket(E_0) + 0 dot ket(E_1) \
=> markhl(alpha_0(t = 0) = 1 and alpha_1(t = 0) = 0) $

So:
$ ket(Psi(t)) &= alpha_0(t = 0) ket(E_0) + alpha_1(t = 0) exp(-i (E_1 - E_0)/hbar dot t) ket(E_1) \
&= 1 dot ket(E_0) + 0 dot exp(-i (E_1 - E_0)/hbar dot t) ket(E_1) \
&= markhl(ket(E_0)) $

#markhl[This can be mirrored for $ket(E_1)$].


#question[Set up a Bloch sphere in the basis $ket(E_0), ket(E_1)$ and consider $alpha_0(t = 0) = alpha_1(t = 0) = 1/sqrt(2)$. Show the qubit state at $t = 0$ and mark its time-evolution.]

For $alpha_(0, 1)(t = 0) = 1/sqrt(2)$, we have:
$ ket(Psi(0)) = 1/sqrt(2) ket(E_0) + 1/sqrt(2) ket(E_1) $

On the Bloch sphere, it's at the intersection between the sphere and the $X$-axis, and its time-evolution $ket(Psi(t))$ is its rotation around the $Z$-axis with an angle $phi.alt$:
#figure(image("hw1_question4.jpg", width: 60%))


#question[What would be the perios of oscillations of the qubit in this case? Does it make sense why Big Mac is classical now? How small should the qubit energy difference be for the phase to oscillate in time at a more experimentally accessible frequency?]

We have the total energy of a Big Mac:
$ E_1 - E_0 = E_("Big Mac") = 590 "cal" dot 4200 = 2478000 "J" $

The period would be:
$ T_("Big Mac") &= h dot E_("Big Mac") \
&= (6 dot 10^(-34) "J" dot "s")/(2478000 "J") \
&= markhl(2.42 dot 10^(-40) "s") $

Since a Big Mac has such a #markhl[big amount of energy], it's oscillation is classical.

To be observed experimentally, it should oscillate at an accessible frequency. I do not know what such a frequency would be, but you would need to #markhl[compute $E_("accessible") = h/T_("accessible")$] to answer the question with an actual value.


#question[Show that a modified Hamiltonian $Hhat - Ihat E_0$ has the same eigenvectors as $Hhat$ and the same time-evolution of the qubit state.]

Let $E_i$ an eigenvector of $Hhat$. We have:
$ (Hhat - Ihat E_0) ket(E_i) &= Hhat ket(E_i) - Ihat E_0 ket(E_i) \
&= E_i ket(E_i) - Ihat E_0 ket(E_i) \
&= markhl((E_i - E_0) ket(E_i)) $

And:
$ pdvt ket(Psi) &= -i/hbar (Hhat - Ihat E_0) ket(Psi) \
&= -i/hbar Hhat ket(Psi) + i/hbar Ihat E_0 ket(Psi) $
// TODO !!!


#question[Check that the proposed evolution operator indeed solves the Schrodinger's equation.]

We have:
$ pdvt ket(Psi) &= pdvt exp(-i/hbar Hhat t) ket(Psi(t = 0)) \
&= -i/hbar Hhat exp(-i/hbar Hhat t) ket(Psi(t = 0)) \
&= markhl(-i/hbar Hhat ket(Psi)) $


== Hamiltonian operator for qubits

#question[show by an explicit demonstartion that any Hermitian $2 times 2$ matrix can be written as a superposition of 
$ 1/hbar Hhat = -omega_I Ihat - omega_X/2 Xhat - omega_Y/2 Yhat - omega_Z/2 Zhat $]

Any Hermitian matrix can be written as $1/hbar Hhat = mat(a, x - i y; x + i y, b)$, so we can check:
$ mat(a, x - i y; x + i y, b) &= -omega_I Ihat - omega_X/2 Xhat - omega_Y/2 Yhat - omega_Z/2 Zhat \
&<=> markhl(cases(a = omega_I + omega_Z/2, b = omega_I - omega_Z/2, x = omega_X/2, y = omega_Y/2)) $


#question[Show that eigenvalues of $Hhat/hbar$ in Eq. 7 are given by $plus.minus 1/2 sqrt(omega_X^2 + omega_Y^2 + omega_Z^2)$]

We have:
$ Hhat/hbar = 1/2 mat(omega_Z, omega_X - i omega_Y; omega_X + i omega_Y, -omega_Z) $

Let $h_i$ be an eigenvalue of $Hhat$. Then we have:
$ det(-1/2 mat(omega_Z, omega_X - i omega_Y; omega_X + i omega_Y, -omega_Z) - h_i Ihat) = 0 \
<=> (-omega_Z/2 - h_i)(omega_Z/2 - h_i) - (-1/2(omega_X - i omega_Y))(-1/2(omega_X + i omega_Y)) = 0 $

Solving that, we find:
$ markhl(h_i = plus.minus 1/2 sqrt(omega_X^2 + omega_Y^2 + omega_Z^2)) $


#question[Show that eigenstates of $Hhat/hbar$ in Eq. 7 in the Bloch sphere are aligned along (or against) the axis defined by $(omega_X, omega_Y, omega_Z)$.]

TODO
#question[Create the rotation operators in terms of $omega_X, omega_Y, omega_Z$, create the suspect eigenstates by applying the rotation operators to $ket(0)$ and $ket(1)$ and check if the rotated basis states are indeed the eigenstates.]

The rotations about the $Z$- and $Y$-axes are, respectively:
$ R_Z = exp(-i phi.alt/2 Zhat) $
$ R_Y = exp(-i theta/2 Yhat) $

So the final rotation is given by:
$ R &= R_Z R_Y \ 
&= markhl(exp(-i phi.alt/2 Zhat) exp(-i theta/2 Yhat)) $

I suspect solving exercise 10 would yield results that I could use here to express $theta$ and $phi.alt$ in terms of $omega_X, omega_Y, omega_Z$.

The suspected eigenstates are:
$ ket(h_0) &= R ket(0) \
&= R_Z R_Y ket(0) \
&= markhl(cos(theta/2) ket(0) + exp(i phi.alt) sin(theta/2) ket(1)) $

And:
$ ket(h_1) &= R ket(1) \
&= R_Z R_Y ket(1) \
&= markhl(-sin(theta/2) exp(-i phi.alt/2) ket(0) + exp(i phi.alt) cos(theta/2) ket(1)) $

To check that they are indeed eigenstates, we would have to compute $Hhat/hbar ket(h_i) = plus.minus ket(h_i)$. However, not having the answers form exercise 10, I can't verify it.


== Commutation relations of $Xhat, Yhat, Zhat$

#question[Verify all the other commutation relations involving Pauli matrices by directly multiplying the corresponding matrices.]

We find:
#columns(2)[
	$ &[Xhat, Yhat] \
	&= MXhat MYhat - MYhat MXhat \
	&= 2i Zhat $
	#colbreak()
	$ &[Yhat, Zhat] \
	&= MYhat MZhat - MZhat MYhat \
	&= 2i Xhat $
]

$ &[Zhat, Xhat] \
&= MZhat MXhat - MXhat MZhat \
&= 2i Yhat $

For the others, we use the identitties:
#columns(2)[
	$ [M, M] = 0 $
	#colbreak()
	$ [M, N] = -[N, M] $
]


#question[Let's consider a simplified case of $Hhat/hbar = -omega/2 Zhat$. Describe the evolution of $z(t)$ which follows from Eq. 8.]

We have $Hhat/hbar = -omega/2 Zhat$, so:
$ angle.l dot(X) angle.r = omega angle.l Yhat angle.r \
angle.l dot(Y) angle.r = omega angle.l Xhat angle.r \
angle.l dot(Z) angle.r = 0 $

And:
$ markhl(angle.l dot(Z) angle.r = 0 => z(t) = angle.l Z angle.r = "cste") $


#question[Show the time-evolution in the $X Y$-plane.]

There is only a #markhl[rotation in the $X Y$-plane] since both $x(t)$ and $y(t)$ are harmonic oscillations: 
#figure(image("hw1_question14.jpg", width:60%))


#question[Set $omega_X = omega_Y = omega_Z = 1$ and solve the equation of motion for $x, y, z$ numerically.]

With $omega_X = omega_Y = omega_Z = 1$, we get:
$ hat(M) = mat(0, -1, 1; 1, 0, -1; -1, 1, 0) $

And the solution to $dot(arrow(r)) = hat(M) arrow(r)$ is:
$ arrow(r)(t) = exp(hat(M) t) arrow(r)(0) $

This is a rotation around the axis defined by the eigenvectors of $hat(M)$, which are along $(1, 1, 1)$.


== Changing reference frames: "rotating" frame vs. "lab" frame

#question[Conider a qubit with a Hamiltonian $Hhat/hbar = -omega/2 Zhat$. Consider that at time $t = 0$ the qubit was initialised in state $ket(Psi_0) = 1/sqrt(2) (ket(0) + ket(1))$. Show that the time evolution of the qubit state would be 
$ ket(Psi(t)) = 1/sqrt(2) ket(0) + 1/sqrt(2) exp(-i omega t) ket(1) $]

We have the time-evolution:
$ ket(Psi(t)) &= exp(-i/hbar Hhat t) ket(Psi_0) \ 
&= exp(-i omega/2 Zhat) 1/sqrt(2) (ket(0) + ket(1)) \
&= 1/sqrt(2) exp(-i omega/2 Zhat) ket(0) + 1/sqrt(2) exp(-i omega/2 Zhat) ket(1) \
&= 1/sqrt(2) exp(-i omega/2) ket(0) + 1/sqrt(2) exp(-i omega/2) ket(1) \
&= markhl(exp(-i omega/2) (1/sqrt(2) ket(0) + 1/sqrt(2) exp(-i omega t) ket(1))) $


#question[Apply a unitary transformation $Uhat = exp(-i omega/2 Zhat t)$ to the time-dependant state of the qubit in the previous exercise. What new Hamiltonian describess the time-evolution of this new state?]

We have (from the previous exercise):
$ Uhat ket(Psi(t)) &= exp(-i omega/2) (1/sqrt(2) ket(0) + 1/sqrt(2) exp(-i omega t) ket(1)) $

And:
$ pdvt Uhat ket(Psi(t)) = Hhat' ket(Psi) $

With $Hhat'$ the new Hamiltonian. Solving that equation, we get:
$ Hhat' = markhl(-hbar/2 omega Zhat) $


#question[Consider a qubit with a Hamiltonian $Hhat/hbar = -omega_0/2 Zhat$. Considera frame change defined by the unitary $exp(-i omega/2 Zhat t)$. What is the Hamiltonian in this new frame? How would you choose $omega$ to make the evolution as simple as possible?]

Whe have:
$ Hhat' &= Uhat Hhat Uhat^+ + i hbar dot(Uhat) Uhat^+ $

And we have (since $Hhat, Uhat$ are diagonal):
#columns(2)[
	$ Uhat Hhat Uhat^+ &= Uhat Uhat^+ Hhat \
	&= Hhat \
	&= -hbar omega_0/2 Zhat $
	#colbreak()
	$ i hbar dot(Uhat) Uhat^+ &= i hbar pdvt (Uhat) Uhat^+ \
	&= i hbar pdvt (exp(-i omega/2 Zhat t)) Uhat^+ \
	&= i hbar (-i omega/2 Zhat Uhat) Uhat^+ \
	&= hbar omega/2 Zhat $
]

So we get:
$ Hhat' &= -hbar omega_0/2 Zhat + hbar omega/2 Zhat \
&= markhl(hbar (omega - omega_0)/2 Zhat) $

To make it as simple as possible, we can #markhl[set $omega = omega_0$] to get a null matrix and have a constant state.


== Implementing quantum gates: evolution after a fast switch

#question[Show the evolution on the Bloch sphere. At what time should the experimentalist set $omega = 0$ to arrive at states $ket(1), ket(+), ket(-)$?]

For $Hhat/hbar = -omega/2 Yhat$, we have a #markhl[rotation around the $Y$-axis]:
$ Uhat &= exp(i omega/2 Yhat t) \
&= cos(omega/2 t) ket(0) - sin(omega/2 t) ket(1) \
&=> theta = omega t \
&=> t = theta/omega $

So we get:
#columns(3)[
	For $ket(+)$:
	$ &theta = pi/2 \
	&=> markhl(t = pi/(2 omega)) $
	#colbreak()
	For $ket(1)$:
	$ &theta = pi \
	&=> markhl(t = pi/omega) $
	#colbreak()
	For $ket(-)$:
	$ &theta = (3 pi)/2 \
	&=> markhl(t = (3 pi)/(2 omega)) $
]

On the Bloch sphere:
#figure(image("hw1_question19.jpg", width: 60%))


#question[Show the evolution on the Bloch sphere. At what time should the experimentalist set $omega = 0$ to arrive at states $ket(1), ket(+i), ket(-i)$?]

In the same way, we have a #markhl[rotation around the $X$-axis], and we get:
#columns(3)[
	For $ket(-i)$:
	$ markhl(t = pi/(2 omega)) $
	#colbreak()
	For $ket(1)$:
	$ markhl(t = pi/omega) $
	#colbreak()
	For $ket(+i)$:
	$ markhl(t = (3 pi)/(2 omega)) $
]

On the Bloch sphere:
#figure(image("hw1_question20.jpg", width: 60%))


#question[Solve for the evolution of the state for $t > 0$ and show it on the Bloch sphere. At what time $ket(0)$ turns into $ket(+)$?]

This is a #markhl[rotation around the exis $1/sqrt(2) mat(1, 0, 1)$] with frequency $omega' = omega/sqrt(2)$. Doing the same as before, we get #markhl[$t = pi/(omega sqrt(2))$].

On the Bloch sphere:
#figure(image("hw1_question21.jpg", width: 60%))


#question[In the previous exercise, repeat the calculation but start from state $ket(+)$ at $t = 0$. At what time $ket(+)$ turns into $ket(0)$?]

The rotation is symmetric, so we get #markhl[$t = pi/(omega sqrt(2))$] as well.


#question[Consider the evolutin of the qubit starting from state $ket(0)$ during the time $tau_1$ when $omega_X = g$. Show that the evolution is a rotation of the qubit state vector in the Bloch sphere, around the axis defined by ocmponents $mat(g, 0, omega_Z)$, and with constant angular velocity $sqrt(omega_Z^2 + g^2)$. What's the period of such rotation?]

The Hamiltonian is given by:
$ Hhat = -hbar/2 (g Xhat + omega_Z Zhat) $

As seen in the previous exercises, this means that the rotation axis is given by:
$ markhl(mat(g, 0, omega_Z)) $

And we have (also as seen previously): 
$ markhl(omega = sqrt(omega_Z^2 + g^2)) $

And the rotation angle:
$ theta = omega t $

This gives us: 
$ T &= (2 pi)/omega \
&= markhl((2 pi)/sqrt(omega_Z^2 + g^2)) $






