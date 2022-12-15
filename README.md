



## ✍️ 프로젝트
### Pines
🌷 꽃, 묘목 시장의 통합 플랫폼
<p align="center">
  <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
</p>


> 2022.09. - 2022.12.    
> **개인 프로젝트**

<div style="display: flex;">
  <img src="" alt=""/>
  <img src="" alt=""/>
</div>

- 타겟
    - 농원 및 꽃집 등 도,소매 상인들
- 배경
    - 농원과 꽃 시장이 개별적으로 스토어가 오픈되어있지만 하나의 통합 플랫폼은 제대로 구축이 되어있지않음.
- 기능
    - 구매자 : 카테고리별로 제품을 조회 할 수 있고, 구매, 주문 내역 확인등을 할 수 있다.  
    - 판매자 : 농원 사용자, 꽃집 사용자로 나누어 각자 상품을 CRUD 할 수 있고, 생성된 주문에 대한 배송처리, 정산, 정산내역 조회등을 
할 수 있다.  

<br/>

## 🛠 

- Java/Spring
- Ibatis
- Oracle11g
- Apache-Tomcat
- AWS EC2
- Html
- JavaScript
- Css
<br/>

## 🖥 프로젝트 설계

<details>
    <summary><b>업무 흐름도</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  </details> 
<details>
    <summary><b>메뉴 구조도</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  </details> 
<details>
    <summary><b>데이터 모델링</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  </details> 
<br/>

## 📖 상세 내용
  ### 전체 메뉴 구성
  <details>
    <summary><b>메인 페이지</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  
  - **상품 검색** : 상품명, 판매처 별로 상품을 검색 할 수 있습니다.
  - **로그인** : 로그인을 할 수 있습니다. RSA 암호화 방식을 적용하였습니다.
  - **회원가입** : 회원가입을 할 수 있습니다. ID중복 체크를 해야 가입이 가능하고, 우편번호에는 Daum(Kakao) PostCode API를 사용하였고, RSA 암호화 방식을 적용하였습니다.
  - **ID / PW찾기** : 개인정보를 이용하여 ID를 찾을 수 있고, PW는 재설정 할 수 있습니다. RSA 암호화 방식을 적용하였습니다.

</details> 

  <details>
    <summary><b>마이 페이지</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  
  - **주문 조회** : 사용자의 주문 내역을 조회합니다. 주문번호와 상품 이름을 통해 검색 할 수 있고,기간을 선택하여 조회 할 수 있습니다. (Ajax 적용)
  - **개인정보관리** : 비밀번호를 한번 더 확인하고(RSA 적용) , ID를 제외한 사용자의 개인정보를                                  변경 할 수 있으며 회원 탈퇴도 가능합니다.  
  - **결제수단관리** : 포인트 충전을 할 수 있는 화면을 구현하였습니다.
  </details> 
  
  <details>
    <summary><b>판매자 페이지</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  
  - **상품** : 등록된 상품 리스트들을 출력합니다. 진열 상태(판매중, 품절)와 상품명, 상품 코드를                    통해 검색조건을 추가하여 조회 할 수 있습니다.(Ajax 적용) 또한 상품의 수정, 등록 또한 할 수 있습니다.
  - **주문 / 정산** : 판매한 내역들의 리스트를 검색어, 기간을 통해 조회하고(Ajax 적용), 주문의 상세 내역을 확인 할 수 있습니다. 또한 어제까지의 매출을 등록된 본인 계좌에 정산 할 수 있고, 정산 내역을 확인 할 수 있습니다.  
  - **판매자 설정** : 세션을 통해 로그인 여부를 판단하고, 사용자 아이드를 확인하여 판매자 여부를 판단 한 뒤, 판매자라면 판매처 해지를 할 수 있고, 판매자가 아니라면 판매자 등록을 할 수 있습니다. 또한 판매처 정보 수정을 통해 판매처 정보를 수정 할 수 있습니다. (RSA적용)
  </details> 

## 💡 느낀점
  **처음으로 다뤄본 서버 프레임워크 및 웹 프로젝트이고, 환경설정 및 모델링부터 배포까지 혼자 공부하며 진행하다보니** \
  **우여곡절도 굉장히 많았지만 동시에 배운점도 굉장히 많았습니다.**

- 로컬 환경과 배포 환경에서의 차이가 있으므로 설정을 같게하거나 그렇지 못 한 경우를 대비하여 오류가 날 수 있는 지점을 신경써서 개발해야한다.
    - 이미지 파일을 업로드 하는 경우, 경로 설정에 유의해서 사용 해야 한다.
        - 처음 배포 했을때, 이미지의 경로를 톰캣의 프로젝트 폴더 아래에 두면 서버 재배포시 이미지가 날아가게 되었고, 이를 보완하고자 다른 디렉토리에 이미지를 저장시켜 해결
    - Database의 경우 버전이 다르면 서로 다른 데이터 타입의 처리에서 에러가 나는 경우가 종종 있다.
        - ex) Date 타입 Select시 로컬 환경에서는 TO_CHAR이 적용이 되었었는데, 배포 환경에서는 되지 않아 TO_DATE를 통해 에러 해결
    - JDK의 버전이 다른 경우, 적용되지 않는 함수가 있다.
        - ex) Multipart File의 Mime Type 확인을 로컬(jdk 1.8.241)에서는 File.probeContentType()이 적용이 되었으나, 배포환경(jdk 1.8.341)에서는 적용이 되지 않아 MimetypesFileTypeMap.getContentType()을 통해 해결하였다.
- 데이터 모델링의 중요성에 대해서 깨달았다.
    - 개발을 하다보니 초반에 기획 했던 비즈니스 로직을 수행하기 위해서는 모델링의 수정이 불가피했다. 그렇게 되다보니 다른 쿼리들도 수정을 계속하게되었고, 너무 번거로웠다.
- CI / CD의 필요성에 대해서 깨달았다.
    - 수정사항이 생길때마다 jsp파일은 vi편집기로 어떻게 수정을 했지만 java파일을 수정 해야 할 때면 수정하고 Maven을 재 Install 하며 jar 파일을 다운받아 FTP 프로토콜로 EC2에 올려 톰캣을 중지시키고 실행시키는 작업을 지속적으로 했다. 여간 번거로운일이 아니였기 때문에 다음 프로젝트부터는 CI/CD를 통해 자동화를 적용시켜 보고싶다.

<br/>

## 🧭 실행 시나리오
<details>
   <summary><b>시나리오 1</b></summary>
  A 사용자 상품 등록 > B 사용자 상품 주문 > B사용자 주문 내역 확인 > A 사용자 상품 가격 변경 > B 사용자 주문내역 확인
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
</details>
  
<br/>
<br/>

