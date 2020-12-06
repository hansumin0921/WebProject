# WebProject

##실행방법</br></br>
제일 먼저 실행시켜야 할 jsp는 products.jsp입니다. </br>
products.jsp를 실행시키면 전체 상품들을 확인하실 수 있습니다. 이어서 상단의 메뉴를 클릭하면 다른 jsp 페이지로 전환되는 것을 확인 할 수 있습니다.

##이벤트 실행방법</br></br>
이벤트는 로그인을 필수로 해야지만 참여할 수 있으며 1인 1회만 가능하게 만들었기 때문에 중복 참여가 불가능합니다.

##관리자 로그인시</br></br>
운영자 로그인을 하기 위해서는 일반 로그인에서 아이디는 kgu 패스워드는 manager를 입력해야합니다. 이후 상단 메뉴가 관리자만 확인할 수 있는 메뉴로 변경됩니다. 보안로그인이 추가적으로 설정되어있기 때문에 register/edit/remove 를 클릭하면 manager login화면이 나옵니다. manager login을 하기 위해서는 tomcat의 severs에서 tomcat-users.xml에</br>
```  <user username="kgu" password="kgu1234" roles="kgu"/>```</br>
이를 작성해야지 로그인이 가능합니다.

##상품등록시</br></br>
상품등록은 로딩문제를 해결하기 위하여 상품 등록 입력란의 첨부파일로 이미지를 업로드 한 후, 따로 webcontent>resources>images를 새로고침해주어야 정상적으로 이미지가 노출 됩니다.
</br></br>이하 실행방법은 간단한 웹페이지를 동작하는 것 과 같습니다.

