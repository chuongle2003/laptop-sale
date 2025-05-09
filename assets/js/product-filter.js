// Khởi tạo biến toàn cục lưu trữ các tham số lọc hiện tại
let currentFilters = {
  category_id: null,
  brand_id: null,
  price_from: 0,
  price_to: 50000000,
  sort: null,
  page: 1,
};

// Khởi tạo sự kiện khi tài liệu đã sẵn sàng
document.addEventListener("DOMContentLoaded", function () {
  // Xử lý URL hiện tại để lấy các tham số
  const urlParams = new URLSearchParams(window.location.search);

  // Cập nhật các tham số từ URL vào đối tượng lọc
  if (urlParams.has("category_id")) {
    currentFilters.category_id = urlParams.get("category_id");
    highlightCategory(currentFilters.category_id);
  }

  if (urlParams.has("brand_id")) {
    currentFilters.brand_id = urlParams.get("brand_id");
    highlightBrand(currentFilters.brand_id);
  }

  if (urlParams.has("pricefrom") && urlParams.has("priceto")) {
    currentFilters.price_from = urlParams.get("pricefrom");
    currentFilters.price_to = urlParams.get("priceto");
    updatePriceSlider(currentFilters.price_from, currentFilters.price_to);
  }

  if (urlParams.has("pricesort")) {
    currentFilters.sort = urlParams.get("pricesort");
    highlightSort(currentFilters.sort);
  }

  if (urlParams.has("pagenumber")) {
    currentFilters.page = urlParams.get("pagenumber");
  }

  // Khởi tạo sự kiện cho nút lọc theo giá
  const btnFilter = document.querySelector(".btn__filter");
  if (btnFilter) {
    btnFilter.addEventListener("click", function (e) {
      e.preventDefault();
      const inputMin = document.querySelector(".input-min").value;
      const inputMax = document.querySelector(".input-max").value;

      currentFilters.price_from = inputMin;
      currentFilters.price_to = inputMax;
      currentFilters.page = 1; // Reset về trang 1 khi lọc

      updateProductList();
    });
  }

  // Khởi tạo sự kiện click cho các danh mục
  const categoryLinks = document.querySelectorAll(".sidebar__item--label");
  categoryLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault();
      const url = new URL(this.href);
      const categoryId = url.searchParams.get("category_id");

      currentFilters.category_id = categoryId;
      currentFilters.page = 1; // Reset về trang 1 khi lọc

      updateProductList();
    });
  });

  // Khởi tạo sự kiện click cho các thương hiệu
  const brandLinks = document.querySelectorAll(
    ".product-detail__variant--item"
  );
  brandLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault();
      const url = new URL(this.href);
      const brandId = url.searchParams.get("brand_id");

      currentFilters.brand_id = brandId;
      currentFilters.page = 1; // Reset về trang 1 khi lọc

      updateProductList();
    });
  });

  // Khởi tạo sự kiện click cho sắp xếp giá
  const sortLinks = document.querySelectorAll("#price-asc, #price-desc");
  sortLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault();
      const url = new URL(this.href);
      const sort = url.searchParams.get("pricesort");

      currentFilters.sort = sort;
      currentFilters.page = 1; // Reset về trang 1 khi lọc

      updateProductList();
    });
  });

  // Thêm event delegation cho tất cả các event liên quan đến lọc
  document.addEventListener("click", function (e) {
    // Xử lý phân trang
    const isPaginationLink =
      e.target.classList.contains("pagi-link") ||
      e.target.closest(".pagi-link");

    if (isPaginationLink) {
      e.preventDefault();
      const paginationLink = e.target.closest("a");
      if (!paginationLink || paginationLink.classList.contains("active"))
        return;

      const url = new URL(paginationLink.href);
      const page = url.searchParams.get("pagenumber");

      if (page) {
        currentFilters.page = page;
        updateProductList();
        // Cuộn trang lên đầu khu vực sản phẩm
        document
          .querySelector(".product-list")
          .scrollIntoView({ behavior: "smooth" });
      }
    }

    // Xử lý nút "Xem tất cả"
    const isViewAllBtn =
      e.target.classList.contains("btn__view--all") ||
      e.target.closest(".btn__view--all");

    if (isViewAllBtn) {
      e.preventDefault();

      // Reset tất cả các bộ lọc
      currentFilters = {
        category_id: null,
        brand_id: null,
        price_from: 0,
        price_to: 50000000,
        sort: null,
        page: 1,
      };

      updatePriceSlider(0, 50000000);
      updateProductList();
    }
  });

  // Khởi tạo sự kiện click cho nút xóa tag lọc
  document.addEventListener("click", function (e) {
    const tagItem = e.target.closest(".tag__item");
    if (tagItem) {
      e.preventDefault();

      // Xác định loại tag để xóa filter tương ứng
      const tagText = tagItem
        .querySelector(".tag__name")
        .textContent.toLowerCase();

      if (tagText.includes("giá")) {
        currentFilters.price_from = 0;
        currentFilters.price_to = 50000000;
        updatePriceSlider(0, 50000000);
      } else if (tagText.includes("danh mục")) {
        currentFilters.category_id = null;
      } else if (tagText.includes("thương hiệu")) {
        currentFilters.brand_id = null;
      }

      currentFilters.page = 1; // Reset về trang 1 khi bỏ lọc
      updateProductList();
    }
  });
});

