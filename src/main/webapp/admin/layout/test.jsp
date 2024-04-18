<div class="row justify-content-between mb-3">
  <div class="col-9">
    <form class="row gap-3" action="">
      <div class="col-auto">
        <input
          type="text"
          class="form-control"
          name="search"
          value="<%=search%>"
          id="search"
          placeholder="Search...."
        />
      </div>
      <div class="col-auto">
        <button type="submit" class="btn btn-outline-secondary btn-md rounded">
          Search
        </button>
        <a href="" class="btn btn-outline-secondary">clear</a>
      </div>
    </form>
  </div>
  <div class="col-3">
    <a class="btn btn-outline-primary float-end" href="create.jsp">
      <i class="fa fa-plus-circle"></i>
      Add New
    </a>
  </div>
</div>
