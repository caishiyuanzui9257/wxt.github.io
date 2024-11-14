document.getElementById('registerForm').addEventListener('submit', function (e) {
  e.preventDefault();
  const newUsername = document.getElementById('newUsername').value;
  const newPassword = document.getElementById('newPassword').value;
  const confirmPassword = document.getElementById('confirmPassword').value;
  const email = document.getElementById('email').value;
  const phone = document.getElementById('phone').value;
  const registerErrorMessage = document.getElementById('register-error-message');

  if (newPassword!== confirmPassword) {
    registerErrorMessage.innerText = '两次输入的密码不一致';
    return;
  }

  // 这里可以添加实际的注册逻辑，比如发送AJAX请求到后端
  // 假设模拟一个简单的验证
  if (newUsername && newPassword && email && phone) {
    alert('注册成功！');
    // 这里可以添加逻辑跳转到登录页面或者其他操作
  } else {
    registerErrorMessage.innerText = '请填写所有必填项';
  }
});