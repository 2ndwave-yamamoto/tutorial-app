const text = document.querySelector('#input-text');
window.addEventListener('load', () => {
  const count = text.value.length;
  document.querySelector('#counter').textContent = count + "文字";
});
text.addEventListener('keyup', () => {
  const count = text.value.length;
  document.querySelector('#counter').textContent = count + "文字";
});
