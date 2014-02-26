# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  transfer.setupForm()

transfer =
  setupForm: ->
    $('#new_payment').submit ->
        if $('input').length  > 5
          $('input[type=submit]').attr('disabled', true)
          Stripe.bankAccount.createToken($('#new_payment'), transfer.handleStripeResponse)
          false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_payment').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_payment')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)