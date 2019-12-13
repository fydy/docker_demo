<template>
  <section class="container">
    <div>
      <app-logo/>
      <h1 class="title">
        Nuxt.js SSR Example
      </h1>
      <div class="links">
        <nuxt-link
          to="about"
          class="button--green">Navigate to About</nuxt-link>
      </div>
    </div>
  </section>
</template>

<script>
import AppLogo from '~/components/AppLogo.vue'

export default {
  components: {
    AppLogo
  }
}
</script>

<style>
h1 {
  padding-top: 15px;
}

.links {
  padding-top: 15px;
}
</style>

