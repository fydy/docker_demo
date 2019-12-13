<template>
  <section class="container">
    <div>
      <h1 class="title">
        Nuxt.js SSR Example
      </h1>
      <p>
        This is another page of the SSR example, you accessed it via
        <strong>{{ isServer ? "server" : "client" }} side</strong>.
      </p>
      <p>
        You can reload to see how the page change.
      </p>
      <div class="links">
        <nuxt-link
          to="/"
          class="button--green">Go Home</nuxt-link>
      </div>
    </div>
  </section>
</template>

<script>

export default {
  asyncData () {
    const isServer = typeof window === "undefined";
    return { isServer };
  }
}
</script>

<style>
p, .links {
  padding-top: 15px;
}
</style>

