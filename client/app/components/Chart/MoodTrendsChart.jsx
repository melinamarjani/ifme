// client/app/components/Chart/MoodTrendsChart.jsx
import React, { useEffect, useRef } from 'react';
import Chart from 'chart.js/auto';

const MoodTrendsChart = ({ data }) => {
  const chartRef = useRef(null);
  const chartInstanceRef = useRef(null);

  useEffect(() => {
    if (chartInstanceRef.current) {
      chartInstanceRef.current.destroy();
    }

    const ctx = chartRef.current.getContext('2d');

    chartInstanceRef.current = new Chart(ctx, {
      type: 'line',
      data: {
        labels: data.map(entry => entry.date),
        datasets: [{
          label: 'Mood Score',
          data: data.map(entry => entry.score),
          fill: false,
          tension: 0.1,
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            title: {
              display: true,
              text: 'Mood Score'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Date'
            }
          }
        }
      }
    });
  }, [data]);

  return <canvas ref={chartRef}></canvas>;
};

export default MoodTrendsChart;
