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
#let question = a => figure(kind: "aparte", supplement: "Exercise ")[#a]
#let answer = a => figure(kind: "aparte2", supplement: "Answer ")[#a]
#let xx = $hat(x)$
#let aa = $hat(a)$
#let pp = $hat(p)$
#let HH = $hat(H)$
#let DD = $hat(D)$

#align(
	center, 
	text(1.5em)[
		*Homework 2* 
	]
)


= Introduction: classical vs. quantum oscillator models

#question[Calculate the mean values of $braket(Psi, hat(x), Psi)$ and $braket(Psi, hat(p), Psi)$ operators for an oscillator in states $ket(Psi) = ket(0)$ and $ket(Psi) = ket(n)$.]

We have:
#columns(2)[
	$ xx = x_0 (aa + aa^+) $
	$ braket(Psi, xx, Psi) &= braket(Psi, x_0 (aa + aa^+), Psi) \
	&= x_0 braket(Psi, aa + aa^+, Psi) \
	&= x_0 braket(Psi, aa, Psi) + x_0 braket(Psi, aa^+, Psi) $

	#colbreak()

	$ pp = -i p_0 (aa - aa^+) $
	$ braket(Psi, pp, Psi) &= braket(Psi, -i p_0 (aa - aa^+), Psi) \
	&= -i p_0 braket(Psi, aa - aa^+, Psi) \
	&= -i p_0 braket(Psi, aa, Psi) + i p_0 braket(Psi, aa^+, Psi) $
]

So we get, for $ket(Psi) = ket(0)$:
#columns(2)[
	$ &braket(0, xx, 0) \
	&= x_0 braket(0, aa, 0) + x_0 braket(0, aa^+, 0) \
	&= x_0 braket(0, aa^+, 0), " since" aa "annihilates" ket(0) \
	&= x_0 bra(0)(aa^+ ket(0)) \
	&= x_0 braket(0, 1) \
	&= 0 $

	#colbreak()

	$	&braket(0, pp, 0) \
	&= -i p_0 braket(0, aa, 0) + i p_0 braket(0, aa^+, 0) \
	&= i p_0 braket(0, aa^+, 0) \
	&= ...  "same as before" \
	&= 0 $
]

And for $ket(Psi) = ket(n)$:
#columns(2)[
	$ &braket(n, xx, n) \
	&x_0 braket(n, aa, n) + x_0 braket(n, aa^+, n) \
	&= x_0 bra(n)(aa ket(n)) +  x_0 bra(n)(aa^+ ket(n)) \
	&= x_0 bra(n)(sqrt(n) ket(n-1)) + x_0 bra(n) (sqrt(n+1) ket(n+1)) \
	&= x_0 sqrt(n) braket(n, n-1) + x_0 sqrt(n+1) braket(n, n+1) \
	&= 0, " since Fock states are orthogonal" $

	#colbreak()
	$ &braket(n, pp, n) \
	&-i p_0 braket(n, aa, n) + i p_0 braket(n, aa^+, n) \
	&= ...  "same as before" \
	&= 0 $
]

#answer[Respectively: $0, 0, 0 " and" 0$]


#question[Calculate $x_(R M S) = sqrt(braket(Psi, xx^2, Psi))$ and $p_(R M S) = sqrt(braket(Psi, pp^2, Psi))$ for an oscillator in states $ket(Psi) = ket(0)$ and $ket(Psi) = ket(n)$.]

We have:
#columns(2)[
	$ x_(R M S) &= sqrt(braket(Psi, xx^2, Psi)) \
	&= x_0 sqrt(braket(Psi, (aa + aa^+)^2, Psi)) \
	&= x_0 sqrt(braket(Psi, aa^2 + aa aa^+ + aa^+ aa + (aa^+)^2, Psi)) $

	#colbreak()

	$ p_(R M S) &= sqrt(braket(Psi, pp^2, Psi)) \
	&= p_0 sqrt(braket(Psi, (aa - aa^+)^2, Psi)) \
	&= p_0 sqrt(braket(Psi, aa^2 - aa aa^+ - aa^+ aa + (aa^+)^2, Psi)) $
]

And:
#columns(2)[
	$ x_(R M S) &= sqrt(braket(0, xx^2, 0)) \
	&= x_0 sqrt(braket(0, aa^2 + aa aa^+ + aa^+ aa + (aa^+)^2, 0)) \
	&= x_0 sqrt(braket(0)) \
	&= x_0 sqrt(1) \
	&= x_0 $

	#colbreak()

	$ p_(R M S) &= sqrt(braket(0, pp^2, 0)) \
	&= p_0 sqrt(braket(0, aa^2 - aa aa^+ - aa^+ aa + (aa^+)^2, 0)) \
	&= p_0 sqrt(braket(0)) \
	&= p_0 $
]
#columns(2)[
	$ x_(R M S) &= sqrt(braket(n, xx^2, n)) \
	&= x_0 sqrt(braket(n, aa^2 + aa aa^+ + aa^+ aa + (aa^+)^2, n)) \
	&= x_0 sqrt(n braket(n - 1) + braket(n - 1, n + 1) \
			 			+ braket(n + 1, n - 1) + (n + 1) braket(n + 1) ) \
	&= x_0 sqrt(2 n + 1) $

	#colbreak()

	$ p_(R M S) &= sqrt(braket(n, pp^2, n)) \
	&= p_0 sqrt(braket(n, aa^2 - aa aa^+ - aa^+ aa + (aa^+)^2, n)) \
	&= p_0 sqrt(braket(n, n - 2) + braket(n - 1, n + 1) \
			 			+ braket(n + 1, n - 1) + braket(n, n + 2) ) \
	&= p_0 sqrt(2 n + 1) $
]

