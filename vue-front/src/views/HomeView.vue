<template>
  <main>
    <article class="article-margin">
      <div>
        <h4>각티슈 뽑듯 간편하게</h4>
        <h1>INTERESTing(´▽`ʃ♡ƪ)</h1>
      </div>
    </article>
  <article class="dark">
    <div class="margin">
    <h1>내일이 더 기대되는 금융</h1>
    <h4>소중한 사람에게 소중한 미래를 선물하세요.</h4>
    </div>
  </article>

  <article class="light-green">
    <!-- 예금 top 3 -->
    <MainDepositRate />
    <!-- 적금 top 3 -->
    <MainSavingsRate />
    <!-- 광고 carousel 부분 -->
    <div class="container">
      <div>
      <h4 class="text-dark-blue">EVENT</h4>
        <div id="carouselExampleDark" class="carousel carousel-dark slide" style="max-width: 500px; margin: 0 auto;">
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
</main>
</template>


<script setup>
import MainDepositRate from '../components/MainDepositRate.vue'
import MainSavingsRate from '../components/MainSavingsRate.vue'
</script>

<style scoped>
main {
  background-image: url('../assets/main_background.png');
  background-size: cover; /* 이미지 완전히 덮기 */
  background-position: center; /* 중앙에 위치 */
}

/* .dark{
  background-color: #01415B;
} */
/* 
.light-green {
background-color: #FAFFEE;
} */

.text-dark-blue {
  color: #01415B;
}

article {
  padding-top: 600px; 
  padding-bottom: 600px;
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
  margin-bottom: 100px;
}
</style>

