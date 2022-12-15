



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

## 🛠 사용 기술

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
  
  - <u>상품 검색</u> : 상품명, 판매처 별로 상품을 검색 할 수 있습니다.
  - <u>로그인</u> : 로그인을 할 수 있습니다. RSA 암호화 방식을 적용하였습니다.
  - <u>회원가입</u> : 회원가입을 할 수 있습니다. ID중복 체크를 해야 가입이 가능하고, 우편번호에는 Daum(Kakao) PostCode API를 사용하였고, RSA 암호화 방식을 적용하였습니다.
  - <u>ID / PW찾기</u> : 개인정보를 이용하여 ID를 찾을 수 있고, PW는 재설정 할 수 있습니다. RSA 암호화 방식을 적용하였습니다.

</details> 

  <details>
    <summary><b>마이 페이지</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  
  - <u>주문 조회</u> : 사용자의 주문 내역을 조회합니다. 주문번호와 상품 이름을 통해 검색 할 수 있고,기간을 선택하여 조회 할 수 있습니다. (Ajax 적용)
  - <u>개인정보관리 </u> : 비밀번호를 한번 더 확인하고(RSA 적용) , ID를 제외한 사용자의 개인정보를                                  변경 할 수 있으며 회원 탈퇴도 가능합니다.  
  - <u>결제수단관리 </u> : 포인트 충전을 할 수 있는 화면을 구현하였습니다.
  </details> 
  
  <details>
    <summary><b>판매자 페이지</b></summary>
      <p align="center">
        <img src="https://user-images.githubusercontent.com/89395238/207784716-cb001c29-eab5-4b89-b31f-e04b7dcc45af.JPG">
      </p>
  
  - <u>상품</u> : 등록된 상품 리스트들을 출력합니다. 진열 상태(판매중, 품절)와 상품명, 상품 코드를                    통해 검색조건을 추가하여 조회 할 수 있습니다.(Ajax 적용) 또한 상품의 수정, 등록 또한 할 수 있습니다.
  - <u>주문 / 정산 </u> : 판매한 내역들의 리스트를 검색어, 기간을 통해 조회하고(Ajax 적용), 주문의 상세 내역을 확인 할 수 있습니다. 또한 어제까지의 매출을 등록된 본인 계좌에 정산 할 수 있고, 정산 내역을 확인 할 수 있습니다.  
  - <u>판매자 설정 </u> : 세션을 통해 로그인 여부를 판단하고, 사용자 아이드를 확인하여 판매자 여부를 판단 한 뒤, 판매자라면 판매처 해지를 할 수 있고, 판매자가 아니라면 판매자 등록을 할 수 있습니다. 또한 판매처 정보 수정을 통해 판매처 정보를 수정 할 수 있습니다. (RSA적용)
  </details> 

## 💡 느낀점

- 

<br/>

## 🔥 Outputs

- **인증** : 150명 중 상위 10%(15명)인 [**우수자**](https://www.swmaestro.org/sw/bbs/B0000006/view.do?nttId=23408&menuNo=200015&pageIndex=4)에 선정되었습니다.
- [First Penguin팀 또박이 기능영상](https://youtu.be/tA0RM6SWhJ0)

<br/>
<br/>


<details>
  <summary><b>더 자세한 프로젝트 설명이 궁금하시면❓</b></summary>
 

### 특징

- 한국의 난독증 아동을 위한 서비스입니다.
- [대한난독증협회](http://www.nandoc.com/)에서 실제 진행되고 있는 검사와 치료법을 바탕으로 커리큘럼 기획을 하였습니다.
- 3개의 검사와 6개의 학습으로 이루어져 있습니다.

### 검사 유형

1. 청각처리속도 검사
    - 변화하는 소리를 구분할 있는 능력을 평가합니다.
    - 올라가는 소리(낮은 피치 → 높은 피치)와 내려가는 소리(높은 피치 → 낮은 피치)가 있습니다.
    - 이 두 가지 소리 중 랜덤으로 2번의 소리를 들려줍니다.
    - 2번의 소리의 간격을 점점 줄여가며 2개의 소리를 구분할 수 있는지 체크합니다.
2. 어음청취력 검사
    - 1음절의 비슷한 말소리를 들려준 후 구분할 수 있나 체크합니다.
3. 선택적 집중력 검사
    - 소음이 있는 상황에서 사람의 목소리를 정확하게 듣고 따라할 수 있는 체크합니다.

### 학습 유형

1. 따라 읽기
    - 유일한 **의미 중심 학습**입니다.
    - (1)동시/동요, (2)자/모음 단어를 듣고 따라 읽습니다.
    - 발음/속도/리듬감 등을 계산합니다.
2. 자/모음 구분하기
    - 들려주는 한 음절의 자/모음을 듣고 해당하는 글자를 클릭합니다.
3. 단어를 듣고 그림 맞추기
    - 들려주는 단어를 듣고 해당하는 그림을 클릭합니다.
4. 그림의 첫 음소 맞추기
    - 그림에 해당하는 단어를 듣고 첫 음소에 해당하는 글자를 클릭합니다.
5. 음절수 계산하기
    - 들려주는 단어를 듣고 사과 나무에서 사과를 드래그하여 바구니에 드랍합니다.
6. 공통 소리 찾기
    - 들려주는 3개의 단어를 듣고 공통되는 소리를 클릭합니다.

### 개발 외

- 컨텐츠 개발을 위해 대한난독증협회와 수차례 미팅 진행
- 주요 타겟층 아동에 맞춘 프레임워크 및 UX 디자인, 기획 및 개발
  
  
</details>
