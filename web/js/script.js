let res = true;
let btn = document.querySelector("#edit-btn");
let update = document.querySelector("#table-update");
let edit = document.querySelector(".table-edit");
let changebtn=document.querySelector("#btn-edit");


btn.addEventListener("dblclick",()=>{
    if(res){    
    edit.classList.add("hidden");
    update.classList.remove("hidden");
    btn.innerHTML="Save";
    btn.setAttribute("type","submit");
    
        
    res=false;
    }else{
        edit.classList.remove("hidden");
    update.classList.add("hidden");
    btn.innerHTML="Edit";
    btn.setAttribute("type","button");
    res=true;
        
    }
    
});
let closebtn=document.querySelector("#close-btn");
closebtn.addEventListener("click",()=>{
    if(!res){
    update.classList.add("hidden");
    edit.classList.remove("hidden");
    btn.innerHTML="Edit";
    //btn.setAttribute("type","button");
    }
    res=true;
});
let cutbtn=document.querySelector("#closebtn");
cutbtn.addEventListener("click",()=>{
    if(!res){
    update.classList.add("hidden");
    edit.classList.remove("hidden");
    btn.innerHTML="Edit";
   // btn.setAttribute("type","button");
    }
    res=true;
});

    
    