#answer[Respectively, $x_0, p_0, x_0 sqrt(2 n + 1)$ and $p_0 sqrt(2 n +1)$.]


#question[Use the results of the previous exercise and demonstrate that $x_(R M S) p_(R M S) >= hbar/2$.]

We have:
$ x_(R M S) p_(R M S) &= x_0 sqrt(2 n + 1) p_0 sqrt(2 n + 1) \
&= x_0 p_0 (2 n + 1) \
&= sqrt(hbar/(2 m omega)) sqrt((hbar m omega)/2) (2 n + 1) \
&= hbar/2 (2 n + 1) \
&>= hbar/2 "since" 2 n + 1 "is positive" $

#answer[Proof, see above.]


#question[Claculate and compare mean kinetic $braket(0, pp^2/(2 m), 0)$ and mean potential $braket(0, (m omega^2 xx^2)/2)$ energies of the oscillator in its ground state $ket(0)$.]

We have:
#columns(2)[
	$ &braket(0, pp^2/(2 m), 0) \
	&= 1/(2 m) braket(0, pp^2, 0) \
	&= p_0^2/(2 m) \
	&= (hbar m omega)/(4 m) \
	&= (omega hbar)/4 $

	#colbreak()

	$ &braket(0, m omega^2 xx^2/2, 0) \
	&= (m omega^2)/2 braket(0, xx^2, 0) \
	&= (m omega^2)/2 x_0^2 \
	&= (m omega^2)/2 hbar/(2 m omega) \
	&= (hbar omega)/4 $
]

Comparing, we have that kinetic energy equals potential energy when the oscillator is in its ground state.

#answer[$braket(0, pp^2/(2 m), 0) = braket(0, (m omega^2 xx^2)/2, 0) = (hbar omega)/4$]


#question[Show by a direct calculation that $ pdv(, t) chevron aa chevron.r = -i omega chevron aa chevron.r \ pdv(, t) chevron aa^+ chevron.r = +i omega chevron aa^+ chevron.r $]

First, we caclulate $braket(Psi(t), aa, Psi(t))$. We have that:
$ ket(Psi(t)) = sum_(n = 0)^infinity psi_n exp(-i n omega t) ket(n) \
bra(Psi(t)) = sum_(k = 0)^infinity psi_k^* exp(+i k omega t) bra(k) $

So we get:
$ braket(Psi(t), aa, Psi(t)) &= (sum_(k = 0)^infinity psi_k^* exp(+i k omega t) bra(k)) aa (sum_(n = 0)^infinity psi_n exp(-i n omega t) ket(n)) \
&= (sum_(k = 0) psi_k^* exp(+i k omega t) bra(k)) (sum_(n = 0) psi_n exp(-i n omega t) aa ket(n)) \
&= sum_(k = 0) sum_(n = 0) psi_k^* psi_n exp(+i k omega t) exp(-i n omega t) braket(k, aa, n) \
&= sum_(k = 0) sum_(n = 0) psi_k^* psi_n exp(+i k omega t) exp(-i n omega t) braket(k, sqrt(n), n - 1) \
&= sum_(k = 0) sum_(n = 0) sqrt(n) psi_k^* psi_n exp(+i k omega t) exp(-i n omega t) braket(k, n - 1) $

Since $braket(k, n - 1) = 0$ if $k != n - 1$, we get a single sum over $n$ (and we skip the $n = 0$ step since it would make $sqrt(n) = 0$):
$ &= sum_(n = 1) sqrt(n) psi_(n - 1)^* psi_n exp(+i (n - 1) omega t) exp(-i n omega t) \
&= sum_(n = 1) sqrt(n) psi_(n - 1)^* psi_n exp(-i omega t) \
&= exp(-i omega t) sum_(n = 1) sqrt(n) psi_(n - 1)^* psi_n $

Then, we find its derivative:
$ pdv(, t) braket(Psi(t), aa, Psi(t)) &= pdv(, t) exp(-i omega t) sum_(n = 1) sqrt(n) psi_(n - 1)^* psi_n \
&= sum_(n = 1) sqrt(n) psi_(n - 1)^* psi_n pdv(, t) exp(-i omega t) \
&= -i omega sum_(n = 1) sqrt(n) psi_(n - 1)^* psi_n exp(-i omega t) \
&= -i omega braket(Psi(t), aa, Psi(t)) $

The computation is the same for $aa^+$, but taking its conjugate. We get: 
$ pdv(, t) braket(Psi(t), aa^+, Psi(t)) = + i omega braket(Psi(t), aa^+, Psi(t)) $

#answer[Proof, see above.]


