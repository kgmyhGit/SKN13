# Bootstrap
**Grid System(그리드 시스템)은 웹 페이지를 반응형(responsive)으로 설계**할 수 있도록 도와주는 핵심적인 레이아웃 구성 방식이다.   
HTML 요소들을 행(`row`)과 열(`column`)의 구조로 나누어, 다양한 해상도와 디바이스 크기에서 일관된 레이아웃을 유지할 수 있게 해준다.


## 핵심 개념

1. **12-column 기반 시스템**

	- Bootstrap의 그리드 시스템은 한 줄(`row`)을 기본적으로 **12개의 column**으로 나눈다. 
	- 이 12개의 열을 기준으로 너비를 나누며, 다양한 비율로 조합하여 유연한 레이아웃을 구성할 수 있다.

예:

```html
<div class="row">
  <div class="col-4">4칸</div>
  <div class="col-8">8칸</div>
</div>
```

2. **반응형 브레이크포인트(Breakpoints)**
   - **반응형 브레이크포인트(Breakpoints)란** 웹사이트나 애플리케이션이 다양한 화면 크기(예: 스마트폰, 태블릿, 데스크탑 등)에 맞게 레이아웃과 스타일을 조정할 수 있도록 **CSS 미디어 쿼리(Media Queries)**에서 설정하는 화면 크기 기준점을 말한다.  
     - 특정 화면 너비 조건에서 화면의 레이아웃이 바뀌도록 한다.
     - 예를 들어
       - 모바일화면(작은화면)에서는 메뉴가 숨겨지고, 데스크탑(큰 화면)에서는 메뉴가 펼쳐지도록한다. 
       - 작은 화면에서는 메뉴를 세로로 펼치고 큰화면에서는 가로로 펼친다.
   - Bootstrap은 다양한 디바이스 크기를 고려하여 반응형 디자인을 쉽게 만들 수 있도록 여러 브레이크포인트를 정의해 두었다. 각 브레이크포인트는 특정 화면 너비 이상일 때 자동으로 적용된다.

| 브레이크포인트  | 접두어     | 최소 너비 | 디바이스 예시|
| --------------- | ---------- | --------- | ------------ |
| Extra small     | `col-`     | 없음      | 스마트폰     |
| Small           | `col-sm-`  | ≥576px    | 작은 태블릿  |
| Medium          | `col-md-`  | ≥768px    | 일반 태블릿  |
| Large           | `col-lg-`  | ≥992px    | 노트북       |
| Extra large     | `col-xl-`  | ≥1200px   | 데스크탑     |
| XXL             | `col-xxl-` | ≥1400px   | 대형 디스플레이 |


3. **행(`row`)과 열(`col`)의 구조**
  - 그리드 시스템을 구성할 때는 항상 `row` class로 행을 정의하고 `col` class로 열을 정의한다.

  ```html
  <div class="container">
    <div class="row">
      <div class="col-6">열1</div>
      <div class="col-6">열2</div>
    </div>
  </div>
  ```

  - `.container`: 전체 레이아웃을 감싸는 부모. 내부 마진이 포함되어 있음.
  - `.row`: 한 줄(row)을 의미. 내부 열을 정렬하기 위해 margin을 음수로 적용.
  - `.col-*`: 각 열(column). 12분할 구조 내에서 너비를 설정. 열의 개수를 지정하지 않으면 동일 비율로 나눈다.

4. **중첩(Nesting)을 이용해 복잡한 Layout을 구성한다.**

- 열(`col`) 내부에 또 다른 `row`와 `col`을 넣어서 그리드를 중첩시킬 수 있다.

```html
<div class="row">
  <div class="col-6">
    <div class="row">
      <div class="col-6">중첩 열1</div>
      <div class="col-6">중첩 열2</div>
    </div>
    
  </div>
  <div class="col-6">기본 열</div>
</div>
```

5. **오프셋(Offset)**
열의 시작점을 이동시켜 정렬을 조절할 수 있다.

```html
<div class="row">
  <div class="col-4 offset-4">가운데 정렬</div>
</div>
```

위 예시에서 `offset-4`는 왼쪽에 4칸만큼 공백을 만들어 `col-4`가 가운데 오도록 한다.