// 生成验证码
function generateCaptcha() {
  const captchaLength = 4;
  const characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  let captcha = '';
  for (let i = 0; i < captchaLength; i++) {
    captcha += characters.charAt(Math.floor(Math.random() * characters.length));
  }
  document.getElementById('captcha-container').innerText = captcha;
  return captcha;
}

// 验证登录信息
document.getElementById('loginForm').addEventListener('submit', function (e) {
  e.preventDefault();
  const username = document.getElementById('username').value;
  const password = document.getElementById('password').value;
  const captchaInput = document.getElementById('captcha').value;
  const captcha = generateCaptcha();
  const errorMessage = document.getElementById('error-message');
  if (captchaInput === captcha) {
    // 这里可以添加实际的登录验证逻辑，比如发送AJAX请求到后端
    // 假设模拟一个简单的验证
    if (username === 'admin' && password === 'admin123') {
      alert('登录成功！');
    } else {
      errorMessage.innerText = '用户名或密码错误';
    }
  } else {
    errorMessage.innerText = '验证码错误';
  }
});

window.onload = function () {
  generateCaptcha();
};