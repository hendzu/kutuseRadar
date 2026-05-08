<script setup></script>
<template>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Kütuseradar</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <RouterLink class="nav-link active" aria-current="page" to="/">Kütusehinnad</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/test">Kaart</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/test">Lisa Hind</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/test">Logi sisse</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/test">Registreeru</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link disabled" aria-disabled="true">Minu soodustused</RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <RouterView />
</template>
