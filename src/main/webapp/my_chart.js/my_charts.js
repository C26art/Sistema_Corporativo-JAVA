/**
 * 
 */
 const ctx = document.getElementById('myChart').getContext('2d');
const earning = document.getElementById('earning').getContext('2d');
const learning = document.getElementById('learning').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'polarArea',
    data: {
        labels: ['Camisas', 'Bermudas', 'Vestidos'],
        datasets: [{
            label: 'Estoque',
            data: [1200, 1900, 3000],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',                
            ],
           
        }]
    },
    options: {
        responsive: true,

    }
});
const myChar= new Chart(earning, {
    type: 'bar',
    data: {
        labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto','Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        
        datasets: [{
            label: '#Vendas',
            data: [5200, 3000, 2300, 1500, 2100, 4000, 6000, 3100, 2200, 2800, 4032, 8000],
            backgroundColor: [                
                'rgba(255, 99, 132, 1)',
                'rgba(265, 32, 135, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(155, 132, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(753, 122, 255, 1)',
                'rgba(25, 59, 624, 1)',
                'rgba(175, 492, 598, 1)',
                'rgba(15, 142, 225, 1)',
                'rgba(20, 259, 164, 1)'
            ],
         
        }]
    },
    options: {
        responsive: true,

    }
});

const myChart2 = new Chart(learning, {
    type: 'bar',
    data: {
        labels: [ 'Crédito', 'Débito', 'Dinheiro'],
        datasets: [{
            label: '# Forma de Pagamento',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [                
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [               
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,

    }
});