#question[Apply the result of the previous exercise to two cases: $ket(Psi(t = 0)) = ket(2)$ and $ket(Psi(t = 0)) = 1/sqrt(2) ket(0) + 1/sqrt(2) ket(1)$. Plot or sketch the time-evolution of $chevron aa chevron.r$ in the 2D plane defined by axis $x/x_0$ and $i p/p_0$.]

We found:
$ pdv(, t) braket(Psi(t), aa, Psi(t))  = -i omega braket(Psi(t), aa, Psi(t)) $

So the solution is:
$ braket(Psi(t), aa, Psi(t)) = braket(Psi(0), aa, Psi(0)) exp(- i omega t) $

For $ket(Psi(t = 0)) = ket(2)$:
$ braket(2, aa, 2) &= braket(2, sqrt(2), 1) \
&= 0 \
&=> braket(Psi(t), aa, Psi(t)) = 0 $

For $ket(Psi(t = 0)) = 1/sqrt(2) ket(0) + 1/sqrt(2) ket(1)$:
$ &(1/sqrt(2) bra(0) + 1/sqrt(2) bra(1)) aa (1/sqrt(2) ket(0) + 1/sqrt(2) ket(1)) \
&= (1/sqrt(2) bra(0) + 1/sqrt(2) bra(1)) (1/sqrt(2) ket(0)) \
&= 1/2 braket(0) + 1/2 braket(1, 0) \
&= 1/2 \ 
&=> braket(Psi(t), aa, Psi(t)) = 1/2 exp(-i omega t) $

The results are obtained similarly for the $aa^+$ equation.

#answer[For $ket(Psi(t = 0)) = ket(2)$, $braket(Psi(t), aa, Psi(t)) = 0$, and the plot has $chevron aa chevron.r$ remaining at the origin. For $ket(Psi(t = 0)) = 1/sqrt(2) ket(0) + 1/sqrt(2) ket(1)$, $braket(Psi(t), aa, Psi(t)) = 1/2 exp(-i omega t)$ and the plot shows $chevron aa chevron.r$ rotating clockwise in a cirlce of radius $1/2$ centered at the origin and with angular frequency $omega$:

\#figure(image("./res/hw2_question6.jpg", width: 60%))]


#question[Plot or sketch the mean energy of the oscillator $braket(Psi(t), HH, Psi(t))$ as a function of time for $ket(Psi(t = 0)) = sqrt(1/3) ket(0) + sqrt(2/3) ket(n)$. Is energy really quantized in a quantum oscillator this time?]

We choose $n = 1$ for simpicity. The hamiltionina is given by $hbar omega aa^+ aa + 1/2 hbar omega$.

We get:
$ ket(Psi(t)) &= sqrt(1/3) exp(-i omega t dot 0) ket(0) + sqrt(2/3) exp(-i omega t dot 1) ket(1) \
&= sqrt(1/3) ket(0) + sqrt(2/3) exp(-i omega t) ket(1) $

Now, the mean energy is:
$ braket(Psi(t), HH, Psi(t)) &= (sqrt(1/3) bra(0) + sqrt(2/3) exp(+i omega t) bra(1)) HH (sqrt(1/3) ket(0) + sqrt(2/3) exp(-i omega t) ket(1)) \
&= (sqrt(1/3) bra(0) + sqrt(2/3) exp(+i omega t) bra(1)) (sqrt(1/3) 1/2 hbar omega ket(0) + sqrt(2/3) 3/2 hbar omega exp(-i omega t) ket(1)) \
&= 1/6 hbar omega + hbar omega \ 
&= 7/6 hbar omega $

#answer[I don't think I understand what the question means, but I can say that $7/6 hbar omega$ is definitely not one of the "allowed" energy measurements. However that would be expected since it's a mean, so I don't think this is what the question was getting at, sorry. Here is the plot: (shelf at $7/6$)\ \
\#figure(image("./res/hw2_question7.jpg", width: 60%))]


= Coherent states

#question[Show that a coherent state $ket(alpha)$ is an eigenstate of the lowering operator $aa$ with eigenvalue $alpha$.]

We have:
$ aa ket(alpha) &= aa exp(-abs(alpha)^2/2) sum_(n=0)^infinity alpha^n / sqrt(n!) ket(n) \
&= exp(-abs(alpha)^2/2) sum_(n=0)^infinity alpha^n / sqrt(n!) aa ket(n) \
&= exp(-abs(alpha)^2/2) sum_(n=1)^infinity alpha^n / sqrt(n!) sqrt(n) ket(n - 1) \
&= exp(-abs(alpha)^2/2) sum_(n=1)^infinity alpha^n / sqrt((n - 1)!) ket(n - 1) \
&= exp(-abs(alpha)^2/2) sum_(n=0)^infinity alpha^(n+1) / sqrt(n!) ket(n) \
&= alpha exp(-abs(alpha)^2/2) sum_(n=0)^infinity alpha^(n+1) / sqrt(n!) ket(n) \
&= alpha ket(alpha) $

#answer[Proof, see above.]


#question[Show that the raising operator $aa^+$ does not have any eigenstates.]

