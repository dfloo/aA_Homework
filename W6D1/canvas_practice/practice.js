document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillstyle = 'red';
  ctx.fillRect(0, 0, 500, 500);


  ctx.beginPath();
  ctx.arc(250, 250, 25, 0, 2*Math.PI);
  ctx.strokeStyle = "yellow";
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();
  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.moveTo(110, 75);
  ctx.arc(75, 75, 35, 0, Math.PI, false);  // Mouth (clockwise)
  ctx.moveTo(65, 65);
  ctx.arc(60, 65, 5, 0, Math.PI * 2, true);  // Left eye
  ctx.moveTo(95, 65);
  ctx.arc(90, 65, 5, 0, Math.PI * 2, true);  // Right eye
  ctx.stroke();
});
