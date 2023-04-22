/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global bootstrap, modalWrap, btn, element */

$(document).ready(function () {
    if (sessionStorage.clickcount)
        document.getElementById("AddProduct").innerHTML = sessionStorage.clickcount;
    else
        document.getElementById("AddProduct").innerHTML = 0;
});

function clickAdd(product_Id, quantity, product_Name, price,source) {

    if (sessionStorage.clickcount) {
        sessionStorage.clickcount = Number(sessionStorage.clickcount) + 1;
    } else {
        sessionStorage.clickcount = 1;
    }

    document.getElementById("AddProduct").innerHTML = sessionStorage.clickcount;
    addList(product_Id, quantity, product_Name, price,source);
}

function addList(product_Id, quantity, product_Name, price,source) {
    
    var Product_Id = product_Id;
    var Quantity = quantity;
    var Product_Name = product_Name;
    var Price = price;
    var Count = 0;
    var Source = source;
    debugger;
    var CompleteCart = sessionStorage.getItem('cartModal');
    if (CompleteCart === null) {
        cartItem = {
            Product_Id: Product_Id,
            Quantity: Quantity - 1,
            Product_Name: Product_Name,
            Price: Price,
            Count: 1,
            Source: Source
        };
        cart = [];
        cart.push(cartItem);
        sessionStorage.setItem('cartModal', JSON.stringify(cart));
    } else {
        let pcart = JSON.parse(CompleteCart);
        
        let addProduct = pcart.find((item) => item.Product_Id === product_Id);
        if (addProduct) {
            addProduct.Quantity -= 1;
            addProduct.Count += 1;
            pcart.map((item) => {
                if (item.Product_Id === addProduct.Product_Id) {
                    item.Quantity = addProduct.Quantity;
                    item.Count = addProduct.Count;
                }
            });
            sessionStorage.setItem('cartModal',JSON.stringify(pcart));
        } else {
            cartItem = {
                Product_Id: Product_Id,
                Quantity: Quantity - 1,
                Product_Name: Product_Name,
                Price: Price,
                Count: 1,
                Source: Source
            };
            pcart.push(cartItem);
            sessionStorage.setItem('cartModal', JSON.stringify(pcart));
        }

    }
    console.log(CompleteCart);
}


function showCartTable() {
    
    let CompleteCart = sessionStorage.getItem('cartModal');
    var grandTotal = 0;    
    var subTotal = 0;
    var cartArray = JSON.parse(CompleteCart);
    if (cartArray !== null && cartArray.length !== 0) {     
            
        var output = "";
        var i = Object.keys(cartArray).length;
        for(var i in cartArray) { 
            subTotal = cartArray[i].Count * cartArray[i].Price;
            grandTotal += subTotal; 
            output +=  '<tr>'+
                          '<td class="w-25" >'+
                            '<img src="'+ cartArray[i].Source +'" class="img-fluid img-thumbnail" alt="checkout_img">'+
                          '</td>'+
                          '<td>'+cartArray[i].Product_Name+'</td>'+
                          '<td>'+cartArray[i].Price+'</td>'+
                          '<td>'+cartArray[i].Count+'</td>'+
                          '<td>'+subTotal+'</td>'+
                          '<td>'+
                            '<button class="btn btn-danger btn-sm" id="'+cartArray[i].Product_Id +'" onclick="clickRemoveItem('+ cartArray[i].Product_Id  +')"> '+
                                '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="trash" viewBox="0 0 16 16"> '+
                                '<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>'+
                                '<path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>'+
                                '</svg>'+
                            '</button>'+
                          '</td>'+
                        '</tr>';
                                } 
                                
                                
                        }
                        
    else{
        output +=   '<tr>'+
                        '<td class="-center" >'+
                        '<td> Your cart is emptry </td>'+
                        '</td>'+
                    '</tr>';
         
    }
    
    $('#show-grandTotal').html("£" +grandTotal);
    $('#show-cart').html(output);
}


function clickRemoveItem(Product_Id) {
    var Id = Product_Id;
    var removeCartButton = document.getElementById(Id);
    let CompleteCart = sessionStorage.getItem('cartModal');
    var cartArray = JSON.parse(CompleteCart);
    
    if (removeCartButton) {
            
            let obj = cartArray.find(obj => obj?.Product_Id === Id);
            if (obj !==undefined) {
                     
                    if (obj.Count > 0){                                            
                    
                    let index = cartArray.findIndex((item) => item.Product_Id === Id);
                    cartArray.splice(index, 1);
                    sessionStorage.setItem('cartModal',JSON.stringify(cartArray));
                    
                    removeCartButton.parentElement.parentElement.remove();
                    sessionStorage.clickcount = Number(sessionStorage.clickcount) - obj.Count;
                    document.getElementById("AddProduct").innerHTML = sessionStorage.clickcount;                    

                    }
      
        }
        console.log(CompleteCart);
        
    }
}


function clickCloseModal() {
    var closeModal = document.getElementById('cartModal');
    $(closeModal).modal('hide');

}

function submitCategoryForm(category) {
        document.getElementById("category-input").value = category;
        document.getElementById("category-form").submit();
    }