We assume that $aa^+$ has an eigenstate $ket(Psi)$, with eigenvalue $lambda$:
$ aa^+ ket(Psi) &= lambda ket(Psi) \
aa^+ sum_(n-0) psi_n ket(n) &= lambda sum_(n-0) psi_n ket(n) \
sum_(n=0) psi_n aa^+ ket(n) &= lambda sum_(n=0) psi_n ket(n) \
sum_(n=0) psi_n sqrt(n + 1) ket(n + 1) &= lambda sum_(n=0) psi_n ket(n) $

We can match the coefficents $psi_n$:
// this is so ugly omg
$ cases(
	0 = lambda psi_0\, " since there's no coefficient for "ket(0)" on the left",  #h(3.7em) "(starts at" ket(1)")", 
	psi_(n) sqrt(n+1) = lambda psi_(n+1) " otherwise"
) $

Now, we look at $lambda psi_0 = 0$ by cases:
#columns(2)[
	- $lambda = 0$:
		$ &=> lambda psi_(n+1) = 0 \
		&=> psi_n sqrt(n + 1) = 0 \
		&=> forall n, psi_n = 0 \
		&=> ket(Psi) = 0, " not a state" \
		&=> lambda "can't be" 0 $

	#colbreak()
	- $psi_0 = 0$:
		$ &psi_(n+1) = sqrt(n + 1)/lambda psi_n \
		&=> forall n, psi_n = 0 \
		&=> psi_0 "can't be" 0 "by the same logic" $
]

#answer[Proof, see above.]


#question[Show that the mean value of energy is a coherent state $ket(alpha)$ is given by $hbar omega abs(alpha)^2 + 1/2 hbar omega$. Equivalently, $braket(alpha, aa^+ aa, alpha) = abs(alpha)^2$.]

$ braket(alpha, aa^+ aa, alpha) &= alpha braket(alpha, aa^+, alpha) \
&= alpha alpha^* \
&= abs(alpha)^2 $

#answer[Proof, see above.]


#question[For an oscillator in a coherent state $ket(alpha)$, calculate the variance of the energy, defined by: $E_(R M S)^2 = braket(alpha, (HH - braket(alpha, HH, alpha)^2), alpha) = braket(alpha, HH^2, alpha) - braket(alpha, HH, alpha)^2$.]

We know that:
$ braket(alpha, HH, alpha) = hbar omega abs(alpha)^2 + 1/2 hbar omega $

So: 
$ braket(alpha, HH, alpha)^2 &= (hbar omega abs(alpha)^2 + 1/2 hbar omega)^2 \
&= hbar^2 omega^2 (abs(alpha)^4 + abs(alpha)^2 + 1/4) $

For $braket(alpha, HH^2, alpha)$:
$ HH^2 &= (hbar omega (aa^+ aa + 1/2))^2 \
&= hbar^2 omega^2 ((aa^+ aa)2 + aa^+ aa + 1/4) \
&= hbar^2 omega^2 (aa^+ aa^+ aa aa + aa^+ aa + 1/4) $

So:
$ braket(alpha, HH^2, alpha) &= hbar^2 omega^2 braket(alpha, aa^+ aa^+ aa aa + aa^+ aa + 1/4, alpha) \
&= hbar^2 omega^2 braket(alpha, aa^+ aa^+ aa aa, alpha) + hbar^2 omega^2 braket(alpha, aa^+ aa, alpha) + hbar^2 omega^2 1/4 braket(alpha, alpha) \
&= hbar^2 omega^2 braket(alpha, aa^+ aa^+ aa aa, alpha) + hbar^2 omega^2 abs(alpha)^2 + hbar^2 omega^2 1/4 \
&= hbar^2 omega^2 (abs(alpha)^4 + abs(alpha)^2) + hbar^2 omega^2 abs(alpha)^2 + hbar^2 omega^2 1/4 \
&= hbar^2 omega^2 (abs(alpha)^4 + 2 abs(alpha)^2 + 1/4) $

Therefore, we get:
$ braket(alpha, HH^2, alpha) - braket(alpha, HH, alpha)^2 &= hbar^2 omega^2 (abs(alpha)^4 + 2 abs(alpha)^2 + 1/4) - hbar^2 omega^2 (abs(alpha)^4 + abs(alpha)^2 + 1/4) \
&= hbar^2 omega^2 abs(alpha)^2 $

#answer[$E_(R M S)^2 = hbar^2 omega^2 abs(alpha)^2$.]


#question[Sketch the histogram for $abs(alpha)^2 = 0, 3.3, 11.7, 100$. What is the ration of the mean energy to $E_(R M S)$ for $abs(alpha)^2 = 100$?]

We have:
$ P_n = exp(-abs(alpha)^2) dot abs(alpha)^(2 n)/n! $

And the sketch for $abs(alpha)^2 = 0, 3.3, 11.7, 100$, respectively in red, green, dark blue and light blue (the one for $abs(alpha)^2 = 0$ is really not visible since it's directly on the $x$-axis): \ 

\#figure(image("./res/hw2_question12.jpg", width: 60%))

This grpah is very similar to the one in figure 3: gaussians that get "more spread out" the bigger $n$ is, and with the highest point being at $abs(alpha)^2$.

We find the ration of mean energy and $E_(R M S)$:
#columns(2)[
	$ chevron HH chevron.r &= hbar omega (abs(alpha)^2 + 1/2) \
	&= 100.5 hbar omega $

	#colbreak()

	$ E_(R M S) &= hbar omega abs(alpha) \
	&= 10 hbar omega  $
]
$  (100.5 hbar omega)/(10 hbar omega) \ 
&= 10.05 approx 10 $

