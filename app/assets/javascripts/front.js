google.load("visualization", "1.1", {packages:["bar"]});
google.setOnLoadCallback(initChart);

$(window).on("resize", function (event) {
  initChart();
});

function initChart() {
  var data = google.visualization.arrayToDataTable([
    gon.skills_keys,
    gon.skills_values,
  ]);

  var options = {
    bars: 'horizontal',
    title: '',
    height: 300,
    legend: {
      position: 'none'
    }
  };

  drawChart(data, options);
}

function drawChart(data, options) {
  var chart = new google.charts.Bar(document.getElementById('skills-chart'));
  chart.draw(data, options);
}