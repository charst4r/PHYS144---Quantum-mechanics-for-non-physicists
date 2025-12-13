#import "@preview/mannot:0.3.0": *
#import "@preview/physica:0.9.6": *
#set document(
	author: "charlie mangano",
	date: auto,
	title: [quantum hw3],
)
#set page(
	paper: "a4",
	header: [
		_charlie mangano_ #h(1fr) #emph([#datetime.today().display("[day].[month].[year]")])
	],
	numbering: "1",
)
#set heading(numbering: "A.")
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
	[*:*\ ]
  it.body
})
#show figure.where(kind: "aparte2"): set align(start)
#show figure.where(kind: "aparte2"): it => block(inset: (left: 8pt, top: 2pt, bottom: 2pt), width: 100%, breakable: false, stroke: (left: orange), spacing: 16pt, {
	strong({
    set text(size: 1.15em)
		it.supplement
		[]
		it.counter.display("1")
    []
  })
	[*:*\ ]
  it.body
})
#show: super-plus-as-dagger
#show: super-T-as-transpose
#let question = a => figure(kind: "aparte", supplement: "Exercise ")[#a]
#let answer = a => figure(kind: "aparte2", supplement: "Answer ")[#a]
#let xx = $hat(x)$
#let aa = $hat(a)$
#let pp = $hat(p)$
#let HH = $hat(H)$
#let DD = $hat(D)$
#let XX = $hat(X)$
#let II = $hat(I)$
#let ZZ = $hat(Z)$
#let MM = $hat(M)$
#let YY = $hat(Y)$
#let UU = $hat(U)$
#let tensor = $times.o$

#align(
	center, 
	text(1.5em)[
		*Homework 3* 
	]
)


= Vector space for multiple qubits. Tensor product.

#question[Verify by examining all the relevant inner products of four-component column and row vectors, that states $ket(00), ket(01), ket(10), ket(11)$ form an orthonormal set.]

We check that the inner products of the vectors are null:
#columns(2)[
	$ braket(00, 01) &= (braket(0_A)) (braket(0_B, 1_B)) \
	&= 1 dot 0 \
	&= 0 $

	#colbreak()

	$ braket(00, 10) = 0 $
	$ braket(00, 11) = 0 $
	$ braket(01, 10) = 0 $
	$ "and so on" $

]

We also check that they're normalized:
#columns(2)[
	$ braket(00) &= (braket(0_A))(braket(0_B)) \
	&= 1 dot 1 \
	&= 1 $

	#colbreak()

	$ braket(10) = 1 $
	$ braket(01) = 1 $
	$ braket(11) = 1 $
]

#answer[The inner products of same vectors are equal to $1$ (normalized), and of different vectors are equal to $0$ (orthogonal). The vectors $ket(00), ket(01), ket(10), ket(11)$ are orthonormal.]


#question[Use both Dirac and matrix notations to apply the operator $XX tensor II$ to remaining three basis states $ket(01), ket(10), ket(11)$. Which method do you like better?]

In Dirac notation:
#columns(3)[
	$ &XX_A ket(01) \
	&= XX_A ket(0_A) tensor ket(1_B) \
	&= ket(1_A) tensor ket(1_B) \
	&= ket(11) $

	#colbreak()

	$ &XX_A ket(10) \
	&= XX_A ket(1_A) tensor ket(0_B) \
	&= ket(0_A) tensor ket(0_B) \
	&= ket(00) $

	#colbreak()

	$ &XX_A ket(11) \
	&= XX_A ket(1_A) tensor ket(1_B) \
	&= ket(0_A) tensor ket(1_B) \
	&= ket(01) $
]

In matrix notation:

#columns(3)[
	$ XX_A ket(01) &= mat(0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0) vec(0, 1, 0, 0) \
	&= vec(0, 0, 0, 1) = ket(11) $
	
	#colbreak()

	$ XX_A ket(10) &= mat(0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0) vec(0, 0, 1, 0) \
	&= vec(1, 0, 0, 0) = ket(00) $

	#colbreak()

	$ XX_A ket(11) &= mat(0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0) vec(0, 0, 0, 1) \
	&= vec(0, 1, 0, 0) = ket(01) $
]

#answer[We get $XX_A ket(01) = ket(11), XX_A ket(10) = ket(00), XX_A ket(11) = ket(01)$. The Dirac notation is way better.]


