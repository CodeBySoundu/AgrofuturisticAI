// ================= SECTION SWITCH =================
function showSection(el, section) {
  document.getElementById("dashboard").classList.add("hidden");
  document.getElementById("analytics").classList.add("hidden");
  document.getElementById("history").classList.add("hidden");

  document.getElementById(section).classList.remove("hidden");

  document.querySelectorAll(".sidebar li").forEach(li => li.classList.remove("active"));
  el.classList.add("active");

  loadData();

  setTimeout(() => {
    chart.update();
    cropChart.update();
    statusChart.update();
  }, 200);
}


// ================= PREDICTION =================
function predict() {

  const m = document.getElementById("moisture").value;
  const t = document.getElementById("temp").value;
  const crop = document.getElementById("crop").value;
  const soil = document.getElementById("soil").value;
  const rain = document.getElementById("rain").value;

  if (!m || !t) {
    alert("Please enter moisture and temperature");
    return;
  }

  let result="", desc="", rec="", reasons=[];
  let confidence = Math.floor(80 + Math.random()*10);

  if (m < 30 && rain == 0) {
    result="High Irrigation";
    desc="Immediate irrigation required.";
    rec="Start irrigation";
    reasons=["Very low moisture","No rain expected","Crop needs water"];
  } 
  else if (m < 40) {
    result="Moderate Irrigation";
    desc="Irrigation recommended.";
    rec="Monitor soil";
    reasons=["Low moisture","Rain expected","Moderate need"];
  } 
  else {
    result="Low Irrigation";
    desc="No irrigation needed.";
    rec="No action";
    reasons=["Enough moisture","Water retained","Rain helps"];
  }

  // UI Update
  document.getElementById("resultText").innerText = result;
  document.getElementById("desc").innerText = desc;
  document.getElementById("recommend").innerText = rec;
  document.getElementById("confidence").innerText = confidence + "%";

  document.getElementById("moistureVal").innerText = m + "%";
  document.getElementById("tempVal").innerText = t + "°C";
  document.getElementById("statusVal").innerText = result;

  const ul = document.getElementById("reasons");
  ul.innerHTML = "";
  reasons.forEach(r => ul.innerHTML += `<li>${r}</li>`);

  // ================= SAVE =================
  fetch("../backend/save_data.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams({
      moisture: m,
      temperature: t,
      crop: crop,
      soil: soil,
      rain: rain,
      result: result,
      recommendation: rec,
      confidence: confidence
    })
  })
  .then(res => res.text())
  .then(data => {
    console.log("SERVER:", data);
    loadData(); // refresh after save
  })
  .catch(err => console.error("Fetch Error:", err));
}


// ================= CHART =================
const chart = new Chart(document.getElementById("chart"), {
  type: 'line',
  data: {
    labels: [],
    datasets: [{
      label: 'Moisture',
      data: [],
      borderColor: '#22c55e',
      tension: 0.3
    }]
  }
});


// ================= ANALYTICS =================
const cropChart = new Chart(document.getElementById("cropChart"), {
  type: 'pie',
  data: {
    labels: [],
    datasets: [{ data: [] }]
  }
});

const statusChart = new Chart(document.getElementById("statusChart"), {
  type: 'bar',
  data: {
    labels: ["High", "Moderate", "Low"],
    datasets: [{ label: "Count", data: [0,0,0] }]
  }
});


// ================= LOAD DATA (FINAL FIXED) =================
function loadData() {
  fetch("../backend/fetch_data.php")
    .then(res => res.json())
    .then(res => {

      console.log("FULL RESPONSE:", res);

      if (!res || !res.data) {
        console.error("No data received");
        return;
      }

      const data = res.data;

      const table = document.getElementById("table");
      const history = document.getElementById("historyTable");

      if (!table || !history) return;

      table.innerHTML = "";
      history.innerHTML = "";

      const labels = [];
      const moistureData = [];

      let total = 0;
      let moistureSum = 0;

      let cropCount = {};
      let statusCount = {
        "High Irrigation": 0,
        "Moderate Irrigation": 0,
        "Low Irrigation": 0
      };

      data.forEach(row => {

        if (!row) return;

        total++;

        const rowHTML = `
          <tr>
            <td>${row.moisture}%</td>
            <td>${row.temperature}°C</td>
            <td>${row.crop}</td>
            <td>${row.rain_expected}</td>
            <td>${row.irrigation_result}</td>
          </tr>`;

        table.innerHTML += rowHTML;
        history.innerHTML += rowHTML;

        labels.push(row.created_at);
        moistureData.push(Number(row.moisture));

        moistureSum += Number(row.moisture);

        cropCount[row.crop] = (cropCount[row.crop] || 0) + 1;

        if (statusCount[row.irrigation_result] !== undefined) {
          statusCount[row.irrigation_result]++;
        }
      });

      // KPIs
      document.getElementById("totalRecords").innerText = total;
      document.getElementById("avgMoisture").innerText =
        total ? Math.round(moistureSum / total) + "%" : "0%";

      // Charts
      chart.data.labels = labels;
      chart.data.datasets[0].data = moistureData;
      chart.update();

      cropChart.data.labels = Object.keys(cropCount);
      cropChart.data.datasets[0].data = Object.values(cropCount);
      cropChart.update();

      statusChart.data.datasets[0].data = [
        statusCount["High Irrigation"],
        statusCount["Moderate Irrigation"],
        statusCount["Low Irrigation"]
      ];
      statusChart.update();

    })
    .catch(err => console.error("Fetch error:", err));
}


// ================= INIT =================
window.onload = function () {
  loadData();
};
