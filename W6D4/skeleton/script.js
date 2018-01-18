document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const placesFormEl = document.getElementById("place-form");
  placesFormEl.addEventListener("submit", event => {
    event.preventDefault();

    const favoritePlaceInputEl = document.getElementById("favorite-place");
    const favoritePlace = favoritePlaceInputEl.value;
    favoritePlaceInputEl.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = favoritePlace;
    ul.appendChild(li);
  });


  // adding new photos

  // --- your code here!

  const photoShowEl = document.getElementsByClassName("photo-show-button")[0];
  photoShowEl.addEventListener("click", event => {
    event.preventDefault();
    const photoFormEl = document.getElementsByClassName("photo-form-container")[0];
    photoFormEl.classList.remove("hidden");

    photoFormEl.addEventListener("submit", innerEvent => {
      innerEvent.preventDefault();

      const photoURLInputEl = document.getElementsByClassName("photo-url-input")[0];
      const photoURL = photoURLInputEl.value;
      photoURLInputEl.value = "";

      const ul = document.getElementsByClassName("dog-photos")[0];
      const li = document.createElement("li");
      const img = document.createElement("img");
      img.setAttribute("src", photoURL);
      li.appendChild(img);
      ul.appendChild(li);
    });
  });


});