#question[Use both Dirac and matrix notations to apply the operator $II tensor XX$ to remaining three basis states $ket(01), ket(10), ket(11)$.]

In Dirac notation:
#columns(3)[
	$ &XX_B ket(01) \
	&= XX_B ket(0_A) tensor ket(1_B) \
	&= ket(0_A) tensor ket(0_B) \
	&= ket(00) $

	#colbreak()

	$ &XX_B ket(10) \
	&= XX_B ket(1_A) tensor ket(0_B) \
	&= ket(1_A) tensor ket(1_B) \
	&= ket(11) $

	#colbreak()

	$ &XX_B ket(11) \
	&= XX_B ket(1_A) tensor ket(1_B) \
	&= ket(1_A) tensor ket(0_B) \
	&= ket(10) $
]

In matrix notation:

#columns(3)[
	$ XX_B ket(01) &= mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0) vec(0, 1, 0, 0) \
	&= vec(1, 0, 0, 0) = ket(00) $
	
	#colbreak()

	$ XX_B ket(10) &= mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0) vec(0, 0, 1, 0) \
	&= vec(0, 0, 0, 1) = ket(11) $

	#colbreak()

	$ XX_B ket(11) &= mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0) vec(0, 0, 0, 1) \
	&= vec(0, 0, 1, 0) = ket(10) $
]

#answer[We get $XX_B ket(01) = ket(00), XX_B ket(10) = ket(11), XX_B ket(11) = ket(10)$.]


#question[Show that the regular matrix product of $XX tensor II$ and $II tensor XX$ equals to the matrix given by a tensor product $XX tensor XX = mat(0 admat(1, 1), 1 admat(1, 1); 1 admat(1, 1), 0 admat(1, 1)) = admat(1, 1, 1, 1)$]

We have:
#columns(2)[
	$ XX tensor II = XX_A = mat(0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0) $

	#colbreak()

	$ II tensor XX = XX_B = mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0) $
]

So we get:
$ (XX tensor II) (II tensor XX) &= mat(0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0) mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0) \
&= mat(0, 0, 0, 1; 0, 0, 1, 0; 0, 1, 0, 0; 1, 0, 0, 0) \
&= XX tensor XX $

#answer[See above.]


#question[Apply operator $XX_A XX_B$ to all four computational basis states. Show that it exchanges the states $ket(01)$ and $ket(10)$.]

We have:
#columns(4)[
	$ &XX_A XX_B ket(00) \ 
	&= XX_A ket(0_A) tensor XX_B ket(0_B) \
	&= ket(1_A) tensor ket(1_B) \
	&= ket(11) $

	#colbreak()

	$ &XX_A XX_B ket(01) \ 
	&= XX_A ket(0_A) tensor XX_B ket(1_B) \
	&= ket(1_A) tensor ket(0_B) \
	&= ket(10) $

	#colbreak()

	$ &XX_A XX_B ket(10) \ 
	&= XX_A ket(1_A) tensor XX_B ket(0_B) \
	&= ket(0_A) tensor ket(1_B) \
	&= ket(01) $

	#colbreak()

	$ &XX_A XX_B ket(11) \ 
	&= XX_A ket(1_A) tensor XX_B ket(1_B) \
	&= ket(0_A) tensor ket(0_B) \
	&= ket(00) $
]

#answer[We get $XX_A XX_B ket(00) = ket(11), XX_A XX_B ket(01) = ket(10), XX_A XX_B ket(10) = ket(01), XX_A XX_B ket(11) = ket(00)$. Specifically, it does exchange states $ket(01)$ and $ket(10)$.]


#question[Find the column vectors corresponding to $ket(++), ket(+-), ket(-+), ket(--)$.]

The vector for $ket(++)$ is already given. for the others:
#columns(2)[
	$ ket(+-) &= 1/sqrt(2) (ket(0_A) + ket(1_A)) tensor 1/sqrt(2) (ket(0_B) - ket(1_b)) \
	&= 1/2 (ket(00) - ket(01) + ket(10) - ket(11)) \
	&= 1/2 vec(1, -1, 1, -1) $

	#colbreak()

	$ ket(-+) &= 1/sqrt(2) (ket(0_A) - ket(1_A)) tensor 1/sqrt(2) (ket(0_B) + ket(1_b)) \
	&= 1/2 (ket(00) + ket(01) - ket(10) - ket(11)) \
	&= 1/2 vec(1, 1, -1, -1) $
]

