<script setup>
import HelloWorld from './components/HelloWorld.vue'
import TheWelcome from './components/TheWelcome.vue'
import { useKakao } from 'vue3-kakao-maps/@utils'
import { KakaoMap,KakaoMapMarker } from 'vue3-kakao-maps'

useKakao('228da3a7e283b54897dee61916b342ee')

const coordinate = {
  lat: 37.566826,
  lng: 126.9786567
}
</script>

<template>
  <header>
    <KakaoMap :lat="coordinate.lat" :lng="coordinate.lng" :draggable="true">
      <KakaoMapMarker :lat="coordinate.lat" :lng="coordinate.lng"></KakaoMapMarker>
    </KakaoMap>

    <div class="wrapper">
      <HelloWorld msg="내가 해냄!" />
    </div>
  </header>

  <main>
    <TheWelcome />
  </main>
</template>

<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
