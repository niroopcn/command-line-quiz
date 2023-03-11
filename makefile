project.sh: password.txt username.txt correctanswers.txt questions.txt
password.txt:
	touch password.txt
username.txt:
	touch username.txt
correctanswers.txt:
	var="a\nb\nd\na\nd\nb\nc\nc\nb\na\n" && echo -n $$var > correctanswers.txt
questions.txt:
	var1="1) Who is father of Joffery Baratheon?\na. Jamie Lannister\nb. Viserys Targaryen\nc. Robert Baratheon\nd. Tony Stark\n2) Who invented the Light Bulb?\na. Nikola Tesla\nb. Thomas Alva Edison\nc. Stephen Hawking\nd. Albert Einstein\n3) Who is credited to have created C Programming language alongside Dennis Ritchie?\na. Mark Zuckerberg\nb. Bill Gates\nc. Brian Kernighan\nd. Ken Thompson\n4) What is the name of Thor's Kingdom?\na. Asgard\nb. Bengaluru\nc. Ullagaddi\nd. Kollegala\n5) Who is considered to be the father of modern computer science?\na. John von Neumann\nb. Ada Lovelace\nc. Edsger Dijkstra\nd. Alan Turing\n6) What is the name of Bruce Wayne's automobile?\na. The Waverider\nb. Batmobile\nc. Jokercopter\nd. Invisible Jet\n7) Which Indian physicist has a nobel price for his work in the field of light scattering?\na. Vikram Sarabhai\nb. Srinivasa Ramanujan\nc. C.V. Raman\nd. Rocky Bhai\n8) Which company mentioned below does Elon Musk not own?\na. Twitter\nb. Tesla\nc. Meta\nd. Space-X\n9) Who is the creator of Bitcoin?\na. Chamayya Meshtru\nb. Satoshi Nakamoto\nc. Elon Musk\nd. Mark Zuckerberg\n10) Who is the known as missile man of India?\na. APJ Abdul Kalam\nb. JC Bose\nc. Homi Bhabha\nd. Rocky Bhai\n" && echo -n $$var1 > questions.txt
