
function show1(){
    if(document.getElementById("textName")!=null){
        document.getElementById("textName").remove();
    }
    let div1=document.getElementById('name')
    let label=document.createElement('label');
    let input=document.createElement('input');
    input.setAttribute('type','text');
    input.setAttribute('name','textName');
    input.setAttribute('placeholder','請輸入健身房名稱');
    input.setAttribute('required','');
    label.setAttribute('id','textName');
    label.appendChild(input);
    div1.appendChild(label);
}
function show2(){
    if(document.getElementById("textAddress")!=null){
        document.getElementById("textAddress").remove();
    }
    let div2=document.getElementById('address')
    let label=document.createElement('label');
    let input=document.createElement('input');
    input.setAttribute('type','text');
    input.setAttribute('name','textAddress');
    input.setAttribute('placeholder','請輸入健身房地址');
    input.setAttribute('required','');
    label.setAttribute('id','textAddress');
    label.appendChild(input);
    div2.appendChild(label);
}
function show3(){
    if(document.getElementById("textOpenHours")!=null){
        document.getElementById("textOpenHours").remove();
    }
    let div3=document.getElementById('openHours')
    let label=document.createElement('label');
    let input=document.createElement('input');
    input.setAttribute('type','text');
    input.setAttribute('name','textOpenHours');
    input.setAttribute('placeholder','請輸入24小時制 如：06:00-00:00');
    input.setAttribute('required','');
    label.setAttribute('id','textOpenHours');
    label.appendChild(input);
    div3.appendChild(label);
}
function hide1(){
    let div1=document.getElementById('name')
    if (document.getElementById('textName')!=null) {
        div1.removeChild(document.getElementById('textName'));
    }
}
function hide2(){
    let div2=document.getElementById('address')
    if (document.getElementById('textAddress')!=null) {
        div2.removeChild(document.getElementById('textAddress'));
    }
}
function hide3(){
    let div3=document.getElementById('openHours')
    if (document.getElementById('textOpenHours')!=null) {
        div3.removeChild(document.getElementById('textOpenHours'));
    }
}
