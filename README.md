# Login con Cubit e Bloc

Questo branch della repo '**Learn Flutter**' creata appositamente come strumento didattico per l'IEEE Student Branch dell'Università degli studi di Brescia mostra una app con Form di Login semplice utilizzando *cubit* e *bloc*.
- - -
## Login Bloc e Form Bloc

<p align="center" width="100%">
    <img src="https://user-images.githubusercontent.com/49036204/128077320-99435a91-6672-4cc5-aaad-74cc7fb66d67.png" height="200" >
</p>

In primo luogo il *Form_bloc* permette di mappare gli stati ed eventi relativi al form di login nella sua struttura e quindi immagazzina nello stato le variabili *email* e *password*. La potenza dei bloc sta nel fatto che permettono di ragionare traducendo i casi d'uso e definendo dei componenti ad alto livello che li gestiscano con una logica a stati-eventi per poi lasciare al programmatore la loro gestione. 
Analogamente il *Login_bloc* si occupa di gestire l'effettivo login con i suoi stati (in esecuzione e terminato) ed ha una dipendenza con *Authentication_cubit* con i suoi stati (autenticato e nonautenticato).
