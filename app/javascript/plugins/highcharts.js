import Highcharts from 'highcharts';
require("highcharts/modules/data")(Highcharts)
require("highcharts/modules/exporting")(Highcharts)
require("highcharts/modules/accessibility")(Highcharts)

// Radialize the colors
Highcharts.setOptions({
    colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
      return {
        radialGradient: {
          cx: 0.5,
          cy: 0.3,
          r: 0.7
        },
        stops: [
          [0, color],
          [1, Highcharts.color(color).brighten(-0.6).get('rgb')] // darken
        ]
      };
    }),
    plotOptions: {
      pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          depth: 35,
          dataLabels: {
              enabled: true,
              format: '{point.name}',
              style: {
                    color: "(Highcharts.theme && Highcharts.theme.contrastTextColor) || 'red'".js_code
              },
              connectorColor: 'silver'
          }
      }
  }
  });

window.Highcharts = Highcharts;