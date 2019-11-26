"use strict";
{
const div = document.querySelector('div');

  document.addEventListener('mousemove', e => {
    div.textContent = `${e.clientX}:${e.clientY}`;
  });
}