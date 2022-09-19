# sibs_books

O Projeto foi desenvolvido utilizando a versão estavel do flutter, [3.3.2](https://docs.flutter.dev/development/tools/sdk/releases).</br>
Para este projeto, foi utilizado:</br>
  [GetX](https://pub.dev/packages/get) como gerenciador de estado da aplicação, Gerenciamento de rotas nomeadas, Injeção e controle de dependecias</br>
  [Dio](https://pub.dev/packages/dio) para requisiçoes da api do google</br>
  [GetStorage](https://pub.dev/packages/get_storage) como persistencia dos dados no app</br>
  [URL_Laucher](https://pub.dev/packages/url_launcher) para abrir safari/chrome das paginas de compra e previre dos livros.</br>
  
  
#**Porque o GetX**:</br>
  Primeiramente por ser um gerencidor de estado leve, que possiblita muita agilidade no desenvolvimento, com inumeros extensios que facilitam o desenvolvimento, a possibilidade de manter uma arquitetura simples, porem bem organizada, sem muito acoplamento. Navegação por rotas nomeadas gerenciadas isoladamente, e injeçao/inversão de dependecia de forma simples, isolando cada componente em uma classe diferente, facilitando adição de novas paginas, controllers, repositories e etc.</br>
  e também por ser o gereciador de estado que eu tenho o maior conhecimento atualmente, está diretamente ligado aos ultimos projetos que eu atuei, então é certo dizer que é o que eu tenho maior familiaridade.</br>
 
  #**Dio** foi escolhido simplesmente pela praticidade, por ser amplamente utilizado pela comunidade, e faz o que tem que ser feito sem qualquer tipo de problema.</br>
  </br>
  #**GetStorage** foi utilizado pois ele mantem uma instancia do container de dados salvos na memoria e não busca a informação no disco toda vez que eu solicitar, e como eu queria fazer uma transição de telas entre a lista de livros da api do google e a lista de favoritos da forma mais rapida possivel, optei por utilizar o GetStorage, já que ele utiliza esse conceito de manter uma instancia na memoria, e depois internamente ele utiliza uma microtask, com threads e etc para salvar o container em disco.
  </br>
  #**URL laucher** para abrir os links em navegador, a escolha desse package foi porque é um uso bem simples, acredito que seja o package com a maior avaliação entre os packages que fazem essa mesma função e também por já ter utilizado antes em outros projetos.
  </br>
  </br>
  O projeto em si está organizado em tipos, então tudo relacionado e view, está localizado dentro de pages, tudo relacionado a controller, fica dentro da pagina de controllers.

Quando o projeto é iniciado, o InitialBinding é chamado, onde tem duas dependecias para serem criadas, utilizando o lazyput, que basicamente cria uma instancia do componente que eu solicitei somante quando necessário, e neste caso eu crio uma instancia do DIO, passando a url base da api do google como paramentro de criação, está que é uma constante declarada no projeto, e também uma instnacia de BooksRepository, no qual é a parte de get na api do google, como a primeira tela do app é a exibiição da lista de livros, esse repository precisa ser chamado primeiro para fazer o get.
Tanto o DIO como o booksReporitory são marcados no binding como FENIX, que é uma forma do GetX manter essa instancia desses dois sempre que eu precisar na aplicação.
</br>
</br>
Na primeira tela, o controller utilizado da função OnReady para chamar a função que faz a requisição da lista de livros na api do google, e enqaunto isso é exibido um loading na tela, caso a requisição tenha sido feita com sucesso, a tela é atualizada com a lista dos 12 primeiros livros.
caso o usuario role até o fim da lista, eu decidi utilizar o conceito de ScrollMixin, que fica escutando quando o usuario chega ao topo e ao fim de cada pagina, dessa forma eu não preciso criar nenhuma logica para isso já que essa classe já provem dessa informação, eu apenas precisei fazer um override da função onEndScroll() passando com ação eu quero que seja feita quando o usuario chegar ao fim da lista.
Neste caso, eu chamo uma função que faz uma nova requisição na api buscando mais 12 items, e atulizando a lista de itens na tela.</br>
</br>
No topo de tela é possivel alterar entre os livros favoritos e a lista de livros, ambos são exibidos na mesma tela, alternando somente o que está exibido, não quis criar uma nova tela para exibir somente os favoritos, já que é a mesma visualizao, não é diferenças entre elas.</br>
</br>
ao selecionar um livro da lista, é redirecionado para a tela detalhes, onde é exibido a capa do livro, titulo, autor/autores, descrição se houver e por fim, os links para compra do livro e um preview do livro diretamente no site do google.
Nesta tela também é possivel tocar no icone superior e definir o livro como favorito, neste caso o id do livro é salvo no storage.</br>
</br>
Na tela de favoritos, ao abrir, é chamado uma função que busca todos os ids salvos no storage, e faz um loop em todos os ids, com isso é feito requisições na api da google para obter todos os livros favoritos.</br>
</br>
Caso haja algum erro na requisição dos livros, é exibido uma mensagem de erro na tela, com o botao para tentar novamente, que indentifica que se o usuario está na tela de favoritos ou listagem de livros, com isso, faz a requisição para a tela em que está novamente.</br>
</br></br>

![Screenshot 2022-09-19 at 10 15 23](https://user-images.githubusercontent.com/54601019/190986319-e5e89117-50c8-42de-ab7d-6b7d319104d9.png)




The Project was developed using the stable version of flutter, [3.3.2](https://docs.flutter.dev/development/tools/sdk/releases).</br>
For this project we used:</br>
[GetX](https://pub.dev/packages/get) as application state manager, Named route management, Dependency injection and control</br>
[Dio](https://pub.dev/packages/dio) for google api requests</br>
[GetStorage](https://pub.dev/packages/get_storage) as data persistence in the app</br>
[URL_Laucher](https://pub.dev/packages/url_launcher) to open safari/chrome from purchase pages and preview from books.</br>

#**Why GetX**:</br>
Firstly, because it is a lightweight state manager, which allows for a lot of agility in the development, with numerous extensions that facilitate the development, the possibility of maintaining a simple architecture, but well organized, without much coupling. Navigation by named routes managed in isolation, and injection/inversion of dependency in a simple way, isolating each component in a different class, facilitating the addition of new pages, controllers, repositories and etc.</br>
and also for being the state manager that I have the most knowledge currently, it is directly linked to the last projects I worked on, so it's fair to say that it's what I'm most familiar with.</br>

#**Dio** was chosen simply for its practicality, for being widely used by the community, and it does what it has to do without any kind of problem.</br></br>

#**GetStorage** was used because it keeps an instance of the data container saved in memory and doesn't fetch the information from disk every time I request it, and as I wanted to make a screen transition between the google api book list and the list of favorites as quickly as possible, I chose to use GetStorage, since it uses this concept of keeping an instance in memory, and then internally it uses a microtask, with threads and so on to save the container on disk.</br></br>

#**#URL launcher** to open the links in the browser, the choice of this package was because it is a very simple use, I believe that it is the package with the highest evaluation among the packages that do this same function and also because I have used it before in other projects.</br>

The project itself is organized into types, so everything related to view is located inside pages, everything related to controller is inside the controllers page.</br>

When the project is started, the InitialBinding is called, where it has two dependencies to be created, using lazyput, which basically creates an instance of the component that I requested summing when necessary, and in this case I create an instance of DIO, passing the url base of the google api as a creation parameter, is that it is a constant declared in the project, and also an instance of BooksRepository, which is the get part in the google api, as the first screen of the app is the display of the list of books, this repository needs to be called first to get it. Both DIO and booksReporitory are marked in the binding as FENIX, which is a way for GetX to keep this instance of these two whenever I need it in the application.</br></br>

On the first screen, the controller used from the OnReady function to call the function that makes the request for the list of books in the google api, and while this is displayed a loading on the screen, if the request has been made successfully, the screen is updated with the list of the first 12 books. if the user scrolls to the end of the list, I decided to use the concept of ScrollMixin, which listens when the user reaches the top and the end of each page, so I don't need to create any logic for that since this class already provides From this information, I just had to override the onEndScroll() function passing it with the action I want to be done when the user reaches the end of the list. In this case, I call a function that makes a new request in the api, fetching 12 more items, and updating the list of items on the screen.</br></br>

At the top of the screen it is possible to change between the favorite books and the list of books, both are displayed on the same screen, alternating only what is displayed, I did not want to create a new screen to display only the favorites, since it is the same view, it's not differences between them.</br></br>

when selecting a book from the list, you are redirected to the details screen, where the book cover, title, author/authors, description if any and finally, the links to purchase the book and a preview of the book directly on the website of the Google. On this screen it is also possible to touch the top icon and set the book as a favorite, in this case the book id is saved in the storage.</br></br>

On the favorites screen, when opening, a function is called that searches for all the ids saved in the storage, and loops through all the ids, with this, requests are made to the google api to get all the favorite books.</br>

If there is an error in the book request, an error message is displayed on the screen, with the button to try again, which identifies that if the user is in the favorites or book listing screen, with this, he makes the request to the screen where you are again.</br></br>



