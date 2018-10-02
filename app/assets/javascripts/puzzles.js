let interval = 0;

document.addEventListener("turbolinks:load", () => {
  let game = document.getElementById("game")
  if(game){
    setListeners();
    setTimer();
  }
})

function setTimer(){
  let timer = document.getElementById("time");
  let start = Date.now();
  interval = setInterval(() => {
    let diff = Date.now() - start;
    timer.innerHTML = Math.floor(diff/1000).toString() + "." + Math.floor(diff % 1000).toString() + "s";
  }, 1);
}

function stopTimer(time){
  clearInterval(interval);
  let timer = document.getElementById("time")
  timer.innerHTML = time + "s";
}

function addBox(menu){
  let box = document.createElement("div");
  box.classList.add("box");
  box.style.width = "50px";
  box.style.height = "80px";
  box.style.left = (parseInt(menu.style.left) - (parseInt(box.style.width))/2) + "px";
  box.style.top = (parseInt(menu.style.top) - (parseInt(box.style.height))/2) + "px";
  document.getElementById("game-container").appendChild(box);
}

function remove(name){
  let char = document.getElementById(name.toLowerCase());
  char.style.display = "none";
}

function message(s){
  let message = document.getElementById("message");
  message.style.visibility = "visible";
  message.innerHTML = s;
}

function enter_score(){
  let new_score = document.getElementById("new_score")
  new_score.style.display = "block";
}

function setListeners(){
  const menu = document.getElementById("mini-menu");

  game.addEventListener("contextmenu", e => {
    e.preventDefault();
    menu.style.left = e.offsetX + "px";
    menu.style.top = e.offsetY + "px"; 
    menu.style.display = "block";
    return false;
  })

  window.addEventListener("click", () => {
    if(menu.style.display === "block"){
      menu.style.display = "none";
    }
  })

  game.addEventListener("click", () => {
    if(menu.style.display === "block"){
      menu.style.display = "none";
    }
  })

  const list = [...menu.getElementsByTagName("li")];
  list.forEach((li) => {
    li.onclick = () => {
      let url = new URL('http://localhost:3000/check')
      let params = {
        id: document.getElementById("game-container").dataset.id,
        character: li.innerHTML.replace(/ /g, "_"),
        x: menu.style.left,
        y: menu.style.top
      }
      url.search = new URLSearchParams(params)

      fetch(url).then(r => { r.json().then(r =>{
        if(r.correct){
          addBox(menu)
          remove(r.name)
          message("Good job you got one!")
          if(r.complete){
            if(r.highscore){
              message(`Nice, you beat the puzzle in ${r.time.toFixed(3)} seconds!`)
            }
            else{
              message(`Nice, you beat the puzzle in ${r.time.toFixed(3)} seconds, which is a highscore!`)
              enter_score()
              stopTimer(r.time.toFixed(3))
            }
          }
        }
        else{
          message("Try again!")
        }
      })})
    }
  })
}