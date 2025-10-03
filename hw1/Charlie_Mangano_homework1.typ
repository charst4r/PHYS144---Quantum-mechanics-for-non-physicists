#import "@preview/mannot:0.3.0": *
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
#set heading(
	numbering: "A."
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
#let zeroket = $|0 angle.r$
#let oneket = $|1 angle.r$
#let Zhat = $hat(Z) #h(-0.05em)$

#align(
	center, 
	text(1.5em)[
		*Homework 1* 
	]
)

= Qubit states and their representation in the Bloch sphere

#question[Construct $2 times 2$ matrix $Zhat$, the eigenvectors of which are $zeroket$ and $oneket$ and the corresponding eigenvalues are $+1$ and $-1$. That is $Zhat zeroket = +1zeroket$ and $Zhat oneket = -1oneket$.]

