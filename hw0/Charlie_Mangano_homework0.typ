#import "@preview/mannot:0.3.0": *
#set document(
	author: "charlie mangano",
	date: auto,
	title: [quantum hw0],
)
#set page(
	paper: "a4",
	header: [
		_charlie mangano_ #h(1fr) #emph([#datetime.today().display("[day].[month].[year]")])
	],
	numbering: "1",
)
#let bish = rgb(80, 150, 150)
#show figure.where(kind: "aparte"): set align(start)
#show figure.where(kind: "aparte"): it => block(inset: (left: 8pt, top: 2pt, bottom: 2pt), width: 100%, breakable: false, stroke: (left: bish), spacing: 16pt, {
	strong({
    set text(size: 1.15em)
		it.supplement
		[1.]
		it.counter.display("1")
    []
  })
	[\ ]
  it.body
})
#let question = a => figure(kind: "aparte", supplement: "Exercise ")[#a]
#let Omeghat = $hat(Omega)$
#align(
	center, 
	text(1.5em)[
		*Homework 0* 
	]
)

= Classical Harmonic Oscillator

== HO evolution equations in the matrix form

#question[What are the units of $X$ and $P$?]

We know the units of every component of the formulae for $X$ and $P$, so we can deduce their units. \
 - $x$ is position $[m]$
 - $m$ is mass $[k g]$
 - $k$ is spring stiffness $[N/m]$
 - $p$ is momentum $[N dot s]$
We get: \
$omega = sqrt(k / m) "so" [sqrt(N/(m dot k g))] &= [sqrt(((k g dot m) / (s^2)) / (m dot k g)) ] \
&= [sqrt(1/s^2)] \
&= [1/s] "(frequency, as expected)"$

$X = x sqrt(m dot omega) "so" [X] &= [m] sqrt([k g] [1/s]) \
&= [(m dot sqrt(k g)) / sqrt(s)] \
markhl(&= [(m dot k g^(1/2))/s^(1/2)] = [m dot k g^(1/2) dot s^(-1/2)])$

$P = p/sqrt(m dot omega) "so" [P] &= ([N dot s]) / (sqrt([k g] dot [1/s])) \
&= [(N dot s) / sqrt((k g) / (1 / s))]\
&= [((k g dot m dot s) / s^(2)) / sqrt((k g) / (1 / s) )] \
&= [(k g dot m dot s) / (s^2 sqrt((k g) / (1 / s) )) ] \
&= [(k g dot m) / (k g^(1/2) dot s^(1/2)) ] \
markhl(&= [(k g^(1/2) dot m) / s^(1/2)] = [m dot k g^(1/2) dot s^(-1/2)]) $


#question[Check by explicit multiplication that $I^2 = I$ and $Omeghat^2 = -omega^2 I$.]

$I^2 &= mat(1, 0; 0, 1) mat(1, 0; 0, 1) \
markhl(&= mat(1, 0; 0, 1) = I)$

$Omeghat^2 &= omega mat(0, 1; -1, 0) omega mat(0, 1; -1, 0) \
&= omega^2 mat(-1, 0; 0, -1) \
markhl(&= -omega^2 mat(1, 0; 0, 1) = -omega^2 I)$


#question[Check that expression $(3)$ is indeed the solution of equation $(2)$ by taking the time-derivative of $arrow(s)(t)$ and the above definition of the matrix exponentiation.]

We have: \
$(3) equiv arrow(s)(t) = exp(Omeghat t) arrow(s)(t = 0)$

And, taking the time-derivative: 

$markhl(dot(hat(s))(t) &= Omeghat exp(Omeghat t) arrow(s)(t = 0)) \
markhl(&= Omeghat arrow(s)(t) equiv (2))$

== Oscillator motion in real space is a rotation in the $(X, P)$-space

#question[Prove the above formula for $exp(Omeghat t)$.]

We have:\
$(5) equiv exp(Omeghat t) &= I cos(omega t) + Omeghat/omega sin(omega t) \ 
&= mat(cos(omega t), sin(omega t); -sin(omega t), cos(omega t))$

Computing the powers of $Omeghat$, we find that: 

$Omeghat^(4k) = omega^(4k) I$ #h(1em) ; #h(1em) $Omeghat^(4k + 1) = omega^(4k) Omeghat$ #h(1em) ; #h(1em) $Omeghat^(4k + 2) = -omega^(4k + 2) I$ #h(1em) ; #h(1em) $Omeghat^(4k + 3) = -omega^(4k + 2) Omeghat$

Substituting that in the matrix exponentiation:

