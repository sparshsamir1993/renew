# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "click", ".addToCart", ->
    service_id = this.getAttribute("data-service_id")
    model_id = this.getAttribute("data-model_id")
    user_id = $("#uId").attr("name")
    ele = this;
    $.ajax "/order_services",
        type: "POST"
        dataType: 'json'
        data: {
            service_id: service_id
            model_id: model_id
            user_id: user_id
            template: false
        }
        success:(data, textStatus, xhr) ->
            $("#servicesList").attr("data-orderId", data[0].order_id)
            console.log(data)
            console.log(xhr)
            count = data.length
            $("#cart").html("cart " + count )
            console.log(ele)
            parent = $(ele).parent()[0]
            $(parent).html("<a class=\"deleteFromCart\" data-service_id=" + service_id + " data-model_id=" + model_id + " data-user_id=" + user_id + ">Delete</a>")


$(document).on "click", ".deleteFromCart", ->
    service_id = this.getAttribute("data-service_id")
    model_id = this.getAttribute("data-model_id")
    user_id = $("#uId").attr("name")
    ele = this;
    $.ajax "/order_services/"+service_id,
        type: "DELETE"
        dataType: 'json'
        data: {
            service_id: service_id
            model_id: model_id
            user_id: user_id
            template: false
        }
        success:(data, textStatus, xhr) ->
            console.log(data)
            console.log(xhr)
            count = data.length
            $("#cart").html("cart " + count )
            console.log(ele)
            parent = $(ele).parent()[0]
            $(parent).html("<a class=\"addToCart\" data-service_id=" + service_id + " data-model_id=" + model_id + " data-user_id=" + user_id + ">Add to Cart</a>")