#answer[See figure above. The ratio is $(chevron HH chevron.r) / E_(R M S) approx 10$.]


#question[Calculate the mean value of $braket(alpha, xx, alpha)$ in a cocherent state $ket(alpha)$ as well as $x_(R M S)^2 = chevron xx^2 chevron.r - chevron xx chevron.r^2$. Does this value change in time?]

On a:
$ braket(alpha, xx, alpha) &= x_0 braket(alpha, aa + aa^+, alpha) \
&= x_0 (alpha + alpha^*) $

And:
$ x_(R M S)^2 &= braket(alpha, xx^2, alpha) - braket(alpha, xx, alpha)^2 \ 
&= x_0*2 braket(alpha, aa aa + aa aa^+ + aa^+ aa + aa^+ aa^+, alpha) - x_0^2 (alpha + alpha^*)^2 \ 
&= x_0^2 (alpha^2 + (alpha^*)^2 + abs(alpha)^2 + abs(alpha)^2 + 1) - x_0^2 (alpha^2 + (alpha^*)^2 + 2 abs(alpha)^2) \
&= x_0^2 $

#answer[$chevron xx chevron.r = x_0 (alpha + alpha^*)$, and $x_(R M S)^2 = x_0^2$. This value is not dependent on time.]


#question[Calculate the mean value of $braket(alpha, pp, alpha)$ in a cocherent state $ket(alpha)$ as well as $p_(R M S)^2 = chevron p^2 chevron.r - chevron pp chevron.r^2$. Check the product $x_(R M S) p_(R M S)$. Does it depend on the value of $alpha$?]

The computation of $braket(alpha, pp, alpha)$ and $p_(R M S)^2$ are similar, and we get:
#columns(2)[
	$ braket(alpha, pp, alpha) = -i p_0 (alpha - alpha^*) $

	#colbreak()

	$ p_(R M S)^2 = p_0^2 $
]

We check:
$ x_(R M S) p_(R M S) &= x_0 p_0 \
&= sqrt(hbar / (2 m omega)) sqrt((hbar m omega)/2) \
&= hbar / 2 $

#answer[$chevron pp chevron.r = -i p_0 (alpha - alpha^*)$ and $p_(R M S)^2 = p_0^2$. The product is $hbar/2$. It does not depend on $alpha$.]


#question[Chooste $alpha(t = 0) = 10$ and plot $chevron xx chevron.r$ as a function of time on a computer. Make the thickness of your line equal to $x_R M S$.]

We have $alpha(t) = 10 exp(-i omega t)$ and constant thickness $x_(R M S) = x_0$ (musch smaller), so this is just a cosine osicllation: \

\#figure(image("./res/hw2_question15.jpg", width: 60%))

#answer[See plot above.]


= Displacement operator

#question[Check the following method of creating coherent state: 
$ exp(-abs(alpha)^2 / 2) exp(alpha aa^+) ket(0) &= ket(alpha) \
exp(alpha^* aa) ket(0) &= ket(0) $]

WE have:
$ exp(-abs(alpha)^2 / 2) exp(alpha aa^+) ket(0) &= exp(-abs(alpha)^2/2) (1 + alpha aa^+ + (alpha^2 aa^+ aa^+)/2 + ...) ket(0) \
&= exp(-abs(alpha)^2/2) (ket(0) + alpha aa^+ ket(0) + alpha^2/2 aa^+ aa^+ ket(0) + ...) \
&= (alpha^2 aa^+ aa^+)/2 (ket(0) + alpha ket(1) + alpha^2/2! sqrt(2!) ket(2) + ...) \
&= ket(alpha) $

And:
$ exp(alpha^* aa) ket(0) &= (1 + alpha^* aa + ((alpha^*)^2 aa aa) / 2! + ...) ket(0) \
&= ket(0) + alpha^* aa ket(0) + ((alpha^*)^2 / 2! aa aa ket(0) + ... \
&= ket(0) + alpha^* dot 0 + (alpha^*)^2 / 2! sqrt(2!) dot 0 + ... \
&= ket(0) $

#answer[Proof, see above.]


#question[Prove that
$ exp(-abs(alpha)^2/2) exp(alpha aa^+) exp(-alpha^* aa^+) = exp(alpha aa^+ - alpha^* aa) $]

We have:
$ &exp(-abs(alpha)^2/2) exp(alpha aa^+) exp(-alpha^* aa^+) \
&= exp(-abs(alpha)^2/2) exp(alpha aa^+ - alpha^* aa) exp(1/2 [alpha aa - alpha^* aa]) \
&= exp(-abs(alpha)^2/2) exp(alpha aa^+ - alpha^* aa) exp(abs(alpha)^2/2) \
&= exp(alpha aa^+ - alpha^* aa) $

#answer[Proof, see above.]


#question[Prove that displacement operator redefined is unitary and that $DD^(-1)(alpha) = DD(-alpha) = DD^+(alpha)$.]

