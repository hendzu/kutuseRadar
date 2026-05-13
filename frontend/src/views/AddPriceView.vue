<template>
  <div class="container mt-5">
    <h1 class="text-center">Lisa hind</h1>
    <div class="row justify-content-center mt-3">
      <div class="col col-2">
        <span>Tankla nimi</span>
      </div>
      <div class="col col-2">
        <select
          class="form-select form-select "
          aria-label="Default select example"
          aria-placeholder="Tankla"
        >
          <option selected>Vali tankla</option>
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
    </div>
    <div class="row justify-content-center mt-2">
      <div class="col col-2">
        <span>Kütuse liik</span>
      </div>
      <div class="col col-2">
        <select
          class="form-select form-select "
          aria-label="Default select example"
          aria-placeholder="Tankla"
        >
          <label class="form-label">Kütuse liik</label>
          <option selected>Vali tankla</option>
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
      </div>
    </div>
    <div class="row justify-content-center mt-2">
      <div class="col col-2">
        <span>Hind tanklas</span>
      </div>
      <div class="col col-2">
        <input type="number" class="form-control" placeholder="0.00" />
      </div>
    </div>
    <div class="row justify-content-center mt-3">
      <div class="col col-4">
        <button class="btn btn-primary w-100">Lisa hind</button>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
<script setup></script>
