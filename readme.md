#각티슈 뽑듯 간편한 금리 비교 사이트 INTERESTing✨
----------
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
