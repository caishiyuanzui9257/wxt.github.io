document.getElementById('registerForm').addEventListener('submit', function (e) {
  e.preventDefault();
  const newUsername = document.getElementById('newUsername').value;
  const newPassword = document.getElementById('newPassword').value;
  const confirmPassword = document.getElementById('confirmPassword').value;
  const email = document.getElementById('email').value;
  const phone = document.getElementById('phone').value;
  const registerErrorMessage = document.getElementById('register-error-message');

  if (newPassword!== confirmPassword) {
    registerErrorMessage.innerText = '������������벻һ��';
    return;
  }

  // ����������ʵ�ʵ�ע���߼������緢��AJAX���󵽺��
  // ����ģ��һ���򵥵���֤
  if (newUsername && newPassword && email && phone) {
    alert('ע��ɹ���');
    // �����������߼���ת����¼ҳ�������������
  } else {
    registerErrorMessage.innerText = '����д���б�����';
  }
});