$ ket(--) &= 1/sqrt(2) (ket(0_A) - ket(1_A)) tensor 1/sqrt(2) (ket(0_B) - ket(1_b)) \
&= 1/2 (ket(00) - ket(01) - ket(10) + ket(11)) \
&= 1/2 vec(1, -1, -1, 1) $

#answer[We get $ket(+-) = 1/2 vecrow(1, -1, 1, -1)^T, ket(-+) = 1/2 vecrow(1, 1, -1, -1)^T, ket(--) = 1/2 vecrow(1, -1, -1, 1)$.]


#question[Show by an explicit calculation that the four column vectors above are indeed the eigenvectors of the matrix $XX tensor XX$.]

We have:
#columns(2)[
	$ &XX tensor XX ket(++) \
	&= 1/2 admat(1, 1, 1, 1) vec(1, 1, 1, 1) \ 
	&= 1/2 vec(1, 1, 1, 1) = ket(++) $

	$ &XX tensor XX ket(+-) \
	&= 1/2 admat(1, 1, 1, 1) vec(1, -1, 1, -1) \ 
	&= 1/2 vec(-1, 1, -1, 1) = -ket(+-) $

	#colbreak()

	$ &XX tensor XX ket(-+) \
	&= 1/2 admat(1, 1, 1, 1) vec(1, 1, -1, -1) \ 
	&= 1/2 vec(-1, -1, 1, 1) = -ket(-+) $

	$ &XX tensor XX ket(--) \
	&= 1/2 admat(1, 1, 1, 1) vec(1, -1, -1, 1) \ 
	&= 1/2 vec(1, -1, -1, 1) = ket(--) $
]


#answer[We find $XX tensor XX ket(++)= +ket(++), XX tensor XX ket(+-)= -ket(+-), XX tensor XX ket(-+)= -ket(-+), XX tensor XX ket(--)= +ket(--)$, so these are indeed eigenvectors of $XX tensor XX$.]


#question[Find the matrix for the operator $ZZ_A + ZZ_B$. Check that the computational states are the eigenstates. Find the corresponding eigenvalues.]

We have:
$ ZZ_A + ZZ_B &= ZZ tensor II + II tensor ZZ \ 
&= dmat(1, -1) tensor imat(2) + imat(2) dmat(1, -1) \
&= dmat(1, 1, -1, -1) + dmat(1, -1, 1, -1) \
&= dmat(2, 0, 0, -2) $

We check that the computational states are eigenstates:
#columns(4)[
	$ ZZ_A + ZZ_B ket(00) = 2 ket(00) $

	#colbreak()

	$ ZZ_A + ZZ_B ket(01) = 0 ket(01) $

	#colbreak()
	
	$ ZZ_A + ZZ_B ket(10) = 0 ket(10) $

	#colbreak()
	
	$ ZZ_A + ZZ_B ket(11) = -2 ket(11) $
]

#answer[We get $ZZ_A + ZZ_B = dmat(2, 0, 0, -2)$, with the computational states as eigenstates and $2, 0, 0, -2$ as their respective eigenvalues.]


#question[Verify that for any two single-qubit states satisfying $braket(Psi_(A,B)) = 1$, a two-qubit state $ket(Psi) = ket(Psi_A) tensor ket(Psi_B)$ would also satisfy braket(Psi) = 1.]

We have:
$ braket(Psi) &= (bra(Psi_A) tensor bra(Psi_B))(ket(Psi_A) tensor ket(Psi_B)) \
&= (braket(Psi_A)) (braket(Psi_B)) \
&= 1 dot 1 \
&= 1 $

#answer[See above.]


#question[Show that $(ZZ_A XX_B)(ket(Psi_A) tensor ket(Psi_B)) = (ZZ ket(Psi_A)) tensor (XX ket(Psi_B))$. Use matrix notation.]

We have:
$ (ZZ_A XX_B) (ket(Psi_A) tensor ket(Psi_B)) &= (dmat(1, 1, -1, -1) mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0)) vec(alpha_0 beta_0, alpha_0 beta_1, alpha_1 beta_0, alpha_1 beta_1) \
&= mat(0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 0, -1; 0, 0, -1, 0) vec(alpha_0 beta_0, alpha_0 beta_1, alpha_1 beta_0, alpha_1 beta_1) \
&= vec(alpha_0 beta_1, alpha_0 beta_0, -alpha_1 beta_1, -alpha_1 beta_0) $