We have:
$ DD(-alpha) &= exp(-alpha^* aa + alpha aa^+) \
&= exp(-alpha aa^+ + alpha* aa)^+ \
&= DD^+(alpha) $

And:
$ DD(alpha) DD(-alpha) &= exp(alpha aa^+ - alpha^* aa) exp(-alpha aa^+ + alpha^* aa) \
&= hat(I) \
&=> DD(-alpha) = DD^(-1)(alpha) $

#answer[Proff, see above.]


#question[Prove the following communation relations: 
$ DD^+(alpha) aa = (aa + alpha) DD^+(alpha) $
$ DD^+(alpha) aa^+ = (aa^+ + alpha^*) DD^+(alpha) $]

We have:
$ DD(alpha) DD(beta) &= exp(alpha aa^+ - alpha^* aa) exp(beta aa^+ - alpha^* aa) \
&= exp(alpha aa^+ - alpha^* aa + beta aa^+ - alpha^* aa) exp(1/2(alpha beta^* - alpha^* beta)) \
&= exp((alpha + beta) aa^+ - (alpha^* + beta^*) aa) exp(1/2(alpha beta^* - alpha^* beta)) \
&= DD(alpha + beta) exp((alpha beta^* - beta alpha^*)/2) $

We apply both sides of the first equation to an abitrary coherent state $ket(beta)$ with eigenvale $beta$ and see they are equal:
#columns(2)[
	$ &D^+(alpha) aa ket(beta) \
	&= beta DD^+(- alpha) ket(beta) \
	&= beta DD(-alpha) DD(beta) ket(0) \
	&= beta DD(beta - alpha) exp(1/2(-alpha beta^* + alpha^* beta)) ket(0) $

	#colbreak()
	$ &(aa + alpha) DD^+(alpha) ket(beta) \
	&= (aa + alpha) DD(-alpha) ket(beta) \
	&= (aa + alpha) DD(beta - alpha) exp(1/2(-alpha beta^* + alpha^* beta)) ket(0) \
	&= beta DD(beta - alpha) exp(1/2 (beta alpha^* - alpha beta^*)) ket(0) $
]

The second equation is done in the same way. 

#answer[Proof, see above.]


#question[Show that for a real $alpha$ (that is $alpha^* = alpha$), the displaicement operator becomes:
$ DD(alpha) = exp(-i (pp dot 2 alpha x_0)/hbar) $]

We have:
$ DD(alpha) &= exp(alpha aa^+ - alpha aa) \
&= exp(alpha(aa^+ - aa)) \ 
&= exp(alpha ((1/2 xx/x_0 - 1/2 i pp/p_0) - (1/2 xx/x_0 + 1/2 i pp/p_0))) \
&= exp(-i alpha pp/p_0) \
&= exp(-i (pp dot e alpha x_0)/hbar) $

#answer[Proof, see above.]


#question[Prove further that for $alpha^* = alpha$: 
$ exp(+ i (pp dot 2 alpha x_0)/hbar) xx exp(- i (pp dot 2 alpha x_0)/hbar) = xx + 2 alpha x_0 $]

We have:
$ exp(+ i (pp dot 2 alpha x_0)/hbar) xx exp(- i (pp dot 2 alpha x_0)/hbar) &= DD^+(alpha) xx DD(alpha) \
&= x_0 DD^+(alpha)(aa + aa^+) DD(alpha) \
&= x_0 (DD^+(alpha) aa DD(alpha) + DD^+(alpha) aa^+ DD(alpha)) \
&= x_0 (aa + alpha + aa^+ + alpha) \
&= xx + 2 alpha x_0 $

#answer[Proof, see above.]


= Matric representation of quantum oscillators

#question[Show by explicit matrix multiplication that the identity matrix $hat(I)$ would be given by 
$ hat(I) = sum_n ketbra(n) $]

We have:
$ sum_n ketbra(n) &= mat(1, 0, 0, dots) mat(1; 0; 0; dots.v) + mat(0, 1, 0, dots) mat(0; 1; 0; dots.v) + dots \
&= mat(1, 0, 0, dots; 0, 0, 0, dots; 0, 0, 0, dots; dots.v, dots.v, dots.v, dots.down) + mat(0, 0, 0, dots; 0, 1, 0, dots; 0, 0, 0, dots; dots.v, dots.v, dots.v, dots.down) + dots \
&= hat(I) $ 

#answer[Profo, see above.]


#question[Write down matrices for $xx$ and $pp$ operators for $N_(max) = 4$. Do they come out hermitian?]

We have:
#show math.equation: set block(breakable: true)
$ xx &= x_0 (aa^+ + aa) \
&= x_0 ( mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0) + mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0)^T ) \
&= x_0 mat(0, sqrt(1), 0, 0, 0; sqrt(1), 0, sqrt(2), 0, 0; 0, sqrt(2), 0, sqrt(3), 0; 0, 0, sqrt(3), 0, sqrt(4); 0, 0, 0, sqrt(4), 0) $
#show math.equation: set block(breakable: false)

