function ticket_sale(){
var endpoint = '../ticketing/api/ticket_data/'
$.ajax({
type: "get",
url:endpoint,
dataType: 'json',
success: function(data){
var defaultLabels=[]
var defaultData=[]
for(var i=0; i<data.length; i++)
{
defaultLabels.push(data[i].applied_date);
defaultData.push(data[i].tickets);
}
var ctx = document.getElementById('ticketChart');
var myChart=new Chart(ctx,{
type:'doughnut',
data:{
labels:defaultLabels,
datasets: [{
            label: 'Date Wise Weekly Ticket Sale',
            data: defaultData,
            backgroundColor: [
                "#FF0000",
                "#00FF00",
                "#0000FF",
                "#800000",
                "#FF00FF",
                "#800080",
                "#AFB080",
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                '"#AFB080",',
            ],
            borderWidth: 1
             }],
            }

});
}
})

}
function purchase_data(){
var endpoint = '../purchase/api/purchase_data/'
$.ajax({
type: "get",
url:endpoint,
dataType: 'json',
success: function(data){
var defaultLabels=[]
var defaultData=[]
for(var i=0; i<data.length; i++)
{
defaultLabels.push(data[i].entry_date);
defaultData.push(data[i].amount);
}
var ctx = document.getElementById('purchaseChart');
var myChart=new Chart(ctx,{
type:'horizontalBar',
data:{
labels:defaultLabels,
datasets: [{
            label: 'Date Wise Last 7 Days Purchase Info',
            data: defaultData,
            backgroundColor: [
               "#FF0000",
                "#00FF00",
                "#0000FF",
                "#800000",
                "#FF00FF",
                "#800080",
                "#AFB080",
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
             }],
            },
            options: {
        scales: {
            xAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        },
        maintainAspectRation:true
    }

});
}
})

}