And: 
$ (ZZ ket(Psi_A)) tensor (XX ket(Psi_B)) &= dmat(1, -1) vec(alpha_0, alpha_1) tensor admat(1, 1) vec(beta_0, beta_1) \
&= vec(alpha_0, -alpha_1) tensor vec(beta_1, beta_0) \
&= vec(alpha_0 beta_1, alpha_0 beta_0, -alpha_1 beta_1, -alpha_1 beta_0) $

#answer[See above.]


#question[Consider an $N$-qubit product state, defined as a tenssor product of $N$ single-qubit states, $ket(Psi) = ket(Psi_A) tensor ket(Psi_B) tensor ket(Psi_C) tensor dots$ What is the length of the resulting column vector? How many real numbers do we need to describe such an $N$-qubit state?]

A qubit has two elements, so the length of the vector double with each tensor product. For an $N$ states product, we get a vector of length $2^N$. 

Each of the $N$ single-qubits needs $2$ real numbers (accounting for the normalization and the global phase), so we need $2 N$ real numbers.

#answer[The vector is $2^N$ elements long and can be represented using $2 N$ real numbers.]


#question[Consider a general $N$-qubit state of the form 
$ ket(Psi) = psi_(00 dots 0) ket(00 dots 0) + psi_(00 dots 1) ket(00 dots 1) + dots $
The length of the $N$-qubit column vecotr is the same as the product state. But how many real numbers do we need to describe this state?]

Each of the column vectros have $2^N$ elements. Elements are complex numebrs, so we need $2$ real numbers to represent them. In total, this is $2 dot 2^N = 2^(N+1)$ real numbers.

We remove from that the global phase an normalization parameters, so we get $2^(N+1) - 2$ real numbers.

#answer[We would need $2^(N+1) - 2$ real numbers.]


#question[Consider a register fo $N = 256$ qubits. How many real numbers would we need to store a product state? A general quantum state? If we use one atom to store one real number, do we have enough in the Universe?]

We set $N = 256$. For a product state, we get:
$ 2 N = 2 dot 256 = 512 "real numbers" $

And for a general quantum state, we get:
$ 2^(N+1) - 2 = 2^257 - 2 approx 2.3 dot 10^77 "real numbers" $

Both are lower than $10^80$, so it would be possible to store such states in the Universe.

#answer[Respectively, we would need $512$ and $2.3 dot 10^77$ real numbers to represent each state. We can you the $1$-atom storage solution for both.]


#question[Prove that these states cannot be written as product states:
$ ket(Psi_(E 1)) = 1/sqrt(2) ket(00) + 1/sqrt(2) ket(11) $
$ ket(Psi_(E 2)) = 1/sqrt(2) ket(01) + 1/sqrt(2) ket(10) $]

Let $ket(Psi_A) = vecrow(alpha_0, alpha_1)^T$ and $ket(Psi_B) = vecrow(beta_0, beta_1)^t$ arbitrary single-qubit states.

Assuming $ket(Psi_(E 1))$ can be written as a product state, we get:
$ ket(Psi_(E_1)) &= ket(Psi_A) tensor ket(Psi_B) \
1/sqrt(2) ket(00) + 1/sqrt(2) ket(11) &= vec(alpha_0, alpha_1) tensor vec(beta_0, beta_1) \
1/sqrt(2) vec(1, 0, 0, 1) &= vec(alpha_0 beta_0, alpha_0 beta_1, alpha_1 beta_0, alpha_1 beta_1) $

This has no solution, so $ket(Psi_(E_1))$ cannot be written as a product state. The proof for $ket(Psi_(E_2))$ is similar.

#answer[See above.]


= Quantum measurement of composite systems

#question[Consider $ket(Psi) = 1/2 ket(00) + 1/2 ket(01) + 1/2 ket(10) + 1/2 ket(11)$. What is the probability to measure measure $M = -2$?]

The state corresponding to eigenvalue $-2$ is $ket(11)$. We have:
$ "probability" &= abs(braket(11, Psi))^2 \
&= abs(psi_(11))^2 \
&= 1/4 $

#answer[The probability is $1/4$.]


#question[What is the probability to measure neither $M = 2$ not $M = -2$.]

This would mean measuring $M = 0$, which corresponds to eigenstates $ket(01)$ and $ket(10)$. We have:
$ "probability" &= abs(braket(Psi_0, Psi))^2 \
&= abs(1/(sqrt(abs(psi_(01))^2 + abs(psi_(10))^2)) (psi_(01) ket(01) + psi_(10) ket(10)))^2 \
&= abs(psi_(01))^2 + abs(psi_(10))^2 \
&= 1/4 + 1/4 \
&= 1/2 $