And:
$ pp &= -i p_0 (aa^+ - aa) \
&= -i p_0 ( mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0) - mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0)^T ) \
&= -i p_0 mat(0, -sqrt(1), 0, 0, 0; sqrt(1), 0, -sqrt(2), 0, 0; 0, sqrt(2), 0, -sqrt(3), 0; 0, 0, sqrt(3), 0, -sqrt(4); 0, 0, 0, sqrt(4), 0) $

#answer[Respectively, $x_0 mat(0, sqrt(1), 0, 0, 0; sqrt(1), 0, sqrt(2), 0, 0; 0, sqrt(2), 0, sqrt(3), 0; 0, 0, sqrt(3), 0, sqrt(4); 0, 0, 0, sqrt(4), 0)$ and $-i p_0 mat(0, -sqrt(1), 0, 0, 0; sqrt(1), 0, -sqrt(2), 0, 0; 0, sqrt(2), 0, -sqrt(3), 0; 0, 0, sqrt(3), 0, -sqrt(4); 0, 0, 0, sqrt(4), 0)$. Both are trivially hermitian.]


#question[Write down matrices for $aa^+ aa$ and $aa aa^+$ operators for $N_(max) = 4$. Are these matrices identical.?]

We have:
$ aa^+ aa &=  mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0)^T mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0) \
&= mat(0, 0, 0, 0, 0; 0, 1, 0, 0, 0; 0, 0, 2, 0, 0; 0, 0, 0, 3, 0; 0, 0, 0, 0, 4) $

And:
$ aa aa^+ &= mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0) mat(0, sqrt(1), 0, 0, 0; 0, 0, sqrt(2), 0, 0; 0, 0, 0, sqrt(3), 0; 0, 0, 0, 0, sqrt(4); 0, 0, 0, 0, 0)^T \
&= mat(1, 0, 0, 0, 0; 0, 2, 0, 0, 0; 0, 0, 3, 0, 0; 0, 0, 0, 4, 0; 0, 0, 0, 0, 0) $

#answer[Respectively, $mat(0, 0, 0, 0, 0; 0, 1, 0, 0, 0; 0, 0, 2, 0, 0; 0, 0, 0, 3, 0; 0, 0, 0, 0, 4)$ and $mat(1, 0, 0, 0, 0; 0, 2, 0, 0, 0; 0, 0, 3, 0, 0; 0, 0, 0, 4, 0; 0, 0, 0, 0, 0)$. They are not the same.]


#question[Check the commutation $[aa, aa^+] = hat(I)$. If it does not exactly match, how do you think we can fix it?]

We check:
$ [aa, aa^+] &= aa aa^+ - aa^+ aa \
&= mat(1, 0, 0, 0, 0; 0, 2, 0, 0, 0; 0, 0, 3, 0, 0; 0, 0, 0, 4, 0; 0, 0, 0, 0, 0) - mat(0, 0, 0, 0, 0; 0, 1, 0, 0, 0; 0, 0, 2, 0, 0; 0, 0, 0, 3, 0; 0, 0, 0, 0, 4) \
&= mat(1, 0, 0, 0, 0; 0, 1, 0, 0, 0; 0, 0, 1, 0, 0; 0, 0, 0, 1, 0; 0, 0, 0, 0, -4) $

#answer[Prrof, see above. We can fix it by adding $N_(max) + 1$ at the element in $(N_(max), N_(max))$, which can be done by doing $[aa, aa^+] + (N_(max) + 1) ketbra(N_(max))$ isntead of normal $[aa, aa^+]$.]


= Wavefunctions

#question[Use the recurssion relation to derive the following wave-functions of the oscillator's excited state:
$ Psi_1(x) = x/x_0 Psi_0(x) $
$ Psi_2(x) = 1/sqrt(2) ((x/x_0)^2 - 1) Psi_0(x) $
$ Psi_3(x) = 1/sqrt(6) x/x_0 ((x/x_0)^2 - 3) Psi_0(x) $]

$Psi_1$ is found trivially. For the rest, we have:
$ Psi_2(x) &= 1/sqrt(2) (x/x_0 Psi_1(x) - Psi_0(x) \
&= 1/sqrt(2) (x/x_0 (x/x_0 Psi_0(x)) - Psi_0(x)) \
&= 1/sqrt(2) ((x/x_0)^2 - 1) Psi_0(x) $

And:
$ Psi_3(x) &= 1/sqrt(3) (x/x_0 Psi_2(x) - sqrt(2) Psi_1(x)) \
&= 1/sqrt(3) x/x_0 (1/sqrt(2)((x/x_0)^2 - 1) - sqrt(2)) Psi_0(x) \
&= 1/sqrt(6) x/x_0 ((x/x_0)^2 - 3) Psi_0(x) $

#answer[Proof, see above.]


#question[Verify that the following functin satisfies equation 62:
$ Psi_0(x) 1/(2 pi x_0^2)^(1/4) exp(-(x/(2 x_0))^2) $]

We have:
$ x Psi_0(x) + 2 x_0^2 pdv(, x) Psi_0(x) &= x Psi_0(x) + 2 x_0^2 (-x)/(2 x_0^2) 1/(2 pi x_0^2)^(1/4) exp(-(x/(2 x_0^2))^2) \
&= x Psi_0(x) + 2 x (-x)/(2 x_0^2) Psi_0(x) \
&= Psi_0(x) (x + 2 x_0^2 (-x)/(2 x_0^2))
&= 0 $

