
<html>
  <head>
    <title>$Title$</title>
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
    武器攻击:<input type="text" id="initial_atk" >
    &nbsp&nbsp&nbsp
    武器会心:<input type="text" id="initial_crit" >%
    <br>技能<br>
      斩味:<select id="sharpness">
      <option value ="1">无（默认绿斩）</option>
      <option value ="1.32">白</option>
      <option value ="1.2">蓝</option>
      <option value ="1.05">绿</option>
      <option value ="1">黄</option>
      <option value ="0.75">橙</option>
      <option value ="0.5">红</option>
  </select>&nbsp&nbsp&nbsp
      无击:<select id="non_elemental">
      <option value ="100">无</option>
      <option value ="110">有</option>
  </select><br>
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
      <option value ="3">1</option>
      <option value ="6">2</option>
      <option value ="10">3</option>
      <option value ="15">4</option>
      <option value ="20">5</option>
      <option value ="25">6</option>
      <option value ="30">7</option>
  </select>
      &nbsp&nbsp&nbsp
      弱点特效:<select id="add_crit2">
      <option value ="0">无</option>
      <option value ="15">1</option>
      <option value ="30">2</option>
      <option value ="50">3</option>
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
  攻击期望：<p>0</p>

  <script >
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

          if(rate==0) {
              alert("请选择武器");
          }
          else {
              var all_atk = Number(initial_atk) * Number(non_elemental)/100 / Number(rate) + Number(add_atk) + Number(add_atk2);
              var all_crit = Number(initial_crit) + Number(add_crit) + Number(add_crit2) + Number(add_crit3);
              if(add_atk >= 12) {
                  all_crit = all_crit + 5;
              }
              if(all_crit >= 100){
                  all_crit = 100 ;
              }
              if(all_crit <= 0){
                  crit_rate = 75;
                  all_crit = - all_crit;
              }

              var damage = 0;
              damage = ( Number(all_atk * all_crit * crit_rate / 10000) + Number(all_atk * (100-all_crit) / 100)) * sharpness;
              damage = Math.round(damage*100)/100

              var mydamage = document.querySelector('p');
              mydamage.textContent =  damage;
          }

      }
  </script>

  </body>
</html>
