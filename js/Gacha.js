
var Gacha_count = 0
var SSR_count = 0
var drop_rate = 0
/*
function dream() {
    var dream_rate = document.getElementById("ssr").value
    if (dream_rate > 6)
    {
        alert("做梦呢？")
        document.getElementById("ssr").value = "6"
    }
}
*/
function input_get() {
    var ssr_rate = document.getElementById("ssr").value
    var sr_rate = 0
    var sum_rate = Number(ssr_rate) + Number(sr_rate)
    return [ssr_rate,sr_rate,sum_rate]
}
function input_confirm() {
    var info = input_get()
    var ssr_rate = info[0]
    var sr_rate = info[1]
    var sum_rate = info[2]
    var gacha_stop = 0
    if (ssr_rate<0 || sr_rate<0 || sum_rate>100) {
        alert("请正确输入概率")
        gacha_stop = 1;
        return gacha_stop;
    }
}
function get_rare() {
    var info = input_get()
    var ssr_rate = info[0]
    var sum_rate = info[2]
    ssr_rate = ssr_rate * 100
    var cardrare = 0
    var roll = random(1,10000)
    if (roll <= ssr_rate) {
        cardrare = "SSR"
    }
    else if (roll > ssr_rate && roll <= sum_rate) {
        cardrare = "SR"
    }
    else if (roll > sum_rate){
        cardrare = "R"
    }
    return cardrare
}

function ssr_num(){
    var num = random(1,202)
    return num
}

function img_get(i) {
    var getrare = get_rare()
    var getnum = 0
    var card_path = 0
    var card_path_get = 0
    if(getrare == "SSR"){
        getnum = ssr_num()
        card_path = "img/SSR"+getnum+".jpg"
    }
    if(getrare == "SSR"){
        SSR_count++
        document.getElementsByTagName("img")[i].setAttribute("src",card_path);
    }
    if(getrare != "SSR"){
        document.getElementsByTagName("img")[i].setAttribute("src","img/R.jpg")
    }
}

function gacha_clear(){
    var i = 0
    for(i=0;i<10;i++){
        document.getElementsByTagName("img")[i].setAttribute("src","img/null.png")
    }
}

function show_count(){
    document.getElementById("count").style.display="block"
}
function add_count() {
    drop_rate = SSR_count/Gacha_count*100
    drop_rate = drop_rate.toFixed(2)
    document.getElementById("Gacha_count").innerText = Gacha_count
    document.getElementById("SSR_count").innerText = SSR_count
    document.getElementById("drop_rate").innerText = drop_rate
}
function  gacha_warn(times) {
    var add = Number(times)
    var last_count = Number(Gacha_count)
    add = add + last_count
    if(last_count<300 ){
        if(add>=300){
            alert("一井了还没抽到，你是真的非")
        }
    }
}
function gacha_once() {
    var istop = input_confirm()
    if(istop == 1)
    {
        return
    }
    gacha_clear()
    var gacha_get = document.querySelector('p')
    gacha_get.innerText = "结果"
    var i = 0
    img_get(i)
    gacha_warn(1)
    Gacha_count++
    show_count()
    add_count()
}

function gacha_ten() {
    var istop = input_confirm()
    if(istop == 1)
    {
        return
    }
    gacha_clear()
    var gacha_get = document.querySelector('p')
    gacha_get.innerText = "结果"
    var i = 0
    for(i=0;i<10;i++){
        img_get(i)
    }
    gacha_warn(10)
    Gacha_count = Gacha_count + 10
    show_count()
    add_count()
}

//lower下限  upper上限
function random(lower, upper) {
    return Math.floor(Math.random() * (upper - lower + 1)) + lower;
}
