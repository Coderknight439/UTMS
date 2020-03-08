function ticket_payment(){
$('#id_payment_type').change(function(){
var type = $('#id_payment_type').val();
if(type=='1'){
document.getElementById('submit_line').innerHTML += "<input type='submit' name='checkout' class='btn btn-high btn-success' style='width:127px' value='Checkout'>"
}
}).change();
}

function paymentProcess(){
var form = document.querySelector('#payment');
var submit = document.querySelector('input[type="submit"]');
braintree.client.create({
authorization: '{{ client_token }}'
}, function (clientErr, clientInstance) {
if (clientErr) {
console.error(clientErr);
return;
}
braintree.hostedFields.create({
client: clientInstance,
styles: {
'input': {'font-size': '13px'},
'input.invalid': {'color': 'red'},
'input.valid': {'color': 'green'}
},
fields: {
number: {selector: '#card-number'},
cvv: {selector: '#cvv'},
expirationDate: {selector: '#expiration-date'}
}
}, function (hostedFieldsErr, hostedFieldsInstance) {
if (hostedFieldsErr) {
console.error(hostedFieldsErr);
return;
}
submit.removeAttribute('disabled');
form.addEventListener('submit', function (event) {
event.preventDefault();
hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
if (tokenizeErr) {
console.error(tokenizeErr);
return;
}
// set nonce to send to the server
document.getElementById('nonce').value = payload.nonce;
// submit form
document.getElementById('payment').submit();
});
}, false);
});
});
}