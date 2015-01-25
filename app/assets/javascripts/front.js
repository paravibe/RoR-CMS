google.load("visualization", "1.1", {packages:["bar"]});
google.setOnLoadCallback(initChart);

$(window).on("resize", function (event) {
  initChart();
});

function initChart() {
  var data = google.visualization.arrayToDataTable([
    [
      'Drupal',
      'PHP',
      'SQL',
      'jQuery',
      'CSS',
      'HTML',
      'AJAX',
      'Git',
      'Apache',
      'Solr',
      'Github',
      'JIRA',
      'Confluence',
      'Scrum',
      'Kanban',
      'Intellij IDEA',
      'Redmine',
      'Basecamp',
      'Java',
      'Android Development'
    ],
    [
      90,
      80,
      90,
      40,
      30,
      60,
      70,
      20,
      10,
      20,
      80,
      50,
      50,
      90,
      50,
      70,
      50,
      30,
      20,
      50,
    ],
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