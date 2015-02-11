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

(function($) {
  $(window).load(function(){
    $(window).scroll(function() {
      var offset = $(this).scrollTop();
      if (offset >= 100) {
        $('nav.navbar').addClass('background');
      }
      else if (offset < 100) {
        $('nav.navbar').removeClass('background');
      }
    });

    $('a[href*=#]:not([href=#])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html,body').animate({
            scrollTop: target.offset().top - 50
          }, 700);
          return false;
        }
      }
    });
  });
})(jQuery);