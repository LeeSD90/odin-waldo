document.addEventListener("turbolinks:load", () => {
  let game = document.getElementById("game")
  
  if(game){
    setListeners();
  }
})

function addBox(menu){
  let box = document.createElement("div");
  box.classList.add("box");
  box.style.width = "50px";
  box.style.height = "80px";
  box.style.left = (parseInt(menu.style.left) - (parseInt(box.style.width))/2) + "px";
  box.style.top = (parseInt(menu.style.top) - (parseInt(box.style.height))/2) + "px";
  document.body.appendChild(box);
}

function setListeners(){
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
    li.onclick = (e) => {
      console.log("You clicked... " + li.innerHTML);
      addBox(menu);
    }
  })
}