#answer[The probability is $1/2$.]


#question[What is the probability to measure $M = 0$?]

Exact same calculations as above.

#answer[The probability is $1/2$.]


#question[How many times do we have to try the measurement on a product state $ket(+_A) tensor ket(+_B)$, on average, in order to obtain an entagled state?]

Using the Bernouilli experiment formula with probability $1/2$ of getting $M = 0$ :
$ "number of tries" = 1/(1/2) = 2 $

#answer[$2$ times on average.]


#question[Start with a general state $ket(Psi)$ and measure sequentially $ZZ_A$ and then $ZZ_B$. Consider the four possible measurement outcomess for $(ZZ_A, ZZ_B) in {(1, 1), (1, -1), (-1, 1), (-1, -1)}$. Describe the states after the first and the second measurement in each of the four cases and calculate the probabilities of each outcome following the described above measurement rule.]

We measure $ZZ_A$ first. By cases on the result:
	- $Z_A = +1$: probability $abs(psi_(00))^2 + abs(psi_(01))^2$\ The state collapses onto $ket(0_A) tensor (psi_00 ket(0_B) + psi_01 ket(1_B))/sqrt(abs(psi_(00))^2 + abs(psi_(01))^2)$\ We get: $ket(Psi_A) = ket(0_A)$ and $ket(Psi_B)$ unknown.

		- $Z_B$ = +1: probability $abs(psi_(00))^2 / (abs(psi_(00))^2 + abs(psi_(01))^2)$.\ $ket(Psi_B)$ collapses onto state $ket(0_B)$\ We get: final state $ket(00)$ with probability $abs(psi_00)^2$.

		- $Z_B$ = -1: probability $abs(psi_(01))^2 / (abs(psi_(00))^2 + abs(psi_(01))^2)$.\ $ket(Psi_B)$ collapses onto state $ket(1_B)$\ We get: final state $ket(01)$ with probability $abs(psi_01)^2$.

	- $Z_A = -1$: probability $abs(psi_(10))^2 + abs(psi_(11))^2$.\ The state collapses onto $ket(1_A) tensor (psi_10 ket(0_B) + psi_11 ket(1_B))/sqrt(abs(psi_(10))^2 + abs(psi_(11))^2)$\ We get: $ket(Psi_A) = ket(1_A)$ and $ket(Psi_B)$ unknown.

		- $Z_B$ = +1: probability $abs(psi_(10))^2 / (abs(psi_(10))^2 + abs(psi_(11))^2)$.\ $ket(Psi_B)$ collapses onto state $ket(0_B)$\ We get: final state $ket(10)$ with probability $abs(psi_10)^2$.

		- $Z_B$ = -1: probability $abs(psi_(11))^2 / (abs(psi_(10))^2 + abs(psi_(11))^2)$.\ $ket(Psi_B)$ collapses onto state $ket(1_B)$\ We get: final state $ket(11)$ with probability $abs(psi_11)^2$.

#answer[The probabilities are respectively $abs(psi_(i j))^2$.]


#question[Repeat the previous exercise in reverse order, first measure $Z_B$ and then $Z_A$. Do you expect anny change in the probability of the four possible outcomes?]

The computations are similar to the previous exercise. We get the same results.

#answer[I did not expect any change. Indeed there weren't.]


#question[Let us consider a measurement operator $MM = ZZ_A ZZ_B$. Suppose we start in a state $ket(Psi) = ket(+_A) tensor ket(+_B)$. Describe all possible measurement outcomes.]

We have:
$ ket(Psi) &= 1/sqrt(2) (ket(0_A) + ket(1_A)) tensor 1/sqrt(2) (ket(0_B) + ket(1_b)) \
&= 1/2 (ket(00) + ket(01) + ket(10) + ket(11)) $

Then:
#columns(2)[
	$ ket(Psi_(+1)) &= (1/2 (ket(00) + ket(11)))/sqrt((1/2)^2 + (1/2)^2) \ 
	&= (ket(00) + ket(11))/sqrt(2) $
	$ "probability" &= abs(psi_00)^2 + abs(psi_11)^2 \
	&= 1/2 $

	#colbreak()

	$ ket(Psi_(-1)) &= (1/2 (ket(01) + ket(10)))/sqrt((1/2)^2 + (1/2)^2) \ 
	&= (ket(01) + ket(10))/sqrt(2) $
	$ "probability" &= abs(psi_01)^2 + abs(psi_10)^2 \
	&= 1/2 $
]

