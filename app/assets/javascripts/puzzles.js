document.addEventListener("turbolinks:load", () => {
  let game = document.getElementById("game")

  if(game){
    const menu = document.getElementById("mini-menu");

    game.addEventListener("contextmenu", e => {
      e.preventDefault();
      menu.style.left = e.pageX + "px";
      menu.style.top = e.pageY + "px";
      menu.style.display = "block";
      return false;
    })

    window.addEventListener("click", e => {
      if(menu.style.display === "block"){
        menu.style.display = "none";
      }
    })

    game.addEventListener("click", e => {
      if(menu.style.display === "block"){
        menu.style.display = "none";
      }
    })

    const list = [...menu.getElementsByTagName("li")];
    list.forEach((li) => {
      li.onclick = () => {
        console.log("You clicked... " + li.innerHTML);
      }
    })
  }
})