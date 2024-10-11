document.getElementById('cadastroForm').addEventListener('submit', function(event) {
    event.preventDefault();
    let nome = document.getElementById('nome').value;
    let email = document.getElementById('email').value;
    let telefone = document.getElementById('telefone').value;

    if (nome === '' || email === '' || telefone === '') {
        alert('Por favor, preencha todos os campos.');
    } else {
        alert('Cadastro realizado com sucesso!');
        // Aqui você pode adicionar o código para enviar os dados para o servidor
    }
    
});