#answer[The possible measurement outcomes are $plus.minus 1$ with states $(ket(00) + ket(11))/sqrt(2), (ket(01) + ket(10))/sqrt(2)$, and with probability $1/2$ for both.]


= Spooky properties of entagled states

#question[Consider a general product state $ket(Psi_p) = ket(Psi_A) tensor ket(Psi_B)$. We can choose $ket(Psi_A) = alpha_0 ket(0_A) + alpha_1 ket(1_a)$. Prove that $abs(braket(Psi_p, XX_A, Psi_p))^2 + abs(braket(Psi_p, YY_A, Psi_p))^2 + abs(braket(Psi_p, ZZ_A, Psi_p))^2 = 1$]

We have:
$ &abs(braket(Psi_p, XX_A, Psi_p))^2 + abs(braket(Psi_p, YY_A, Psi_p))^2 + abs(braket(Psi_p, ZZ_A, Psi_p))^2 \
&= abs(braket(Psi_A, XX_A, Psi_A) braket(Psi_B, I, Psi_B))^2 + abs(braket(Psi_A, YY_A, Psi_A) braket(Psi_B, I, Psi_B))^2 + abs(braket(Psi_A, ZZ_A, Psi_A) braket(Psi_B, I, Psi_B))^2 \
&= abs(braket(Psi_A, XX_A, Psi_A) braket(Psi_B))^2 + abs(braket(Psi_A, YY_A, Psi_A) braket(Psi_B))^2 + abs(braket(Psi_A, ZZ_A, Psi_A) braket(Psi_B))^2 \
&= abs(braket(Psi_A, XX_A, Psi_A))^2 + abs(braket(Psi_A, YY_A, Psi_A))^2 + abs(braket(Psi_A, ZZ_A, Psi_A))^2 \
&= sin^2(theta) cos^2(phi.alt) + sin^2(theta)sin^2(phi.alt) + cos^2(theta) \
&= 1 $

#answer[See above.]


#question[Prove that the maximal value of $braket(Psi_p, XX_A XX_B, Psi_p) + braket(Psi_p, YY_A YY_B, Psi_p) + braket(Psi_p, ZZ_A ZZ_B, Psi_p)$ is $1$ and the minimal value is $-1$.]

We transform the equation into a dot product:
$ &braket(Psi_p, XX_A XX_B, Psi_p) + braket(Psi_p, YY_A YY_B, Psi_p) + braket(Psi_p, ZZ_A ZZ_B, Psi_p) \
&= braket(Psi_A, XX_A, Psi_A) braket(Psi_B, XX_B, Psi_B) + braket(Psi_A, YY_A, Psi_A) braket(Psi_B, YY_B, Psi_B) + braket(Psi_A, ZZ_A, Psi_A) braket(Psi_B, ZZ_B, Psi_B) \
&= vec(braket(Psi_A, XX_A, Psi_A), braket(Psi_A, YY_A, Psi_A), braket(Psi_A, ZZ_A, Psi_A))^T vec(braket(Psi_B, XX_B, Psi_B), braket(Psi_B, YY_B, Psi_B), braket(Psi_B, ZZ_B, Psi_B)) $

Then we use Cauchy-Schwartz:
$ &abs(vec(braket(Psi_A, XX_A, Psi_A), braket(Psi_A, YY_A, Psi_A), braket(Psi_A, ZZ_A, Psi_A))^T vec(braket(Psi_B, XX_B, Psi_B), braket(Psi_B, YY_B, Psi_B), braket(Psi_B, ZZ_B, Psi_B))) &&<= norm(vec(braket(Psi_A, XX_A, Psi_A), braket(Psi_A, YY_A, Psi_A), braket(Psi_A, ZZ_A, Psi_A))) norm(vec(braket(Psi_B, XX_B, Psi_B), braket(Psi_B, YY_B, Psi_B), braket(Psi_B, ZZ_B, Psi_B))) \
&&&<= 1 "since they are unit vectors" $

So we get:
$ -1 <= vec(braket(Psi_A, XX_A, Psi_A), braket(Psi_A, YY_A, Psi_A), braket(Psi_A, ZZ_A, Psi_A))^T vec(braket(Psi_B, XX_B, Psi_B), braket(Psi_B, YY_B, Psi_B), braket(Psi_B, ZZ_B, Psi_B)) <= 1 $

