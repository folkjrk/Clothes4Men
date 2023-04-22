/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
    var CompleteCart = sessionStorage.getItem('cartModal');
    var cartArray = JSON.parse(CompleteCart);
    if (sessionStorage.clickcount)
    { 
        document.getElementById("AddProduct").innerHTML = sessionStorage.clickcount;
    }
    else
    {
        document.getElementById("AddProduct").innerHTML = 0;
    }

    if (cartArray !== null && cartArray.length !== 0) {     
        var grandTotal =0;
        var subTotal = 0;  
        var output = "";
        var outputhidden ="";
        var i = Object.keys(cartArray).length;
        for(var i in cartArray) { 
                subTotal = cartArray[i].Count * cartArray[i].Price;
                grandTotal += subTotal;
                output +=  '<tr>'+
                          '<td class="w-25" >'+
                            '<img src="'+ cartArray[i].Source +'" class="img-fluid img-thumbnail" alt="checkout_img">'+
                          '</td>'+
                          '<td>'+cartArray[i].Product_Name+'</td>'+
                          '<td>'+cartArray[i].Count+'</td>'+
                          '<td></td>'+
                           '<td class="text-center" >'+'£'+subTotal+'</td>'+
                        '</tr>';
                                }                       
        $('#show-grandTotal').html("£" +grandTotal);  
        $('#show-finalcart').html(output);   
    }
     $('#CheckoutForm').submit(function (event) {
        
        event.preventDefault();

        var CompleteCart = sessionStorage.getItem('cartModal');
        var cartArray = JSON.parse(CompleteCart);
        $('#hidden-input').val(CompleteCart);
       
        this.submit();
    });
});


function isValidVisaCardNumber(cardNumber) {
  // Remove any spaces or dashes from the card number
  cardNumber = cardNumber.replace(/[ -]/g, '');

  // Check that the card number is exactly 10 digits
  if (cardNumber.length !== 16) {
    return false;
  }

  // Check that the card number starts with a 4 (Visa card prefix)
  if (cardNumber.charAt(0) !== '4') {
    return false;
  }

  // Apply the Luhn algorithm to the card number
  var sum = 0;
  for (var i = 0; i < 16; i++) {
    var digit = parseInt(cardNumber.charAt(i), 10);
    if (i % 2 === 0) {
      digit *= 2;
      if (digit > 9) {
        digit -= 9;
      }
    }
    sum += digit;
  }

  // The card number is valid if the sum is a multiple of 10
  return (sum % 10 === 0);
}




