document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas'); // in your HTML this element appears as <canvas id="myCanvas"></canvas>
  const ctx = canvas.getContext('2d');
  canvas.width = 500;
  canvas.height = 500;

  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fillRect(10, 10, 55, 50);

  ctx.beginPath();
  ctx.arc(100, 100, 100, 0, 2*Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 1;
  ctx.stroke();

  ctx.fillStyle = "red";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(75, 50);
  ctx.lineTo(100, 75);
  ctx.lineTo(100, 25);
  ctx.lineTo(75, 50);
  ctx.fillStyle = "blue";
  ctx.fill();
  ctx.stroke();
});