#answer[See above.]


#question[Show that the four Bell states are indeed orthogonal to each other and each has length $1$.]

We have:
#columns(2)[
	$ braket(B_0) = 1/2 vecrow(0, 1, -1, 0) vec(0, 1, -1, 0) = 1 $
	$ braket(B_1) = 1/2 vecrow(0, 1, 1, 0) vec(0, 1, 1, 0) = 1 $

	#colbreak()

	$ braket(B_2) = 1/2 vecrow(1, 0, 0, -1) vec(1, 0, 0, -1) = 1 $
	$ braket(B_3) = 1/2 vecrow(1, 0, 0, 1) vec(1, 0, 0, 1) = 1 $
]

And:
#columns(2)[
	$ braket(B_0, B_1) = 1/2 vecrow(0, 1, -1, 0) vec(0, 1, 1, 0) = 0 $
	$ braket(B_0, B_2) = 1/2 vecrow(0, 1, -1, 0) vec(1, 0, 0, -1) = 0 $
	$ dots "etc" $

	#colbreak()
	$ braket(B_1, B_3) = 1/2 vecrow(0, 1, 1, 0) vec(1, 0, 0, 1) = 0 $
	$ braket(B_2, B_3) = 1/2 vecrow(1, 0, 0, -1) vec(1, 0, 0, 1) = 0 $
	$ dots "etc" $
]

#answer[We get that $braket(Psi_i, Psi_j) = cases(0 "if" i != j, 1 "if" i = j)$, so the Bell states are orthonormal.]


#question[Suppose we used a measurement of $ZZ_A + ZZ_B$ to create an entangled state $ket(B_1)$. Verify that: 
$ &ket(B_0) = ZZ_A ket(B_1) \
&ket(B_2) = XX_A ZZ_A ket(B_1) \
&ket(B_3) = XX_A ket(B_1) $]

We have::
#columns(2)[
	$ ZZ_a ket(B_1) &= 1/sqrt(2) (ZZ_A ket(01) + ZZ_A ket(10)) \
	&= 1/sqrt(2) (ket(01) - ket(10))\
	&= ket(B_0) $

	$ XX_A ket(B_1) &= 1/sqrt(2) (XX_A ket(01) + XX_A ket(10)) \
	&= 1/sqrt(2) (ket(11) + ket(00)) \
	&= ket(B_3) $

	#colbreak()

	$ XX_A ZZ_A ket(B_1) &= 1/sqrt(2) (XX_A ZZ_A ket(01) + XX_A ZZ_A ket(10)) \
	&= 1/sqrt(2) (XX_A ket(01) - XX_A ket(10)) \
	&= 1/sqrt(2) (ket(11) - ket(00)) \
	&= -1/sqrt(2)(ket(00) - ket(11)) \
	&= - ket(B_2) "undistinguishable from" ket(B_2) $
]

#answer[See above.]


#question[Work out a unitary transformation $UU$ which changes the basis from states $ket(00), ket(01), ket(10), ket(11)$ to states $ket(B_0), ket(B_1), ket(B_2), ket(B_3)$. Write down the matrix for $UU$ in the computational basis.] 

We want to find $UU$ such that:
$ UU mat(ket(00), ket(01), ket(10), ket(11)) &= mat(ket(B_0), ket(B_1), ket(B_2), ket(B_3))\
UU imat(4) &= 1/sqrt(2) mat(0, 0, 1, 1; 1, 1, 0, 0; -1, 1, 0, 0; 0, 0, -1, 1) \
UU &= 1/sqrt(2) mat(0, 0, 1, 1; 1, 1, 0, 0; -1, 1, 0, 0; 0, 0, -1, 1) $

#answer[We find $UU = 1/sqrt(2) mat(0, 0, 1, 1; 1, 1, 0, 0; -1, 1, 0, 0; 0, 0, -1, 1)$.]


#question[Prove that $braket(B_0, XX_A, B_0) = braket(B_0, YY_A, B_0) = braket(B_0, ZZ_A, B_0) = 0$. Can you imagine a random 3D vector with such a property?]

