
function clear(){
    document.getElementById("flower").value="";
}

var addButton=document.getElementById("btn_1");

addButton.addEventListener('click',()=>{

const flowers=document.getElementById("flowers");

var flowerSet=new Set();

 var flower=document.getElementById("flower").value;
     flowerSet.add(flower);

     const li=document.createElement("li");
     li.innerHTML=flower;
     flowers.appendChild(li);

     clear();

});