$ exp(Omeghat t) &= I + Omeghat t + (Omeghat^2 t^2)/2! + (Omeghat^3 t^3)/3! + (Omeghat^4 t^4)/4! + (Omeghat^5 t^5)/5! + ... \ 
&= I + Omeghat t + (-omega^2 I t^2)/2! + (-omega^2 Omeghat t^3)/3! + (omega^4 I t^4)/4! + (omega^4 Omeghat t^5)/5! + ... \
&= I (1 - (omega t)^2/2! + (omega t)^4/4! - ...) + Omeghat (t - (omega^2 t^3)/3! + (omega^4 t^5)/5! - ...) \
&= I (1 - (omega t)^2/2! + (omega t)^4/4! - ...) + Omeghat/omega (omega t - (omega t)^3/3! + (omega t)^5/5! - ...) \
markhl(&= I cos(omega t) + Omeghat / omega sin(omega t)) $


#question[Show that the matrix $exp(Omeghat t)$ corresponds to a rotation of a vector in the $(X, P)$-plane by an angle $omega t$, clockwise.]

We have: \
$exp(Omeghat t) = mat(cos(omega t), sin(omega t); -sin(omega t), cos(omega t))$

#markhl[This is the standard form for a rotation matrix with angle $omega t$.] Using the two proposed vectors, we can check that they are indeed rotated clockwise with a $omega t$ angle and still have the same norm:

$ exp(Omeghat t)vec(X_0, 0) &= mat(cos(omega t), sin(omega t); -sin(omega t), cos(omega t))vec(X_0, 0) \ 
&= vec(X_0 cos(omega t), -X_0 sin(omega t)) $

$ exp(Omeghat t)vec(0, P_0) &= mat(cos(omega t), sin(omega t); -sin(omega t), cos(omega t))vec(0, P_0) \ 
&= vec(P_0 sin(omega t), P_0 cos(omega t)) $


#question[Speculate what might be a useful application of the fact that HO's period does not depend on initial conditions. Think watchmaking industry.]

In the watchmaking industry, this can be used to #markhl[keep time accurately] since regardless of how much the HO inside the clock is wound, the period stays the same. This is used in metronomes as well (also to keep time).


#question[Find a matrix $exp(Omeghat t)^(-1)$ which is defined as the inverse of $exp(Omeghat t)$.]

The inverse matrix would be a rotation matrix of the same angle but in the opposite direction:

$ markhl(exp(Omeghat t)^(-1) = mat(cos(omega t), -sin(omega t); sin(omega t), cos(omega t))) $

We can check:
$ exp(Omeghat t) exp(Omeghat t)^(-1) &= mat(cos(omega t), sin(omega t); -sin(omega t), cos(omega t)) mat(cos(omega t), -sin(omega t); sin(omega t), cos(omega t)) \
&= mat(cos(omega t)cos(omega t) + sin(omega t)sin(omega t), -cos(omega t)sin(omega t) + sin(omega t)cos(omega t); -sin(omega t)cos(omega t) + cos(omega t)sin(omega t), sin(omega t)sin(omega t) + cos(omega t)cos(omega t)) \
&= mat(1, 0; 0, 1) = I $

#question[Show by explicit calculation using equation $(5)$ that the quantity $X(t)^2 + P(t)^2 = X_0^2 + P_0^2$, that is, the value of the Hamiltonian function $-$ basically the total energy of the system $-$ does not change in time.]

We have: \
$(5) equiv exp(Omeghat t) &= I cos(omega t) + Omeghat/omega sin(omega t) \ 
&= mat(cos(omega t), sin(omega t); -sin(omega t), cos(omega t))$

And: \
$X(t) = X_0 cos(omega t) + P_0 sin(omega t)$ #h(1em) ; #h(1em) $P(t) = -X_0 sin(omega t) + P_0 cos(omega t)$

We can compute:

$ X(t)^2 &= (X_0 cos(omega t) + P_0 sin(omega t))^2 \
&= X_0^2 cos^2(omega t) + P_0^2 sin^2(omega t) + 2 X_0 P_0 cos(omega t) sin(omega t) $

$ P(t)^2 &= (-X_0 sin(omega t) + P_0 cos(omega t))^2 \
&= X_0^2 sin^2(omega t) + P_0^2 cos^2(omega t) - 2 X_0 P_0 cos(omega t) sin(omega t) $

So we get: 

$ X(t)^2 + P(t)^2 &= X_0^2 cos^2(omega t) + P_0^2 sin^2(omega t) + X_0^2 sin^2(omega t) + P_0^2 cos^2(omega t) \
&= X_0^2(cos^2(omega t) + sin^2(omega t)) + P_0^2(cos^2(omega t) + sin^2(omega t)) \
markhl(&= X_0^2 + P_0^2) $


#question[Verify that $X(t)$ and $P(t)$ obtained using the complex number formulation agree with the matrix formulation solution.]

We have: \ 
$Z(t) = Z_0 exp(-i omega t)$ the complex number formulation.

We can expand via the definition of the complex exponential form:
$ Z(t) &= Z_0 exp(-i omega t) \
&= (X_0 + i P_0) (cos(omega t) - i sin(omega t)) \
&= X_0 cos(omega t) - i X_0 sin(omega t) + i P_0 cos(omega t) + P_0 sin(omega t) \
&= X_0 cos(omega t) + P_0 sin(omega t) + i (P_0 cos(omega t) - X_0 sin(omega t)) $

