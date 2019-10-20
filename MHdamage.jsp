
<html>
<head>
    <title>MHdamage</title>
</head>
<body>

<div>
    选择武器:<select id="rate">
    <option value ="0"></option>
    <option value ="1.2">弓</option>
    <option value ="3.3">太刀</option>
    <option value ="4.8">大剑</option>
    <option value ="3.6">盾斧</option>
    <option value ="1.4">片手剑</option>
    <option value ="1.4">双刀</option>
    <option value ="5.2">大锤</option>
    <option value ="4.2">狩猎笛</option>
    <option value ="2.3">长枪</option>
    <option value ="2.3">铳枪</option>
    <option value ="3.5">斩击斧</option>
    <option value ="3.1">操虫棍</option>
    <option value ="1.3">轻弩</option>
    <option value ="1.5">重弩</option>
</select>
    <br>
    武器攻击:<input type="number" id="initial_atk" >
    &nbsp&nbsp&nbsp
    武器会心:<input type="number" id="initial_crit" >%
    <br>猫饭:<select id="meal">
    <option value ="0">无</option>
    <option value ="5">攻小</option>
    <option value ="10">攻中</option>
    <option value ="15">攻大</option>
</select>
 &nbsp&nbsp&nbsp&nbsp
不屈:<select id="Unyielding">
    <option value ="1">无</option>
    <option value ="1.1">1猫</option>
    <option value ="1.21">2猫</option>
</select>
    <br>道具使用：
    <input type="checkbox" id="drug" value="5" />鬼人药 &nbsp&nbsp&nbsp&nbsp
    <input type="checkbox" id="drugG" value="7" />鬼人药G &nbsp&nbsp&nbsp&nbsp
    <input type="checkbox" id="seed" value="10" />鬼人种子 &nbsp&nbsp&nbsp&nbsp
    <input type="checkbox" id="dust" value="10" />鬼人粉尘 &nbsp&nbsp&nbsp&nbsp
    <br>技能<br>
    斩味（远程武器请勿选择）:<select id="sharpness">
    <option value ="1">（默认黄斩）</option>
    <option value ="1.39">紫</option>
    <option value ="1.32">白</option>
    <option value ="1.2">蓝</option>
    <option value ="1.05">绿</option>
    <option value ="1">黄</option>
    <option value ="0.75">橙</option>
    <option value ="0.5">红</option>
</select><br>
    无击:<select id="non_elemental">
    <option value ="100">无</option>
    <option value ="105">有</option>
</select>&nbsp&nbsp&nbsp
    攻击:<select id="add_atk">
    <option value ="0">无</option>
    <option value ="3">1</option>
    <option value ="6">2</option>
    <option value ="9">3</option>
    <option value ="12">4</option>
    <option value ="15">5</option>
    <option value ="18">6</option>
    <option value ="21">7</option>
</select>
    &nbsp&nbsp&nbsp
    无伤:<select id="add_atk2">
    <option value ="0">无</option>
    <option value ="5">1</option>
    <option value ="10">2</option>
    <option value ="20">3</option>
</select>
    <br>
    看破:<select id="add_crit">
    <option value ="0">无</option>
    <option value ="5">1</option>
    <option value ="10">2</option>
    <option value ="15">3</option>
    <option value ="20">4</option>
    <option value ="25">5</option>
    <option value ="30">6</option>
    <option value ="40">7</option>
</select>
    &nbsp&nbsp&nbsp
    弱点特效:<select id="add_crit2">
    <option value ="0">无</option>
    <option value ="15">1软化</option>
    <option value ="30">2软化</option>
    <option value ="50">3软化</option>
    <option value ="10">1</option>
    <option value ="15">2</option>
    <option value ="30">3</option>
</select>
    &nbsp&nbsp&nbsp
    精神抖擞:<select id="add_crit3">
    <option value ="0">无</option>
    <option value ="10">1</option>
    <option value ="20">2</option>
    <option value ="30">3</option>
</select>
    <br>

    超会心:<select id="crit_rate">
    <option value ="125">无</option>
    <option value ="130">1</option>
    <option value ="135">2</option>
    <option value ="140">3</option>
</select>

    <br><br>
    <button onclick="damage()">计算</button>
</div>
<br><br>仅适用物理部分<br>
攻击期望：<span id="final_damage"></span> <br>
<div id="damage_write" style="display:none">
    <button onclick="damage_record()" >记录结果</button><br>
</div>
<div id="compare" style="display:none">
    记录伤害：<span id="last_damage">0</span><br>
    较记录伤害期望变化: <span id="change_damage"></span>
</div>
    
<script >
    var write_damage = 0
    var final_damage = 0
    var change_damage = 0
    function damage() {
        var rate = document.getElementById("rate").value
        var initial_atk = document.getElementById("initial_atk").value;
        var initial_crit = document.getElementById("initial_crit").value;

        var sharpness = document.getElementById("sharpness").value;
        var non_elemental = document.getElementById("non_elemental").value;

        var add_crit = document.getElementById("add_crit").value;
        var add_crit2 = document.getElementById("add_crit2").value;
        var add_crit3 = document.getElementById("add_crit3").value;

        var add_atk = document.getElementById("add_atk").value;
        var add_atk2 = document.getElementById("add_atk2").value;

        var crit_rate = document.getElementById("crit_rate").value;
        
        var meal = document.getElementById("meal").value
        var Unyielding = document.getElementById("Unyielding").value
        
        var drug_atk = 0;     
        var drug = document.getElementById("drug");
        if(drug.checked){
            drug_atk = Number(drug_atk) + Number(drug.value);
        }
         var drugG = document.getElementById("drugG");
        if(drugG.checked){
            drug_atk = Number(drug_atk) + Number(drugG.value);
        }
         var seed = document.getElementById("seed");
        if(seed.checked){
            drug_atk = Number(drug_atk) + Number(seed.value);
        }
        var dust = document.getElementById("dust");
        if(dust.checked){
            drug_atk = Number(drug_atk) + Number(dust.value);
        }
          
        if(rate==0) {
            alert("请选择武器");
        }
        else {
            var all_atk = Number(initial_atk) *Number(Unyielding) *Number(non_elemental)/100 / Number(rate) + Number(add_atk) + Number(add_atk2) + Number(meal) + Number(drug_atk);
            var all_crit = Number(initial_crit) + Number(add_crit) + Number(add_crit2) + Number(add_crit3);
            if(add_atk >= 12) {
                all_crit = all_crit + 5;
            }
            if(all_crit >= 100){
                all_crit = 100 ;
            }
            if(all_crit < 0 && all_crit >=-100){
                crit_rate = 75;
                all_crit = - all_crit;
            }
            if(all_crit <-100)
            {
                crit_rate = 75
                all_crit = 100
            }

            final_damage = ( Number(all_atk * all_crit * crit_rate / 10000) + Number(all_atk * (100-all_crit) / 100)) * sharpness;
            final_damage = Math.round(final_damage*100)/100
            change_damage = final_damage - write_damage
            change_damage = Math.round(change_damage*100)/100

            document.getElementById("final_damage").innerText = final_damage;

            document.getElementById("damage_write").style.display="block"

            document.getElementById("change_damage").innerText = change_damage;

        }
    }

        function damage_record() {
            document.getElementById("compare").style.display="block"
            write_damage = final_damage
            document.getElementById("last_damage").innerText = write_damage;
        }


</script>

</body>
</html>
