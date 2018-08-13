Sky Movies  
  
  Este projeto é uma aplicação feita em Swift para iOS, onde é demonstrado o uso do padrão MVP e algumas ferramentas
pertinentes ao desenvolvimento para iOS nativo.  
  
Visão Geral:  
  
- Suporta versão mínima do iOS: 8.  
- Suporta Autolayout para iPhones e iPads  
- Suporta: Autolayout e Resize para Portrait e Landscape  
  
 Frameworks Usados:  
  
- [Alamofire](https://github.com/Alamofire/Alamofire)  
- [Kingfisher](https://github.com/onevcat/Kingfisher)  
- [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs)  
- [Quick/Nimble](https://github.com/Quick/Nimble)  
  
 Ambiente  
   
  O projeto possui configurações para o ambiente de Desenvolvimento (DEBUG) e Produção (Release). Para alternar entre os ambientes e acessar informações diferentes, altere o Scheme do projeto. 
  
 No Xcode, ao lado do botão de "Play" poderá ser visto o Sheme selecionado, clique e alterne conforme a necessidade.  
   
  Isso irá afetar:  
  
- Troca de URL usada pela API  
- Troca de icones do aplicativo apresentado na tela do Device. (Icones para Development, terá a label DEBUG)  
- Troca do nome do aplicativo apresentado na tela do Device. (Builds para Development irá apresentar o nome "DEBUG" junto ao nome do App)  
  
Dependências  
  
  O projeto esta configurado para gerenciar as dependências com Carthage. Configurado Fastlane para 
 automatizar o processo de avaliação com testes unítários e criação de reporte de qualidade de código com 
 Slather (Cobertura de código) e Xcov (relatório de cobertura de testes). Podendo ser expandido seu uso para 
 automatizar outras tarefas, como geração de Screenshots para publicação, bem como gestão de provisioning 
 profiles e certificados, e publicação do App.
  
Executando o projeto  

  Para Executar o projeto execute os seguintes comandos: 

  1 - `$ bundle install`
  2 - `$ carthage update --cache-builds --platform ios`
  
  Abra o projeto usando o XCode e execute em seu device ou simulador. 
  
  Caso encontre algum problema, veja o texto a seguir:
  
  É necessário estar usando o Xcode v9.4 com Swift v4.2 (https://developer.apple.com/xcode/)  
  
  - Carthage  v0.29.0 (https://github.com/Carthage/Carthage#installing-carthage)  
  - Fastlane v2.98.0 (https://docs.fastlane.tools/getting-started/ios/setup/)  
  - Xcov v1.4.3 (https://github.com/nakiostudio/xcov)  
  - Swiftlint (https://github.com/realm/SwiftLint#installation)  
  - Ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]  
  
Recomendo o uso de RVM (Ruby Version Manger - https://rvm.io)  
  
SwiftLint  
 O projeto usa SwiftLint para auxiliar na manutenção do estilo e padrão de escrita do código, ajudando a manter o código limpo e de fácil leitura, evitando geração de código "sujo" ou sem um padrão de escrita.
  
  Para intalar o Swiftlint use o seguinte comando:  
  
 `$ brew install swiftlint`
     
  Para mais detalhes sobre o SwiftLint: https://github.com/realm/SwiftLint  
  
Gemfile  
  
 Após clonar o projeto, use o terminal para acessar a pasta:  
  
`$ cd <path to folder>/NAME_FOLDER_PROJECT`  
  
  Após acessar a pasta através do terminal use o comando abaixo para instalar algumas depenências a partir do arquivo Gemfile:  
  
`$ bundle install`  
  
Isso irá instalar o Fastlane, Slather, Xcpretty e Xcov.  

Carthage
Para instalar as denpendências diretas do projeto, é necessário a instalação do Carthage, caso ainda 
não possua o Carthage instalado, use o comando para instalar usando o HomeBrew (https://brew.sh/index_pt-br): 

`$ brew install carthage`

Para mais informações sobre detalhes de uso e instalação do Carthage, veja: https://github.com/Carthage/Carthage

Após a instalação do Carthage, use o comando apara instalar as dependências: 

`$ carthage update --cache-builds --platform ios`

  Este comando irá baixar os repositórios de cada dependência, e irá realiar um 
build para cada uma delas, gerando um framework compátivel somente para apps 
para iOS. Caso você precise executar o comando mais uma vez, ele NÃO irá realizar
novamente o build de frameworks que já foram criados.

Instalação de Dependências caso Necessário

Após o processo de instalação do Carthage e geração de frameworks, abra o projeto e execute um Build. Caso você receba warnings sobre dependências não encontradas, siga as etapas abaixo: 

1 - Em seguida, abra o projeto com o arquivo 'name_project.xcodproj' com o Xcode, e em uma janela no Finder, 
abra a pasta dentro do projeto: 

`<path to folder>/name_project_folder/Carthage/Build/iOS`

 2 - Selecione e arraste para o projeto, os arquivos de extensão: 

` *.dSYM`

` *.framework`

 3 - No Xcode, no Show Project Navigator (lado esquerdo), selecione o arquivo name_project.xcodeproj, 
 depois selecione o target: `name_project_target`. Selecione a aba 'Build Phases', dentro do conteúdo desta aba, no 
 canto superior esquedo, terá um sinal de adição '+', clique nele e selecione e opção: 'New Run Script Phase'.

 4 - No novo campo de scripts criado, altere o nome para Carthage ( ou outro que deseje), e na parte 'Input File'
 crie um novo registro para cada framework adicionado ao projeto.

Exemplo: 

    $(SRCROOT)/Carthage/Build/iOS/Alamofire.framework

CHECAGEM DO PROJETO

Para verificar o projeto, em seu terminal dentro da pasta do projeto, execute o seguinte comando lane, 
já configurado no arquivo Fastfile: 

`fastlane check_code env:dev`

 Este comando irá executar as seguintes verificações: 

  - Swiftlint
  - Testes Unitários
  - Geração de reporte do Slather
  - Geração de Reporte do Xcov

