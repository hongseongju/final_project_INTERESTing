## #각티슈 뽑듯 간편한 금리 비교 사이트 INTERESTing✨

240516

- 고운
  User 기능 구현: 로그인, 회원가입

- 성주
  카카오맵 API 연결

---

240517

- 고운
  User 기능 보완: 닉네임, 캐시 추가
  적금 API 연결
- 성주
  환율 API 연결

💞 240518

- 고운

1. profile 페이지에서 유저의 ID는 출력되나, 닉네임이 출력되지 않는 문제.
   유저의 개인정보 변경 기능을 구현하지 않았기 때문에 변경될 일이 없을 것이라는 판단 하에 authStore.user가 없을 때만 fetchUserDetails를 호출하도록 하였음.

- 수정 전 코드

```
onMounted(() => {
  if (!authStore.user) {
    authStore.fetchUserDetails();
  }
});
```

하지만 로그아웃 로직에 사용되는 유저 ID와는 다르게, 닉네임은 null값으로 초기화되는 로직을 작성하지 않았고, 수정 전 코드의 경우 컴포넌트가 마운트될 때 authStore.user가 null 또는 undefined일 경우에만 fetchUserDetails를 호출하도록 되어 있어 닉네임은 출력되지 않는 현상이 발생함.

- 수정 후 코드

```
onMounted(() => {
  authStore.fetchUserDetails();
});
```

if 조건문을 삭제하자 닉네임이 정상적으로 출력됨. 추후 개인정보 수정 기능을 구현할 예정이므로 불필요한 조건문이었던 것으로 보임.

- 성주

1. 환율 api 데이터 vue에 출력하기 오류
   django의 exchange_rate의 views.py에서 data=rate는 객체를 생성해서 DB에 저장하거나 수정할때 사용하는 코드이다.

오류 코드

```
serializer = ExchangeSerializer(data=rate, many=True)
```

MYSQL문 수정은 가능하지만 Vue까지 도달하지 않는다

수정코드

```
serializer = ExchangeSerializer(rate, many=True)
```

이렇게 'data=' 구문을 빼주면 DB의 쿼리셋을 불러와서 json 형태로 바꿔지고 Vue까지 도달해 출력이 잘 된다.

2. API 연결해서 Vue까지 출력하는 방법
   api를 받을 app 생성 => django 경로를 연결한다(urls.py) => views.py에 api 연결 루트를 작성하고 models.py와 serializers.py에 저장하고 싶은 데이터를 작성한다 => Vue의 component에 axios로 django 경로를 요청한다 => 사이트에서 get 요청이 들어오면 Vue에 데이터가 잘 출력된다.