#answer[Proof, see above.]


#question[Plot the 3 lowest energy eigenstates wavefunctions. Count the number of nodes. Make a similar plot with $abs(Psi)^2$. Are you suprised with where the oscillator is more or less likely to be?]

#answer[The graphs are on the slides seen in class, so I won't redraw them. There are $0, 1, "and" 2$ nodes for $Psi_0, Psi_1 "and" Psi_2$ respectively, and same for $abs(Psi_i)^2$. Since we saw that in class, I'm not really surprised by anything, but it's worth mentionig that this doesn't follow classical expectations.]


#question[Verify by numerical integration that $Psi_0(x), Psi_1(x) "and" Psi_2(x)$ magically come out normalized in the sense of equation 51.]

#answer[I did not trudge through those three integrals myself but online calculators did find that those were all equal to $1$:
$ integral_(-infinity)^(+infinity) abs(Psi_0(x))^2 dif x = 1 $
$ integral_(-infinity)^(+infinity) abs(Psi_1(x))^2 dif x = 1 $
$ integral_(-infinity)^(+infinity) abs(Psi_2(x))^2 dif x = 1 $
So we can say that they are indeed normalized in the sense of equation 51.]


#question[Verify by numerical integration that $Psi_0(x), Psi_1(x) "and" Psi_2(x)$ magically come out orthogonal.]

#answer[Again, I did not go throught them myself, but online calculators did find that:
$ integral_(-infinity)^(+infinity) Psi_0(x)Psi_1(x) dif x = 0 $
$ integral_(-infinity)^(+infinity) Psi_1(x)Psi_2(x) dif x = 0 $
$ integral_(-infinity)^(+infinity) Psi_2(x)Psi_0(x) dif x = 0 $
So we can conclude that they are indeed orthognoal.]


#question[Plot $abs(Psi_n(x))^2$ for $n = 0, 1, 2$. For each $n$, calculate the probability that $abs(x) < x_(R M S)$.]

#answer[Again, we've seen those plots in class. For the probabilities, we get $0.681, 0.303 "and" 0.225$ for $n = 0, 1 "and" 2$ respectively.]


= Discovering quantum mechanics with oscillator wavefunctions

#question[Plot the oscillator's potential energy $V(x) = (m omega^2 x^2)/2 = hbar omega x^2 / (4 x_0^2)$ and identify the classically forbidden reegion geometrically for the ground state $Psi_0(x)$.]

We have:

\#figure(image("./res/hw2_question32.jpg", width: 60%))

#answer[See plot above. The classically forbidden regions are the areas under the $V(x)$ curve and outside of the zone delimited by $plus.minus x_c$ (green vertical lines).]


#question[Stack the plot from the previous exercise on top of a plot for $abs(Psi_0(x))^2$, using exactly the same range of $x$-axis. Indicate the probability to find teh oscillator at $abs(x) > x_c$ geometrically.]

We have:

\#figure(image("./res/hw2_question33.jpg", width: 60%))

#answer[Dee plot above. The areas are those under the curve, outside of the $plus.minus x_c$ lines.]


#question[Make the "$V(x) - Psi(x)$" plot for $abs(Psi_100)^2$ and observe that one is more likely to find a particle near the boudaries of the classically forbidden region. Does this make sense with your classical intuitiion?]

#answer[See in class as well. The curve indeed goes higher towards the two ends (outside $plus.minus V(x)$), so it's more likely to find a particule there. This does make sense with classical intuition, since a classical oscillator would get slower when it reaches its turning points (and therefore spend more time in that area).]


#question[Calculate De Broglie wavelength of a cat chasing a mouse. Use any realistic assumptions on the mass and the speed of the cat.]

We have:
$ lambda_"cat" &= hbar/(m v) \
&= (6.63 dot 10^(-34)) / (3 dot 10) \
&= 2.21 dot 10^(-35) $

#answer[Assuming the cat weighs around $3k g$, and that it runs at about $10 m.s^(-1)$, we get that its wavelength is $2.21 dot 10^(-35) m$]


#question[Plot $Psi_10(x)$, zoom in to its period near the center $x = 0$, and extract the period, Verify that this period indeed approximately equals $2 pi x_0 / sqrt(10 + 1/2)$.]

We have:
$ (2 pi) / sqrt(10 + 1/2) x_0 approx 1.94 x_0 $

Now, on the plot:

\#figure(image("./res/hw2_question36.jpg", width: 60%))

We can approximate that the period is around $2 x_0$, which matches with the formula.

#answer[See plot above. The period is indeed approximately equal to the one we get using the analytical predition.]


#question[Reapeat the previous exercise and identify the De Broglie wavelength $lambda_n$ for state $ket(n), n = 10, 20, 30, dots, 100$. Summarize your answers on a $lambda_n$ vs $n$ plot and compare them to the analytical prediction $lambda_n = 2 pi x_0 / sqrt(n)$.]

We have:

\#figure(image("./res/hw2_question37.jpg", width: 60%))

#answer[See plot above. The points match up pretty nicely, which was expected.]










