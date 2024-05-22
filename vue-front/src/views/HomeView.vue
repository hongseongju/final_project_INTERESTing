<template>
  <main>
    <div class="text-container">
      <h4>각티슈 뽑듯 간편하게</h4>
      <h1>INTERESTing(´▽`ʃ♡ƪ)</h1>
    </div>
  </main>

  <article class="dark">
    <div class="container">
    <div class="margin">
    <h1>내일이 더 기대되는 금융</h1>
    <h4>소중한 사람에게 소중한 미래를 선물하세요.</h4>
    </div>
      <div class="margin">
      <h4 class="m-5">진행 중인 은행 EVENT</h4>
        <div id="carouselExampleDark" class="carousel carousel-dark slide" style="max-width: 800px; margin: 0 auto;">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="2000">
          <img src="`/src/assets/ad/kukmin1.jpg`" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <div class="carousel-item" data-bs-interval="2000">
          <img src="`/src/assets/ad/kukmin1.jpg`" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <div class="carousel-item" data-bs-interval="2000">
          <img src="`/src/assets/ad/kukmin1.jpg`" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
</div>
  </article>

  <article>
    <MainDepositRate />
  </article>
</template>


<script setup>
import MainDepositRate from '../components/MainDepositRate.vue'
</script>

<style scoped>
main {
  background-image: linear-gradient(30deg, #e3f8b6, #cadf2a, #808d1b);
  padding-top: 200px; 
  padding-bottom: 1000px;

}

.text-container {
    position: absolute; /* 절대 위치 설정 */
    top: 40%; /* 세로 이동 */
    left: 20%; /* 가로 이동 */
    transform: translate(-50%, -50%);     
}
.dark{
  background-color: #01415B;
}

article {

  padding-top: 200px; 
  padding-bottom: 500px;
  text-align: center;
}

h1 {
  color: white;
  font-weight: bold;
}
h4 {
  color: white;
  font-weight: bold;
}
.carousel-item img {
  border-radius: 20px;
  width: 100%;
  height: auto; /* 이미지의 비율을 유지하면서 크기를 조절 */
}
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

.margin{
  margin-top: 400px;
  margin-bottom: 200px;
}
</style>

