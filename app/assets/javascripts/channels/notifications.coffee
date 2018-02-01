App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (review) ->
    $('#review_notification').text("You have just received a review" + review.product + ", with a rating of " + review.rating)
