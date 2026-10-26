function predict() {
  const m = document.getElementById("moisture").value;
  const t = document.getElementById("temp").value;
  const crop = document.getElementById("crop").value;
  const rain = document.getElementById("rain").value;

  let result="", desc="", rec="", reasons=[];

  if (m < 30 && rain == 0) {
    result="High Irrigation";
    desc="Immediate irrigation required.";
    rec="Start irrigation";
    reasons=["Very low moisture","No rain expected","Crop needs water"];
  } else if (m < 40) {
    result="Moderate Irrigation";
    desc="Irrigation recommended.";
    rec="Monitor soil";
    reasons=["Low moisture","Rain expected","Moderate need"];
  } else {
    result="Low Irrigation";
    desc="No irrigation needed.";
    rec="No action";
    reasons=["Enough moisture","Water retained","Rain helps"];
  }

  document.getElementById("resultText").innerText=result;
  document.getElementById("desc").innerText=desc;
  document.getElementById("recommend").innerText=rec;
  document.getElementById("confidence").innerText=(80+Math.random()*10).toFixed(0)+"%";

  document.getElementById("moistureVal").innerText=m+"%";
  document.getElementById("tempVal").innerText=t+"°C";
  document.getElementById("statusVal").innerText=result;

  const ul=document.getElementById("reasons");
  ul.innerHTML="";
  reasons.forEach(r=> ul.innerHTML+=`<li>${r}</li>`);

  document.getElementById("table").innerHTML+=`
    <tr>
      <td>${m}%</td>
      <td>${t}°C</td>
      <td>${crop}</td>
      <td>${rain==1?"Yes":"No"}</td>
      <td>${result}</td>
    </tr>`;
}

/* Chart */
new Chart(document.getElementById("chart"), {
  type: 'line',
  data: {
    labels:['Apr16','Apr17','Apr18','Apr19','Apr20'],
    datasets:[{
      label:'Moisture',
      data:[70,60,50,55,45],
      borderColor:'#22c55e'
    }]
  }
});