We have:
#columns(2)[
	$ &braket(B_0, XX_A, B_0) \ 
	&= 1/2 (bra(01) - bra(10)) XX_A (ket(01) - ket(10)) \
	&= 1/2 (bra(01) - bra(10))(ket(11) - ket(00)) \
	&= 1/2 (braket(01, 11) - braket(01, 00) - braket(10, 11) + braket(10, 00)) \
	&= 0 $

	#colbreak()

	$ &braket(B_0, YY_A, B_0) \
	&= 1/2 (bra(01) - bra(10)) YY_A (ket(01) - ket(10)) \
	&= 1/2 (bra(01) - bra(10)) (i ket(11) + i ket(00)) \
	&= i/2 (braket(01, 11) - braket(01, 00) - braket(10, 11) - braket(10, 00)) \
	&= 0 $
]

$ braket(B_0, ZZ_A, B_0) &= 1/2 (bra(01) - bra(10)) ZZ_A (ket(01) - ket(10)) \
&= 1/2 (bra(01) - bra(10))(ket(01) + ket(10)) \
&= 1/2 (braket(01) - braket(01, 10) - braket(10, 01) - braket(10)) \
&= 0 $

#answer[See above. The only 3D vector that has this property is $arrow(0)$.]


#question[Prove the above but for the operators of qubit B.]
#columns(2)[
	$ &braket(B_0, XX_B, B_0) \ 
	&= 1/2 (bra(01) - bra(10)) XX_B (ket(01) - ket(10)) \
	&= 1/2 (bra(01) - bra(10))(ket(00) - ket(11)) \
	&= 1/2 (braket(01, 00) - braket(01, 11) - braket(10, 00) + braket(10, 11)) \
	&= 0 $

	#colbreak()

	$ &braket(B_0, YY_B, B_0) \
	&= 1/2 (bra(01) - bra(10)) YY_B (ket(01) - ket(10)) \
	&= 1/2 (bra(01) - bra(10)) (-i ket(00) - i ket(11)) \
	&= i/2 (-braket(01, 00) - braket(01, 11) + braket(10, 00) + braket(10, 11)) \
	&= 0 $
]

$ braket(B_0, ZZ_B, B_0) &= 1/2 (bra(01) - bra(10)) ZZ_B (ket(01) - ket(10)) \
&= 1/2 (bra(01) - bra(10))(-ket(01) - ket(10)) \
&= 1/2 (-braket(01) - braket(01, 10) + braket(10, 01) + braket(10)) \
&= 0 $

#answer[See above.]


#question[Prove that $braket(B_0, XX_A XX_B, B_0) = braket(B_0, YY_A YY_B, B_0) = braket(B_0, ZZ_a ZZ_B, B_0) = -1$.]

We have:
#columns(2)[
	$ &braket(B_0, XX_A XX_B, B_0) \
	&= 1/2 (bra(01) - bra(10)) XX_A XX_B (ket(01) - ket(10)) \ 
	&= 1/2 (bra(01) - bra(10)) (ket(10) - ket(01)) \
	&= 1/2 (braket(01, 10) - braket(01) - braket(10) + braket(10, 01)) \
	&= 1/2 (-1 - 1) = -1 $

	#colbreak()

	$ &braket(B_0, YY_A YY_b, B_0) \
	&= 1/2 (bra(01) - bra(10)) YY_A YY_B (ket(01) - ket(10)) \
	&= 1/2 (bra(01) - bra(10)) (ket(10) - ket(01)) \
	&= 1/2 (braket(01, 10) - braket(01) - braket(10) + braket(10, 01) \
	&= 1/2 (-1 - 1) = -1 $
]

$ braket(B_0, ZZ_A ZZ_B, B_0) &= 1/2 (bra(01) - bra(10)) ZZ_A ZZ_B (ket(01) - ket(10)) \
&= 1/2 (bra(01) - bra(10)) (-ket(01) + ket(10)) \
&= 1/2 (-braket(01) + braket(01, 10) + braket(10, 01) - braket(10)) \
&= 1/2 (-1 - 1) = -1 $

#answer[See above.]


#question[Create the Paule plot for two states, $ket(+-)$ and $ket(B_3)$.]

#answer[We have, with $ket(+-)$ in blue and $ket(B_3)$ orange:
#figure(image("res/hw3_question30.png", width: 100%))]


#question[Show that person A measuring $ZZ_A$ would find $Z_A$ = +1 with a probability $1/2$ and $Z_Z = -1$ with a probability $1/2$. However, every time person A measures $Z_A = +1$, person B afterwards measures $ZZ_B = +1$ as well.]