// Hàm cập nhật danh sách sản phẩm bằng AJAX
function updateProductList() {
  // Hiển thị trạng thái đang tải
  const productListContainer = document.querySelector(
    ".product-list .row:nth-child(2)"
  );
  if (productListContainer) {
    productListContainer.innerHTML =
      '<div class="col text-center"><p>Đang tải sản phẩm...</p></div>';
  }

  // Tạo URL với các tham số lọc
  let url = "pages/handle/ajax-filter-products.php?";

  if (currentFilters.category_id) {
    url += "category_id=" + currentFilters.category_id + "&";
  }

  if (currentFilters.brand_id) {
    url += "brand_id=" + currentFilters.brand_id + "&";
  }

  if (currentFilters.price_from || currentFilters.price_to) {
    url +=
      "pricefrom=" +
      currentFilters.price_from +
      "&priceto=" +
      currentFilters.price_to +
      "&";
  }

  if (currentFilters.sort) {
    url += "pricesort=" + currentFilters.sort + "&";
  }

  url += "pagenumber=" + currentFilters.page;

  // Thực hiện yêu cầu AJAX
  fetch(url)
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then((data) => {
      // Cập nhật danh sách sản phẩm
      if (productListContainer) {
        productListContainer.innerHTML = data.products;
      }

      // Cập nhật phân trang
      const paginationContainer = document.querySelector(".pagination");
      if (paginationContainer) {
        paginationContainer.innerHTML = data.pagination;
      }

      // Cập nhật các tag lọc
      const tagContainer = document.querySelector(".product__tag");
      if (tagContainer) {
        tagContainer.innerHTML = data.tags;
      }

      // Cập nhật URL trong trình duyệt mà không tải lại trang
      updateBrowserUrl();

      // Cập nhật UI để hiển thị các bộ lọc đã chọn
      updateFilterUI();
    })
    .catch((error) => {
      console.error("Lỗi khi tải dữ liệu:", error);
      if (productListContainer) {
        productListContainer.innerHTML =
          '<div class="col text-center"><p>Đã xảy ra lỗi khi tải sản phẩm: ' +
          error.message +
          "</p><p>Vui lòng thử lại hoặc tải lại trang.</p></div>";
      }
    });
}

// Cập nhật URL trong trình duyệt mà không tải lại trang
function updateBrowserUrl() {
  let url = "index.php?page=products";

  if (currentFilters.category_id) {
    url += "&category_id=" + currentFilters.category_id;
  }

  if (currentFilters.brand_id) {
    url += "&brand_id=" + currentFilters.brand_id;
  }

  if (currentFilters.price_from || currentFilters.price_to) {
    url +=
      "&pricefrom=" +
      currentFilters.price_from +
      "&priceto=" +
      currentFilters.price_to;
  }

  if (currentFilters.sort) {
    url += "&pricesort=" + currentFilters.sort;
  }

  if (currentFilters.page > 1) {
    url += "&pagenumber=" + currentFilters.page;
  }

  window.history.pushState({ path: url }, "", url);
}

// Cập nhật giao diện để hiển thị các bộ lọc đã chọn
function updateFilterUI() {
  // Bỏ tất cả các trạng thái đã chọn
  document.querySelectorAll(".category__active").forEach((item) => {
    item.classList.remove("category__active");
  });

  document.querySelectorAll(".variant__active").forEach((item) => {
    item.classList.remove("variant__active");
  });

  // Highlight danh mục đã chọn
  if (currentFilters.category_id) {
    highlightCategory(currentFilters.category_id);
  }

  // Highlight thương hiệu đã chọn
  if (currentFilters.brand_id) {
    highlightBrand(currentFilters.brand_id);
  }

  // Highlight sắp xếp đã chọn
  if (currentFilters.sort) {
    highlightSort(currentFilters.sort);
  }
}

// Highlight danh mục đã chọn
function highlightCategory(categoryId) {
  const categoryLinks = document.querySelectorAll(".sidebar__item--label");
  categoryLinks.forEach((link) => {
    const url = new URL(link.href);
    if (url.searchParams.get("category_id") == categoryId) {
      link.classList.add("category__active");
    }
  });
}

// Highlight thương hiệu đã chọn
function highlightBrand(brandId) {
  const brandLinks = document.querySelectorAll(
    ".product-detail__variant--item"
  );
  brandLinks.forEach((link) => {
    const url = new URL(link.href);
    if (url.searchParams.get("brand_id") == brandId) {
      link.classList.add("variant__active");
    }
  });
}

// Highlight sắp xếp đã chọn
function highlightSort(sort) {
  const ascLink = document.getElementById("price-asc");
  const descLink = document.getElementById("price-desc");

  if (sort === "asc" && ascLink) {
    ascLink.classList.add("sort-active");
    if (descLink) descLink.classList.remove("sort-active");
  } else if (sort === "desc" && descLink) {
    descLink.classList.add("sort-active");
    if (ascLink) ascLink.classList.remove("sort-active");
  }
}

// Cập nhật giá trị thanh trượt giá
function updatePriceSlider(minPrice, maxPrice) {
  const rangeMin = document.querySelector(".range-min");
  const rangeMax = document.querySelector(".range-max");
  const inputMin = document.querySelector(".input-min");
  const inputMax = document.querySelector(".input-max");
  const range = document.querySelector(".slider .progress");

  if (rangeMin && rangeMax && inputMin && inputMax && range) {
    rangeMin.value = minPrice;
    rangeMax.value = maxPrice;
    inputMin.value = minPrice;
    inputMax.value = maxPrice;

    // Cập nhật giao diện thanh trượt
    range.style.left = (minPrice / rangeMin.max) * 100 + "%";
    range.style.right = 100 - (maxPrice / rangeMax.max) * 100 + "%";
  }
}