And we get:
$ markhl(X(t) = "Re"(Z(t)) = X_0 cos(omega t) + P_0 sin(omega t)) $
$ markhl(P(t) = "Im"(Z(t)) = P_0 cos(omega t) - X_0 sin(omega t)) $
Which are exactly the solutions from the matrix formulation.


== Periodically-driven oscillator: resonance


#question[Show that the Hamiltonian equations of motion in the presence of drive, in the matrix form, are $ dot(arrow(s)) = Omeghat arrow(s) + arrow(F)(t), $ where $arrow(F)(t) = (0, f(t))$, where $f(t) = F(t)/sqrt(m omega)$.]

The Hamiltonian equation with drive is: \
$H_D (x, p) = p^2/(2m) + (k x^2)/2 - x arrow(F)(t)$

We get:
$ dot(x) = (partial H_D)/(partial p) = p/m $
$ dot(p) = - (partial H_D)/(partial x) = -k x + F(t) $

Following the same procedure as described earlier in the handout, we can redefine $X = x sqrt(m omega)$ and $P = p/sqrt(m omega)$, and a column vector $arrow(s) = (X, P)^T$. We also reuse the definition $Omeghat = omega mat(0, 1; -1, 0)$. We want to find the relation between $arrow(s)$ and $dot(arrow(s)) = (dot(X), dot(P))^T$:

#columns(2)[
$ dot(X) &= dot(x) sqrt(m omega) \
&= (p sqrt(m omega))/m \
&= p / sqrt(m omega) (sqrt(m omega) sqrt(m omega))/m \
&= P (sqrt(m omega) sqrt(m omega))/m \
&= omega P $
#colbreak()
$ dot(P) &= dot(p)/sqrt(m omega) \
&= (-k x + F(t)) / sqrt(m omega) \
&= ((-k x sqrt(m omega)) / sqrt(m omega) + F(t)) / sqrt(m omega) \
&= ((-k X) / sqrt(m omega) + F(t)) / sqrt(m omega) \
&= (-k X) / (m omega) + F(t) / sqrt(m omega) \
&= (-omega^2 X) / omega + F(t) / sqrt(m omega) \
&= -omega X + F(t) / sqrt(m omega) $
]

As given in the handout, we define $f(t) = F(t)/sqrt(m omega)$. We get:

$ dot(arrow(s)) &= vec(dot(X), dot(P)) \
&= vec(omega P, - omega X + f(t)) \
&= vec(omega P, -omega X) + vec(0, f(t)) $

Again, defining as given in the handout $arrow(F)(t) = (0, f(t))^T$, we get:
$ dot(arrow(s)) = vec(omega P, - omega X) + arrow(F)(t) $

Finally, using the $Omeghat$ described above, we have:
$ markhl(dot(arrow(s)) = Omeghat arrow(s) + arrow(F)(t)) $


#question[Show by a direct substitution that (the case of the scalar equation) $dot(s_0) = exp(-Omega t) F(t)$, and hence $s_0(t) = integral^t exp(-Omega t') F(t') d t' + C$ and $s(t) = exp(Omega t)(C + integral^t exp(-Omega t') F(t') d t')$. The constant $C$ defines the initial conditions.]

We have: \
$dot(s) = Omega s + F(t)$

The ansatz for this equation is of the form:
$ s(t) = s_0(t) exp(Omega t) $

And: 
$ dot(s) = dot(s)_0 exp(Omega t) + s_0 Omega exp(Omega t) $

We substite into the differential equation to get:
$ dot(s)_0 exp(Omega t) + s_0 Omega exp(Omega t) &= s_0 Omega exp(Omega t) + F(t) \
dot(s)_0 exp(Omega t) &= F(t) \
dot(s)_0 &= exp(-Omega t) F(t) \ 
markhl(s_0(t) &= integral^t exp(-Omega t') F(t') d t' + C) $

Now, substitue this back into the ansatz:
$ markhl(s(t) = exp(Omega t) (integral^t exp(-Omega t') F(t') d t' + C)) $


#question[Plot $X(t)$ as well as a $t$-parametric plot in the $X-P$ plane, starting from $t = 0$ to $t = 17 times (2 pi)/omega$. Assume that at $t = 0$, $X = 0$ and $P = 0$. Describe in words what happens with an oscillator driven exactly in resonance.]

Plot of $X(t)$ with respect to time:
#figure(image("hw0_question12.jpg", width: 60%))
(period stays the same but amplitude grows lineraly)

$t$-parametric plot in the $X-P$ plane:
#figure(image("hw0_question12b.jpg", width: 60%))
(clockwise spiral towards the outside. I'm sorry I did not have time to measure precisely)

When an oscillator is driven exactly in resonance, the oscillator continously gets energy from the drive, so its amplitude grows linearly in time: it oscillates always at the same frequency but grows in amplitude.


